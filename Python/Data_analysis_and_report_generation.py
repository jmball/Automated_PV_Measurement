# Figures can be saved either to pdf or pptx (or both). Comment out
# lines as appropriate.

import os
from functools import reduce

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib import gridspec
from matplotlib.backends.backend_pdf import PdfPages
from scipy import signal

# Choose folder containing data and log file path. Remember to use all forward
# slashes
folderpath = r'C:/SolarSimData/James B/2016/11-Nov/11-30-2016 Test 16/'
folderpath_jv = 'J-V/'
folderpath_time = 'Time Dependence/'
folderpath_maxp = 'Max P Stabilisation/'
folderpath_intensity = 'Intensity Dependence/'
folderpath_eqe = 'EQE/'
filepath_jv = r'TEST 16_LOG.txt'
log_file_jv = folderpath + folderpath_jv + filepath_jv

# Get username, date, and experiment title from file path for title page of
# the report.
folderpath_split = folderpath.split('/')
username = folderpath_split[2]
date = folderpath_split[5][0:9]
experiment_title = folderpath_split[5][11:-1]

# Create pdf for adding figures
pp = PdfPages(log_file_jv.replace('.txt', '_summary.pdf'))

# Import log file into a Pandas dataframe
data = pd.read_csv(log_file_jv,
                   delimiter='\t',
                   header=0,
                   names=['Label', 'Pixel', 'Condition', 'Variable', 'Value',
                          'Position', 'Jsc', 'Voc', 'PCE', 'FF', 'Area',
                          'Stabil_Level', 'Stabil_time', 'Meas_delay', 'Vmp',
                          'File_Path', 'Scan_rate', 'Scan_direction',
                          'Intensity'])


# Define a function to do extra analysis on the measured JV curves
def extra_JV_analysis(filepath, Jsc, Vmp, Voc, Area):
    """

    Function for quantifying the properties of a solar cell J-V curve beyond
    the basic Jsc, Voc, FF, and PCE:

        - Estimates for the series and shunt resistances from the gradients at
        open-circuit and short-circuit, respectively.

    """

    # Import the data
    JV = np.genfromtxt(filepath, delimiter='\t')
    JV = JV[~np.isnan(JV).any(axis=1)]

    # Get indices of Jsc, Vmp, and Voc in data array
    V = np.around(JV[:, 0], 2)
    Voc = np.around(Voc, 2)
    Vmp = np.around(Vmp, 2)
    Jsc_i = np.where(V == 0)
    if Vmp > 0:
        Voc_i = np.where(V == Voc)
    else:
        Voc_i = np.where(V == -Voc)

# Convert current density (in mA/cm^2) to current (in A) for diode
# equivalent circuit fitting
    I = JV[:, 1] * Area / 1000
    IV = np.column_stack((JV[:, 0], I))

    # Estimate Rs and Rsh from gradients
    dI_dV = np.gradient(IV[:, 1], IV[1, 0] - IV[0, 0])
    dI_dV_sgfilter = signal.savgol_filter(dI_dV, 15, 3)
    try:
        Rs_grad = 1 / dI_dV_sgfilter[Voc_i[0][0]]
        Rsh_grad = 1 / dI_dV_sgfilter[Jsc_i[0][0]]
    except IndexError:
        Rs_grad = 0.1
        Rsh_grad = 0.1

# if np.size(Rs_grad) == 0:
#    Rs_grad = np.array([0])
#    Rsh_grad = np.array([0])

    return [Rs_grad, Rsh_grad]

# Use the extra analysis function to perform extra analysis and create new
# series for the dataframe
Rs_grad = []
Rsh_grad = []
for i in range(len(data['File_Path'])):
    file = data['File_Path'][i]
    new_path = file.replace('\\', '\\\\')
    Jsc = data['Jsc'][i]
    Vmp = data['Vmp'][i]
    Voc = data['Voc'][i]
    Area = data['Area'][i]
    if data['Condition'][i] == 'Light':
        extra_parameters = extra_JV_analysis(new_path, Jsc, Vmp, Voc, Area)
        Rs_grad.append(extra_parameters[0])
        Rsh_grad.append(extra_parameters[1])
    else:
        Rs_grad.append(0)
        Rsh_grad.append(0)

# Add new series to the dataframe
data['Rs_grad'] = pd.Series(Rs_grad, index=data.index)
data['Rsh_grad'] = pd.Series(Rsh_grad, index=data.index)

