import time

import numpy as np
import pyvisa

# Filepath for saving data
folderpath = r'C:/SolarSimData/James B/2016/11-Nov/01-11-2016 Manual test2/Max P Stabilisation/'
filename = r'x_1_Light_scan0_MaxPStab.txt'

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
initial_V = 0.644000  # initial Vmp
nplc = 0.01  # integration filter number of power-line cycles
delay = 0  # source delay in seconds
t_track = 30.000000  # time in seconds to track max power for
area = 0.093500  # pixel area in cm^2
suns = 1  # no of suns

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
    times = []
    voltages = []
    currents = []
    powers = []
    current_densities = []
    efficiencies = []
    t_start = time.time()
    t = time.time()
    a = 0.1  # Learning rate
    keithley2400.write(':SOUR:VOLT ' + '0')
    keithley2400.write('OUTP ON')  # turn on ouput
    while t - t_start < 3:  # measure for 4s in the dark
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

keithley2400.write('OUTP OFF')  # Disable output
keithley2400.write(':SOUR2:TTL 1')  # Close shutter
keithley2400.write(':DISP:ENAB 1')  # Turn off display

# Format and save results
np.savetxt(folderpath + filename,
           np.transpose(np.array(mppt_results)),
           fmt='%.9f',
           delimiter='\t',
           newline='\r\n',
           header='Time (s)' + '\t' + 'V' + '\t' + 'I (A)' + '\t' +
           'J (mA/cm^2)' + '\t' + 'P (W)' + '\t' + 'PCE (%)',
           comments='')
