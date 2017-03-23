import argparse
import time

import numpy as np
import pyvisa

# Parse folder path, file name, and measurement parameters from command line
# arguments. Remember to include the "python" keyword before the call to the
# python file from the command line, e.g. python example.py "arg1" "arg2".
# Folder paths must use forward slashes to separate subfolders.
parser = argparse.ArgumentParser(description='Process data files')
parser.add_argument(
    'folder_path',
    metavar='folder_path',
    type=str,
    help='Absolute path to the folder containing max P stabilisation data')
parser.add_argument('file_name',
                    metavar='file_name',
                    type=str,
                    help='Name of the file to save the data to')
parser.add_argument('initial_V',
                    metavar='initial_V',
                    type=float,
                    help='Seed voltage for max power tracker')
parser.add_argument('t_track',
                    metavar='t_track',
                    type=float,
                    help='Time in seconds to track max power for')
parser.add_argument('area',
                    metavar='area',
                    type=float,
                    help='Device area in cm^2')
parser.add_argument('num_of_suns',
                    metavar='num_of_suns',
                    type=float,
                    help='Number of suns equivalent illumination intensity')
args = parser.parse_args()

# Filepath for saving data
folderpath = args.folder_path
filename = args.file_name
# folderpath = r'C:/SolarSimData/James B/2016/11-Nov/01-11-2016 Manual test2/Max P Stabilisation/'
# filename = r'x_1_Light_scan0_MaxPStab.txt'

# Assign the VISA resource to a variable
rm = pyvisa.ResourceManager()
keithley2400 = rm.open_resource('GPIB0::24::INSTR')
keithley2400.query('*IDN?')
keithley2400.write('*RST')
keithley2400.encoding = 'latin-1'

# Settings
V_range = 2  # voltage range
I_range = 0.1  # current range
compliance_I = 0.1  # compliance level
initial_V = args.initial_V
nplc = 0.01  # integration filter number of power-line cycles
delay = 0  # source delay in seconds
t_track = args.t_track
area = args.area
suns = args.num_of_suns

# Initialise Keithley
keithley2400.write('OUTP OFF')  # Disable the output
keithley2400.write(':SYST:RSEN 1')  # Enable 4-wire sense
keithley2400.write(':SOUR:CLE:AUTO OFF')  # Don't auto-off source after meas.
keithley2400.write(':SOUR:FUNC VOLT')  # Set source mode to voltage
keithley2400.write(':SOUR:VOLT:RANG ' + str(V_range))  # Set the voltage range
keithley2400.write(':SOUR:CURR:RANG ' + str(I_range))  # Set the current range
keithley2400.write(':SOUR:DEL ' + str(delay))  # Set the delay
keithley2400.write(
    ':SENS:CURR:PROT ' + str(compliance_I))  # Set the compliance
keithley2400.write(
    ':SENS:CURR:NPLC ' + str(nplc))  # Set the integration filter
keithley2400.write(':DISP:ENAB 0')  # Turn off display


# Function for tracking maximum power point
def track_max_power(initial_V, t_track):
    """
    Function for tracking the maximum power point of a solar cell starting at
    the seed voltage (initial_V) for a fixed amount of time (t_track), taking
    as many measurements as possible.

    Tracking is based on the method of steepest descent as follows:

    V_i+1 = V_i - a * (P_i - P_i-1) / (V_i - V_i-1)

    where V is the applied voltage, P is the power output, i is the current
    time step, i-1 is the previous step, and i+1 will be the next step. The
    learning rate, a, limits or increases the step size and should be tuned to
    ensure the voltage step can update fast enough to follow changes in the
    output but without overshooting. When the voltage stabilises at the
    maximum power point (V_i+1 = V_i) a small purturbation is either added or
    subtracted randomly to ensure that the algorithm can still track changes
    after a period of stability.
    """

    # Initialise empty lists for storing data
    times = []
    voltages = []
    currents = []
    powers = []
    current_densities = []
    efficiencies = []

    # Start timing
    t_start = time.time()
    t = time.time()

    # Set the learning rate
    a = 0.1

    # Turn on the Keithley output at zero volts and measure for 4s in the dark
    keithley2400.write(':SOUR:VOLT ' + '0')
    keithley2400.write('OUTP ON')
    while t - t_start < 3:
        times.append(t - t_start)
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        current_density = data[1] * 1000 / area
        power = data[0] * data[1]
        current = data[1]
        voltage = data[0]
        efficiency = np.absolute(power * 1000 * 100 / (100 * suns * area))
        current_densities.append(current_density)
        powers.append(power)
        currents.append(current)
        voltages.append(voltage)
        efficiencies.append(efficiency)
        t = time.time()

    # Open the shutter of the solar simulator and take a few measurements
    # around the seed voltage to initialise the tracking algorithm.
    keithley2400.write(':SOUR2:TTL 0')  # open the shutter
    initial_V = initial_V - 0.02
    for i in range(2):
        times.append(t - t_start)
        keithley2400.write(':SOUR:VOLT ' + str(initial_V))
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        current_density = data[1] * 1000 / area
        power = data[0] * data[1]
        current = data[1]
        voltage = data[0]
        efficiency = np.absolute(power * 1000 * 100 / (100 * suns * area))
        current_densities.append(current_density)
        powers.append(power)
        currents.append(current)
        voltages.append(voltage)
        efficiencies.append(efficiency)
        initial_V += 0.02
        t = time.time()

    # Start tracking the maximum point using method of steepest descent
    i = len(voltages) - 1
    while t - t_start < t_track + 3:
        if voltages[i] != voltages[i - 1]:
            dP_dV = (powers[i] - powers[i - 1]) / (
                voltages[i] - voltages[i - 1])
        else:
            dP_dV = np.sign((1 - (-1)) * np.random.random_sample() + (
                -1)) * 0.002
        initial_V = voltages[i] - a * dP_dV
        times.append(t - t_start)
        keithley2400.write(':SOUR:VOLT ' + str(initial_V))
        data = keithley2400.query(':MEAS:CURR?')  # Measure the current
        data = data.split(',')
        data = [float(item) for item in data]
        current_density = data[1] * 1000 / area
        power = data[0] * data[1]
        current = data[1]
        voltage = data[0]
        efficiency = np.absolute(power * 1000 * 100 / (100 * suns * area))
        current_densities.append(current_density)
        powers.append(power)
        currents.append(current)
        voltages.append(voltage)
        efficiencies.append(efficiency)
        t = time.time()
        i += 1

    return times, voltages, currents, current_densities, powers, efficiencies

# Track max power
mppt_results = track_max_power(initial_V, t_track)

# Close measurement
keithley2400.write('OUTP OFF')  # Disable output
keithley2400.write(':SOUR2:TTL 1')  # Close shutter
keithley2400.write(':DISP:ENAB 1')  # Turn off display

# Format and save the results
np.savetxt(folderpath + filename,
           np.transpose(np.array(mppt_results)),
           fmt='%.9f',
           delimiter='\t',
           newline='\r\n',
           header='Time (s)' + '\t' + 'V' + '\t' + 'I (A)' + '\t' +
           'J (mA/cm^2)' + '\t' + 'P (W)' + '\t' + 'PCE (%)',
           comments='')