# Save the datafram containing additional analysis as a text file
data.to_csv(log_file_jv.replace('.txt', '_extra.txt'), sep='\t')

# Sort and filter the data to remove cells that are not working, leaving only
# best scan for each pixel
sorted_data = data.sort_values(['Variable', 'Value', 'Label', 'Pixel', 'PCE'],
                               ascending=[True, True, True, True, False])
filtered_data = sorted_data[(sorted_data.Condition == 'Light') & (
    sorted_data.FF > 0.1) & (sorted_data.FF < 0.9) & (sorted_data.Jsc > 0.01)]
filtered_data_HL = sorted_data[(sorted_data.Condition == 'Light') & (
    sorted_data.FF > 0.1) & (sorted_data.FF < 0.9) & (sorted_data.Jsc > 0.01) &
                               (sorted_data.Scan_direction == 'HL')]
filtered_data_LH = sorted_data[(sorted_data.Condition == 'Light') & (
    sorted_data.FF > 0.1) & (sorted_data.FF < 0.9) & (sorted_data.Jsc > 0.01) &
                               (sorted_data.Scan_direction == 'LH')]
filtered_data = filtered_data.drop_duplicates(['Label', 'Pixel'])
filtered_data_HL = filtered_data_HL.drop_duplicates(['Label', 'Pixel'])
filtered_data_LH = filtered_data_LH.drop_duplicates(['Label', 'Pixel'])

# Drop pixels only working in one scan direction
labels_LH = filtered_data_LH['Label'].unique()
label_existing_HL = []
for label in filtered_data_HL.Label:
    if label in labels_LH:
        label_existing_HL.append(True)
    else:
        label_existing_HL.append(False)
filtered_data_HL = filtered_data_HL[label_existing_HL]

labels_HL = filtered_data_HL['Label'].unique()
label_existing_LH = []
for label in filtered_data_LH.Label:
    if label in labels_HL:
        label_existing_LH.append(True)
    else:
        label_existing_LH.append(False)
filtered_data_LH = filtered_data_LH[label_existing_LH]

# Calculate proportion of working pixels.
group_var_s = sorted_data.drop_duplicates(['Label', 'Pixel'])
group_var_s = group_var_s.groupby(['Variable'])
names_var_s = []
len_var_s = []
names_var_lab_s = []
len_var_lab_s = []
for name, group in group_var_s:
    group_val_s = group.groupby(['Value'])
    group_lab_s = group.groupby(['Label'])
    names_val_s = []
    len_val_s = []
    names_lab_s = []
    len_lab_s = []
    for name, group in group_val_s:
        names_val_s.append(name)
        len_val_s.append(len(group))
    for name, group in group_lab_s:
        names_lab_s.append(name)
        len_lab_s.append(len(group))
    names_var_s.append(names_val_s)
    len_var_s.append(len_val_s)
    names_var_lab_s.append(names_lab_s)
    len_var_lab_s.append(len_lab_s)

group_var_f = filtered_data_HL.drop_duplicates(['Label', 'Pixel'])
group_var_f = group_var_f.groupby(['Variable'])
names_var_f = []
len_var_f = []
names_var_lab_f = []
len_var_lab_f = []
for name, group in group_var_f:
    group_val_f = group.groupby(['Value'])
    group_lab_f = group.groupby(['Label'])
    names_val_f = []
    len_val_f = []
    names_lab_f = []
    len_lab_f = []
    for name, group in group_val_f:
        names_val_f.append(name)
        len_val_f.append(len(group))
    for name, group in group_lab_f:
        names_lab_f.append(name)
        len_lab_f.append(len(group))
    names_var_f.append(names_val_f)
    len_var_f.append(len_val_f)
    names_var_lab_f.append(names_lab_f)
    len_var_lab_f.append(len_lab_f)

yields_var = []
i = 0
j = 0
for name_var, length_var in zip(names_var_s, len_var_s):
    yields_val = []
    if name_var in names_var_f:
        for name, length in zip(name_var, length_var):
            if name in names_var_f[j]:
                yields_val.append(len_var_f[j][i] * 100 / length)
                i += 1
            else:
                yields_val.append(0)
        j += 1
    else:
        yields_var.append(0 * len(name_var))
    yields_var.append(yields_val)

