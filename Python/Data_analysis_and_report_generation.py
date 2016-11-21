# Figures can be saved either to pdf or pptx (or both). Comment out
# lines as appropriate.

# import os

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from matplotlib.backends.backend_pdf import PdfPages
from scipy import signal

# Choose folder containing data and log file path. Remember to use all forward
# slashes
folderpath = r'C:/SolarSimData/James B/2016/09-Sep/9-18-2016 Inverted Optimisation Batch 4-5/'
filepath = r'INVERTED OPTIMISATION BATCH 4-5_LOG.txt'
log_file = folderpath + filepath

# Create pdf for adding figures
pp = PdfPages(log_file.replace('.txt', '_summary.pdf'))

# Import log file into a Pandas dataframe
data = pd.read_csv(log_file,
                   delimiter='\t',
                   header=0,
                   names=['Label', 'Pixel', 'Condition', 'Variable', 'Value',
                          'Position', 'Jsc', 'Voc', 'PCE', 'FF', 'Area',
                          'Stabil. Level', 'Stabil. time', 'Meas. delay',
                          'Vmp', 'File Path', 'Scan rate', 'Scan direction',
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
for i in range(len(data['File Path'])):
    file = data['File Path'][i]
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
data.to_csv(log_file.replace('.txt', '_extra.txt'), sep='\t')

# Sort and filter the data to remove cells that are not working, leaving only
# best scan for each pixel
sorted_data = data.sort_values(['Variable', 'Value', 'Label', 'Pixel', 'PCE'],
                               ascending=[True, True, True, True, False])
filtered_data = sorted_data[(sorted_data.Condition == 'Light') & (
    sorted_data.FF > 0.1) & (sorted_data.FF < 0.9) & (sorted_data.Jsc > 0.01)]
filtered_data = filtered_data.drop_duplicates(['Label', 'Pixel'])

# To generate box plots the data needs to be grouped first by variable
grouped_by_var = filtered_data.groupby('Variable')

# Then it needs to be grouped by variable value. Each of these groupings is
# appended to a list that is iterated upon later to generate the plots
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

# Define some properties of the box plots
boxprops = dict(color='black')
whiskerprops = dict(color='black', linestyle='-')

# Scale figures to a landscape A4 page in inches
# A4_height = 8.27
# A4_width = 11.69
A4_height = 7.5
A4_width = 10

# Iterate through the lists of grouped data to produce boxplots. Each plot
# will contain all data from all values of a variable including a 'Control'
# sample if one is given. Multiple plots are created if there is more than
# one variable.
for i in range(len(var_names)):
    if var_names[i] != 'Control':
        for j in range(len(names_var)):
            if names_var[j][0] == 'Control':
                names_var[i].append(names_var[j][0])
                Jsc_var[i].append(Jsc_var[j][0])
                Voc_var[i].append(Voc_var[j][0])
                FF_var[i].append(FF_var[j][0])
                PCE_var[i].append(PCE_var[j][0])
                Rs_var[i].append(Rs_var[j][0])
                Rsh_var[i].append(Rsh_var[j][0])
        x = []
        for k in range(1, 1 + len(names_var[i])):
            x.extend([k] * len(Jsc_var[i][k - 1]))
        plt.figure(i + 2 * i, figsize=(A4_width, A4_height), dpi=300)
        plt.suptitle(var_names[i] + ' basic parameters',
                     fontsize=14,
                     fontweight='bold')
        plt.subplot(2, 2, 1)
        plt.boxplot(Jsc_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('Jsc (mA/cm^2)')
        plt.scatter(x, np.concatenate(Jsc_var[i]), c='blue', marker='x')
        plt.ylim(ymin=0)
        plt.subplot(2, 2, 2)
        plt.boxplot(Voc_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('Voc (V)')
        plt.scatter(x, np.concatenate(Voc_var[i]), c='blue', marker='x')
        plt.ylim(ymin=0)
        plt.subplot(2, 2, 3)
        plt.boxplot(FF_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('FF')
        plt.scatter(x, np.concatenate(FF_var[i]), c='blue', marker='x')
        plt.ylim([0, 1])
        plt.subplot(2, 2, 4)
        plt.boxplot(PCE_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('PCE (%)')
        plt.scatter(x, np.concatenate(PCE_var[i]), c='blue', marker='x')
        plt.ylim(ymin=0)
        plt.tight_layout()
        plt.subplots_adjust(top=0.92)
        plt.savefig(log_file.replace('.txt', '_' + var_names[i] +
                                     '_basic_boxplots.png'))
        pp.savefig()

        plt.figure(i + 1 + 2 * i, figsize=(A4_width, A4_height), dpi=300)
        plt.suptitle(var_names[i] + ' series and shunt resistances',
                     fontsize=14,
                     fontweight='bold')
        plt.subplot(2, 2, 1)
        plt.boxplot(Rs_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('R_s (ohms)')
        plt.scatter(x, np.concatenate(Rs_var[i]), c='blue', marker='x')
        plt.yscale('log')
        plt.subplot(2, 2, 2)
        plt.boxplot(Rsh_var[i],
                    showfliers=False,
                    labels=names_var[i],
                    boxprops=boxprops,
                    whiskerprops=whiskerprops)
        plt.xticks(rotation=45, ha='right')
        plt.ylabel('R_sh (ohms)')
        plt.scatter(x, np.concatenate(Rsh_var[i]), c='blue', marker='x')
        plt.yscale('log')
        plt.subplot(2, 2, 3)
        plt.axis('off')
        plt.subplot(2, 2, 4)
        plt.axis('off')
        plt.tight_layout()
        plt.subplots_adjust(top=0.92)
        plt.savefig(log_file.replace('.txt', '_' + var_names[i] +
                                     '_series_shunt_resistances.png'))
        pp.savefig()

# Group data by label and sort ready to plot graph of all pixels per substrate
re_sort_data = filtered_data.sort_values(['Label', 'Pixel'],
                                         ascending=[True, True])
grouped_by_label = re_sort_data.groupby('Label')

# get parameters for defining position of figures in subplot, attempting to
# make it as square as possible
no_of_subplots = len(grouped_by_label)
subplot_rows = np.ceil(no_of_subplots**(1 / 2))
subplot_cols = np.ceil(no_of_subplots / subplot_rows)

# Get colormap
cmap = plt.cm.get_cmap('rainbow')

# create lists of varibales, values, and labels for labelling figures
substrates = re_sort_data.drop_duplicates(['Label'])
variables = list(substrates['Variable'])
values = list(substrates['Value'])
labels = list(substrates['Label'])

# create main figure
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
    for file in group['File Path']:
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
plt.savefig(log_file.replace('.txt', '_all_JVs.png'))
pp.savefig()

# filter dataframe to leave on the best pixel for each variable value
sort_best_pixels = filtered_data.sort_values(['Variable', 'Value', 'PCE'],
                                             ascending=[True, True, False])
best_pixels = sort_best_pixels.drop_duplicates(['Variable', 'Value'])

# get parameters for defining position of figures in subplot, attempting to
# make it as square as possible
no_of_subplots = len(best_pixels['File Path'])
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
for file in best_pixels['File Path']:
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
plt.savefig(log_file.replace('.txt', '_best_JVs.png'))
pp.savefig()

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