yields_var_lab = []
i = 0
j = 0
for name_var_lab, length_var_lab in zip(names_var_lab_s, len_var_lab_s):
    yields_lab = []
    if name_var_lab in names_var_lab_f:
        for name, length in zip(name_var_lab, length_var_lab):
            if name in names_var_lab_f[j]:
                yields_lab.append(len_var_lab_f[j][i] * 100 / length)
                i += 1
            else:
                yields_lab.append(0)
        j += 1
    else:
        yields_lab.append(0 * len(name_var_lab))
    yields_var_lab.append(yields_lab)

# To generate box plots the data needs to be grouped first by variable
grouped_by_var_HL = filtered_data_HL.groupby('Variable')
grouped_by_var_LH = filtered_data_LH.groupby('Variable')


# Then it needs to be grouped by variable value. Each of these groupings is
# appended to a list that is iterated upon later to generate the plots
def boxplotdata(grouped_by_var):
    """

    Function for sorting log file data grouped by variable into series for
    boxplots.

    """

    Jsc_var = []
    Voc_var = []
    FF_var = []
    PCE_var = []
    Rs_var = []
    Rsh_var = []
    names_var = []
    var_names = []
    for name, group in grouped_by_var:
        grouped_by_val = group.groupby('Value')
        var_names.append(name)
        Jsc = []
        Voc = []
        FF = []
        PCE = []
        Rs = []
        Rsh = []
        names_val = []
        for name, group in grouped_by_val:
            names_val.append(name)
            Jsc.append(np.array(group['Jsc']))
            Voc.append(np.array(group['Voc']))
            FF.append(np.array(group['FF']))
            PCE.append(np.array(group['PCE']))
            Rs.append(np.array(group['Rs_grad']))
            Rsh.append(np.array(group['Rsh_grad']))
        Jsc_var.append(Jsc)
        Voc_var.append(Voc)
        FF_var.append(FF)
        PCE_var.append(PCE)
        Rs_var.append(Rs)
        Rsh_var.append(Rsh)
        names_var.append(names_val)
    return {'Jsc_var': Jsc_var,
            'Voc_var': Voc_var,
            'FF_var': FF_var,
            'PCE_var': PCE_var,
            'Rs_var': Rs_var,
            'Rsh_var': Rsh_var,
            'names_var': names_var,
            'var_names': var_names}

# Create variables holding a dictionary for accessing lists of data for
# boxplots
boxplotdata_HL = boxplotdata(grouped_by_var_HL)
boxplotdata_HL['Yield_var'] = yields_var
boxplotdata_HL['Yield_var_lab'] = yields_var_lab
boxplotdata_LH = boxplotdata(grouped_by_var_LH)

# Define some properties of the box plots
boxprops_HL = dict(color='blue')
boxprops_LH = dict(color='red')
capprops_HL = dict(color='blue')
capprops_LH = dict(color='red')
whiskerprops_HL = dict(color='blue', linestyle='-')
whiskerprops_LH = dict(color='red', linestyle='-')
medianprops_HL = dict(color='blue')
medianprops_LH = dict(color='red')


def subboxplot(boxplotdata_HL, boxplotdata_LH, p, unit, i):
    """

    Make boxplot subplot for a given J-V curve parameter.

    - p = parameter as string e.g. 'Jsc', 'Voc', ...etc.
    - unit = unit for the parameter  as string e.g. '(mA/cm^2)' etc. The unit
    should include brackets to ensure the axis label makes sense.

    """

    plt.boxplot(boxplotdata_HL[p + '_var'][i], showfliers=False,
                labels=boxplotdata_HL['names_var'][i], boxprops=boxprops_HL,
                whiskerprops=whiskerprops_HL, capprops=capprops_HL,
                medianprops=medianprops_HL)
    plt.boxplot(boxplotdata_LH[p + '_var'][i], showfliers=False,
                labels=boxplotdata_LH['names_var'][i], boxprops=boxprops_LH,
                whiskerprops=whiskerprops_LH, capprops=capprops_LH,
                medianprops=medianprops_LH)
    plt.xticks(rotation=45, ha='right')
    plt.ylabel(p + ' ' + unit)
    plt.scatter(x,
                np.concatenate(boxplotdata_HL[p + '_var'][i]),
                c='blue',
                marker='x')
    plt.scatter(x,
                np.concatenate(boxplotdata_LH[p + '_var'][i]),
                c='red',
                marker='x')
    if p == 'FF':
        plt.ylim([0, 1])
    elif (p == 'Rs') or (p == 'Rsh'):
        plt.yscale('log')
    else:
        plt.ylim(ymin=0)

# Scale figures to a landscape A4 page in inches
# A4_height = 8.27
# A4_width = 11.69
A4_height = 7.5
A4_width = 10

# Iterate through the lists of grouped data to produce boxplots. Each plot
# will contain all data from all values of a variable including a 'Control'
# sample if one is given. Multiple plots are created if there is more than
# one variable.
for i in range(len(boxplotdata_HL['var_names'])):
    if boxplotdata_HL['var_names'][i] != 'Control':
        for j in range(len(boxplotdata_HL['names_var'])):
            if boxplotdata_HL['names_var'][j][0] == 'Control':
                boxplotdata_HL['names_var'][i].append(boxplotdata_HL[
                    'names_var'][j][0])
                boxplotdata_HL['Jsc_var'][i].append(boxplotdata_HL['Jsc_var'][
                    j][0])
                boxplotdata_HL['Voc_var'][i].append(boxplotdata_HL['Voc_var'][
                    j][0])
                boxplotdata_HL['FF_var'][i].append(boxplotdata_HL['FF_var'][j][
                    0])
                boxplotdata_HL['PCE_var'][i].append(boxplotdata_HL['PCE_var'][
                    j][0])
                boxplotdata_HL['Rs_var'][i].append(boxplotdata_HL['Rs_var'][j][
                    0])
                boxplotdata_HL['Rsh_var'][i].append(boxplotdata_HL['Rsh_var'][
                    j][0])
        x = []
        for k in range(1, 1 + len(boxplotdata_HL['names_var'][i])):
            x.extend([k] * len(boxplotdata_HL['Jsc_var'][i][k - 1]))
        plt.figure(i + 2 * i, figsize=(A4_width, A4_height), dpi=300)
        plt.suptitle(boxplotdata_HL['var_names'][i] + ' basic parameters',
                     fontsize=14, fontweight='bold')
        plt.subplot(2, 2, 1)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'Jsc', '(mA/cm^2)', i)
        plt.subplot(2, 2, 2)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'Voc', '(V)', i)
        plt.subplot(2, 2, 3)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'FF', '', i)
        plt.subplot(2, 2, 4)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'PCE', '(%)', i)
        plt.tight_layout()
        plt.subplots_adjust(top=0.92)
        plt.savefig(log_file_jv.replace('.txt', '_' + boxplotdata_HL[
            'var_names'][i] + '_basic_boxplots.png'))
        pp.savefig()

        plt.figure(i + 1 + 2 * i, figsize=(A4_width, A4_height), dpi=300)
        plt.suptitle(boxplotdata_HL['var_names'][i] +
                     ' series and shunt resistances; yields', fontsize=14,
                     fontweight='bold')
        plt.subplot(2, 2, 1)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'Rs', '(ohms)', i)
        plt.subplot(2, 2, 2)
        subboxplot(boxplotdata_HL, boxplotdata_LH, 'Rsh', '(ohms)', i)
        plt.subplot(2, 2, 3)
        plt.bar(
            range(len(yields_var[i])),
            yields_var[i],
            align='center',
            width=0.25,
            edgecolor='black',
            color='green')
        plt.xticks(
            range(len(yields_var[i])),
            boxplotdata_HL['names_var'][i], rotation=45)
        plt.ylabel('Yield (%)')
        plt.ylim([0, 102])
        plt.subplot(2, 2, 4)
        plt.bar(
            range(len(yields_var_lab[i])),
            yields_var_lab[i],
            align='center',
            width=0.25,
            edgecolor='black',
            color='green')
        plt.xticks(
            range(len(yields_var_lab[i])),
            names_var_lab_s[i],
            rotation=45)
        plt.ylabel('Yield (%)')
        plt.ylim([0, 102])
        plt.tight_layout()
        plt.subplots_adjust(top=0.92)
        plt.savefig(log_file_jv.replace('.txt', '_' + boxplotdata_HL[
            'var_names'][i] + '_series_shunt_resistances_yields.png'))
        pp.savefig()

# Group data by label and sort ready to plot graph of all pixels per substrate
re_sort_data = filtered_data.sort_values(['Label', 'Pixel'],
                                         ascending=[True, True])
grouped_by_label = re_sort_data.groupby('Label')

# Get parameters for defining position of figures in subplot, attempting to
# make it as square as possible
no_of_subplots = len(grouped_by_label)
subplot_rows = np.ceil(no_of_subplots**(1 / 2))
subplot_cols = np.ceil(no_of_subplots / subplot_rows)

# Get colormap
cmap = plt.cm.get_cmap('rainbow')

# Create lists of varibales, values, and labels for labelling figures
substrates = re_sort_data.drop_duplicates(['Label'])
variables = list(substrates['Variable'])
values = list(substrates['Value'])
labels = list(substrates['Label'])

# Create main figure
plt.figure(figsize=(A4_width, A4_height), dpi=300)
plt.suptitle('JV scans of every working pixel', fontsize=10, fontweight='bold')
i = 1
for name, group in grouped_by_label:
    plt.subplot(subplot_rows, subplot_cols, i)
    plt.axhline(0, lw=0.5, c='black')
    plt.title(
        str(labels[i - 1]) + ', ' + str(variables[i - 1]) + ', ' +
        str(values[i - 1]),
        fontsize=8)

    c_div = 1 / len(group)
    j = 0
    pixels = list(group['Pixel'])
    max_group_jsc = max(list(group['Jsc']))
    for file in group['File_Path']:
        new_path = file.replace('\\', '\\\\')

        if '_LH_' in new_path:
            data_LH_path = new_path
            data_HL_path = new_path.replace('_LH_', '_HL_')
        else:
            data_HL_path = new_path
            data_LH_path = new_path.replace('_HL_', '_LH_')

        data_LH = np.genfromtxt(data_LH_path, delimiter='\t')
        data_HL = np.genfromtxt(data_HL_path, delimiter='\t')
        data_LH = data_LH[~np.isnan(data_LH).any(axis=1)]
        data_HL = data_HL[~np.isnan(data_HL).any(axis=1)]

        plt.plot(data_LH[:, 0],
                 data_LH[:, 1],
                 label=pixels[j],
                 c=cmap(j * c_div),
                 lw=2.0)
        plt.plot(data_HL[:, 0], data_HL[:, 1], c=cmap(j * c_div), lw=2.0)

        j += 1

    plt.xlabel('Applied bias (V)', fontsize=7)
    plt.xticks(fontsize=7)
    plt.ylabel('J (mA/cm^2)', fontsize=7)
    plt.yticks(fontsize=7)
    plt.ylim([-max_group_jsc * 1.1, max_group_jsc * 1.1])
    plt.legend(loc='best', prop={'size': 6})

    i += 1

plt.tight_layout()
plt.subplots_adjust(top=0.92)
plt.savefig(log_file_jv.replace('.txt', '_all_JVs.png'))
pp.savefig()

# filter dataframe to leave on the best pixel for each variable value
sort_best_pixels = filtered_data.sort_values(['Variable', 'Value', 'PCE'],
                                             ascending=[True, True, False])
best_pixels = sort_best_pixels.drop_duplicates(['Variable', 'Value'])

# get parameters for defining position of figures in subplot, attempting to
# make it as square as possible
no_of_subplots = len(best_pixels['File_Path'])
subplot_rows = np.ceil(no_of_subplots**(1 / 2))
subplot_cols = np.ceil(no_of_subplots / subplot_rows)

# create lists of varibales and values for labelling figures
variables = list(best_pixels['Variable'])
values = list(best_pixels['Value'])
jscs = list(best_pixels['Jsc'])

# create main figure
plt.figure(figsize=(A4_width, A4_height), dpi=300)
plt.suptitle('Best pixels', fontsize=10, fontweight='bold')

# initialise index for subplot and start looping through best cells dataframe
i = 1

# Loop for iterating through best pixels dataframe and picking out JV data
# files. Each plot contains forward and reverse sweeps, both light and dark.
for file in best_pixels['File_Path']:
    new_path = file.replace('\\', '\\\\')

    if '_LH_' in new_path:
        JV_light_LH_path = new_path
        JV_light_HL_path = new_path.replace('_LH_', '_HL_')
    else:
        JV_light_HL_path = new_path
        JV_light_LH_path = new_path.replace('_HL_', '_LH_')

    try:
        JV_light_LH_data = np.genfromtxt(JV_light_LH_path, delimiter='\t')
        JV_light_HL_data = np.genfromtxt(JV_light_HL_path, delimiter='\t')
        JV_dark_LH_data = np.genfromtxt(
            JV_light_LH_path.replace('Light', 'Dark'),
            delimiter='\t')
        JV_dark_HL_data = np.genfromtxt(
            JV_light_HL_path.replace('Light', 'Dark'),
            delimiter='\t')
    except OSError:
        pass

    JV_light_LH_data = JV_light_LH_data[~np.isnan(JV_light_LH_data).any(
        axis=1)]
    JV_light_HL_data = JV_light_HL_data[~np.isnan(JV_light_HL_data).any(
        axis=1)]

    try:
        JV_dark_LH_data = JV_dark_LH_data[~np.isnan(JV_dark_LH_data).any(
            axis=1)]
        JV_dark_HL_data = JV_dark_HL_data[~np.isnan(JV_dark_HL_data).any(
            axis=1)]
    except NameError:
        pass

    plt.subplot(subplot_rows, subplot_cols, i)
    plt.axhline(0, lw=0.5, c='black')
    plt.title(str(variables[i - 1] + ', ' + values[i - 1]), fontsize=8)
    plt.plot(JV_light_LH_data[:, 0],
             JV_light_LH_data[:, 1],
             label='l f->s',
             c='red',
             lw=2.0)
    plt.plot(JV_light_HL_data[:, 0],
             JV_light_HL_data[:, 1],
             label='l s->f',
             c='green',
             lw=2.0)
    try:
        plt.plot(JV_dark_LH_data[:, 0],
                 JV_dark_LH_data[:, 1],
                 label='d f->s',
                 c='blue',
                 lw=2.0)
        plt.plot(JV_dark_HL_data[:, 0],
                 JV_dark_HL_data[:, 1],
                 label='d s->f',
                 c='orange',
                 lw=2.0)
    except NameError:
        pass
    plt.xlabel('Applied bias (V)', fontsize=7)
    plt.xticks(fontsize=7)
    plt.ylabel('J (mA/cm^2)', fontsize=7)
    plt.yticks(fontsize=7)
    plt.ylim([-jscs[i - 1] * 1.1, jscs[i - 1] * 1.1])
    plt.legend(loc='best', prop={'size': 6})

    i += 1

plt.tight_layout()
plt.subplots_adjust(top=0.92)
plt.savefig(log_file_jv.replace('.txt', '_best_JVs.png'))
pp.savefig()


# Check whether other experiments have been performed and therefore if more
# data needs to be analysed.
def exp_file_list(folderpath):
    """

    Determine whether data exists for an additional experiment. If so, make
    a list of files. Returns a dictionary containing a boolean indicating
    existance and a list of files (empty if experiment hasn't been performed).

    """

    files = []
    files_split = []
    if os.path.exists(folderpath):
        exists = True
        for f in os.listdir(folderpath):
            if f.endswith('.txt'):
                files.append(folderpath + f)
                files_split.append(f.split('_'))
        if len(files) == 0:
            exists = False
    else:
        exists = False

    return {'exists': exists, 'files': files, 'files_split': files_split}


# Build a log dataframe from from experiment files and master J-V log.
def build_log_df(exp_files, master_log):
    """

    Build a log dataframe from from experiment files and master J-V log.

    """

    labels = []
    pixels = []
    scan_dir = []
    for item in exp_files['files_split']:
        labels.append(item[0])
        pixels.append(item[1])
        scan_dir.append(item[3])
    files_dict = {'Label': labels,
                  'Pixel': pixels,
                  'File_Path': exp_files['files'],
                  'Scan_direction': scan_dir}
    files_df = pd.DataFrame(files_dict)
    unique_labels_df = master_log.drop_duplicates(['Label'])
    vars = []
    vals = []
    for item in files_df['Label']:
        row = unique_labels_df[unique_labels_df.Label == item]
        vars.append(row['Variable'][0])
        vals.append(row['Value'][0])
    files_df['Variable'] = vars
    files_df['Value'] = vals

    return files_df


# Function for calculating all factors of an integer.
def factors(n):
    """

    Returns a set of factors of the integer n.

    """

    pairs = [[i, n // i] for i in range(1, int(n**0.5) + 1) if n % i == 0]
    return set(reduce(list.__add__, pairs))


# Function for calculting the tick positions for a plot axis.
def calc_ticks(data_min, data_max):
    """

    Returns an array of axis tick labels given the max and min values of
    the data to be plotted.

    """

    min_digs, min_order = map(float, ('%.6e' % data_min).split('e'))
    max_digs, max_order = map(float, ('%.6e' % data_max).split('e'))
    min_order -= 1
    max_order -= 1
    if max_order > min_order:
        min_digs = np.floor(min_digs * 10**(min_order - max_order + 1))
        max_digs = np.ceil(max_digs * 10)
        y_range_digs = max_digs - min_digs
        while np.max(list(filter(lambda x: x < 8, factors(y_range_digs)))) < 3:
            y_range_digs += 2
            min_digs -= 1
            max_digs += 1
        num_ticks = np.max(list(filter(lambda x: x < 8, factors(
            y_range_digs))))
        min_tick = min_digs * 10**max_order
        ticks = np.linspace(min_tick, y_range_digs * 10**max_order + min_tick,
                            num_ticks + 1)
    elif min_order > max_order:
        min_digs = np.floor(min_digs * 10)
        max_digs = np.ceil(max_digs * 10**(max_order - min_order + 1))
        y_range_digs = max_digs - min_digs
        while np.max(list(filter(lambda x: x < 8, factors(y_range_digs)))) < 3:
            y_range_digs += 2
            min_digs -= 1
            max_digs += 1
        num_ticks = np.max(list(filter(lambda x: x < 8, factors(
            y_range_digs))))
        min_tick = min_digs * 10**min_order
        ticks = np.linspace(min_tick, y_range_digs * 10**min_order + min_tick,
                            num_ticks + 1)
    elif max_order == min_order:
        str_min = str(min_digs).replace('.', '').replace('-', '')
        str_max = str(max_digs).replace('.', '').replace('-', '')
        i = 0
        while str_min[i] == str_max[i]:
            i += 1
            if i == len(str_min):
                break
        if i == len(str_min):
            ticks = np.array([min_digs * 10**(min_order + 1)])
        else:
            min_digs = np.floor(min_digs * 10**(1 + i))
            max_digs = np.ceil(max_digs * 10**(1 + i))
            y_range_digs = max_digs - min_digs
            while np.max(list(filter(lambda x: x < 8, factors(
                    y_range_digs)))) < 3:
                y_range_digs += 2
                min_digs -= 1
                max_digs += 1
            num_ticks = np.max(list(filter(lambda x: x < 8, factors(
                y_range_digs))))
            min_tick = min_digs * 10**(min_order - i)
            ticks = np.linspace(min_tick, y_range_digs * 10**
                                (min_order - i) + min_tick, num_ticks + 1)

    return ticks

# Build a time dependence log dataframe from file paths and J-V log file.
time_files = exp_file_list(folderpath + folderpath_time)
if time_files['exists']:
    time_files_df = build_log_df(time_files, sorted_data)

    sorted_time_files = time_files_df.sort_values(
        ['Label', 'Pixel', 'Scan_direction'],
        ascending=[True, True, True])
    sorted_time_files = sorted_time_files.drop_duplicates(['Label', 'Pixel'])

    i = 0
    i_max = len(sorted_time_files) - 1
    j = 0
    for index, row in sorted_time_files.iterrows():
        if i % 4 == 0:
            fig = plt.figure(figsize=(A4_width, A4_height), dpi=300)
            fig.suptitle('J-t characterics', fontsize=10, fontweight='bold')
            gs = gridspec.GridSpec(7, 2)
            j += 1
        path_HL = row['File_Path']
        path_LH = path_HL.replace('HL', 'LH')
        data_HL = np.genfromtxt(path_HL)
        data_LH = np.genfromtxt(path_LH)
        data_HL = data_HL[~np.isnan(data_HL).any(axis=1)]
        data_LH = data_LH[~np.isnan(data_LH).any(axis=1)]
        data = np.vstack([data_HL, data_LH])
        ax1 = fig.add_subplot(gs[(int(np.floor((i / 2) % 2)) * 4):(int(
            np.floor((i / 2) % 2)) * 4) + 2, i % 2])
        ax1.plot(data[:, 0], data[:, 2], 'blue')
        yticks = calc_ticks(np.min(data[:, 2]), np.max(data[:, 2]))
        ax1.set_yticks(yticks)
        ax1.set_yticklabels(yticks, fontsize=7)
        ax1.set_ylim([yticks[0], yticks[-1]])
        ax1.set_ylabel('J (mA/cm^2)', fontsize=7)
        xticks = calc_ticks(np.min(data[:, 0]), np.max(data[:, 0]))
        ax1.set_xticks(xticks)
        ax1.set_xticklabels([])
        ax1.set_xlim([xticks[0], xticks[-1]])
        ax1.set_title(row['Label'] + ', pixel ' + row['Pixel'] + ', ' +
                      row['Variable'] + ', ' + row['Value'],
                      fontsize=9)
        ax2 = fig.add_subplot(gs[(int(np.floor((i / 2) % 2)) * 4) + 2, i % 2])
        ax2.plot(data[:, 0], data[:, 1], 'black')
        yticks = calc_ticks(np.min(data[:, 1]), np.max(data[:, 1]))
        ytick_range = yticks[-1] - yticks[0]
        ax2.set_yticks(yticks)
        ax2.set_yticklabels(yticks, fontsize=7)
        ax2.set_ylim(
            [yticks[0] - 0.05 * ytick_range, yticks[-1] + 0.05 * ytick_range])
        ax2.set_ylabel('Bias (V)', fontsize=7)
        ax2.set_xticks(xticks)
        ax2.set_xticklabels(xticks, fontsize=7)
        ax2.set_xlim([xticks[0], xticks[-1]])
        ax2.set_xlabel('Time (s)', fontsize=7)
        if (i % 4 == 3) or (i == i_max):
            gs.update(wspace=0.3, hspace=0.1)
            fig.savefig(log_file_jv.replace('.txt', '_jt_characteristics' + '_'
                                            + str(j) + '.png'))
            pp.savefig()
        i += 1

# Build a max power stabilisation log dataframe from file paths and J-V log
# file.
maxp_files = exp_file_list(folderpath + folderpath_maxp)
if maxp_files['exists']:
    maxp_files_df = build_log_df(maxp_files, sorted_data)

    colors = ('Green', 'Red', 'Blue')
    labels = ('Applied Bias (V)', '|J| (mA/cm^2)', 'PCE (%)')
    cols = (1, 3, 5)
    i = 0
    i_max = len(maxp_files_df) - 1
    j = 0
    for index, row in maxp_files_df.iterrows():
        if i % 4 == 0:
            fig = plt.figure(figsize=(A4_width, A4_height), dpi=300)
            fig.suptitle('Maximum power stabilisation',
                         fontsize=10,
                         fontweight='bold')
            gs = gridspec.GridSpec(2, 2)
            j += 1
        path = row['File_Path']
        data = np.genfromtxt(path, delimiter='\t')
        data = data[~np.isnan(data).any(axis=1)]
        ax = fig.add_subplot(gs[int(np.floor(i / 2)), i % 2])
        ax.set_title(row['Label'] + ', pixel ' + row['Pixel'] + ', ' +
                     row['Variable'] + ', ' + row['Value'],
                     fontsize=9)
        axes = [ax, ax.twinx(), ax.twinx()]
        axes[-1].spines['right'].set_position(('axes', 1.2))
        axes[-1].set_frame_on(True)
        axes[-1].patch.set_visible(False)
        for ax, color, col, label in zip(axes, colors, cols, labels):
            ax.plot(data[:, 0], np.absolute(data[:, col]), color=color)
            ax.set_ylabel(label, color=color)
            ax.tick_params(axis='y', colors=color)
        axes[0].set_xlabel('Time (s)')
        if (i % 4 == 3) or (i == i_max):
            gs.update(wspace=0.6, hspace=0.3)
            fig.savefig(log_file_jv.replace('.txt', '_max_P_stab' + '_' + str(
                j) + '.png'))
            pp.savefig()
        i += 1

# if time_files['exits'] == True:
#    for f in time_files['files']:
#        try:
#            Jt_data = np.genfromtxt(f, delimiter='\t')
#        except OSError:
#            pass

# Close pdf of saved figures
pp.close()

# Find all png's in a folder and make a pptx
# os.chdir(folderpath)
# images = [f for f in os.listdir(folderpath)
#          if os.path.isfile(os.path.join(folderpath,f)) and f.endswith('png')]

# prs = Presentation()
# blank_slide_layout = prs.slide_layouts[6]
# height = prs.slide_height
# width = prs.slide_width
# left = top = Inches(0)
# for image in images:
#    slide = prs.slides.add_slide(blank_slide_layout)
#    if image.endswith('resistances.png'):
#        slide.shapes.add_picture(image, left, top, width=width)
#    else:
#        slide.shapes.add_picture(image, left, top, height=height)

# prs.save(log_file.replace('.txt', '_summary.pptx'))
