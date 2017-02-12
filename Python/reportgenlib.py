# Library of functions for analysis and plotting of the Automated PV
# Measurement data output.

import matplotlib.pyplot as plt
import numpy as np
from matplotlib import gridspec


def create_figure(title,
                  rows,
                  cols,
                  width=10,
                  height=7.5,
                  dpi=300,
                  title_fsize=10,
                  title_fweight='bold'):
    """
    Create a figure object (fig), give it a title, and create a gridspec obejct
    (gs). Subplots are created by fig in positions limited by the dimentions of
    gs.

    title = title of the full page figure
    rows = number of subplot rows
    cols = number of subplot columns
    width = figure width (default 10 is the width of an A4 page in inches)
    height = figure height (default 7.5 is the height of an A4 page in inches)
    dpi = dots per inches of figure output
    title_fsize = fontsize of the title
    """

    fig = plt.figure(figsize=(width, height), dpi=dpi)
    fig.suptitle(title, fontsize=title_fsize, fontweight=title_fweight)
    gs = gridspec.GridSpec(rows, cols)
    return fig, gs


def subboxplot(self,
               boxplotdata_HL,
               boxplotdata_LH,
               scatter_x,
               label_HL,
               label_LH,
               showfliers=False,
               boxprops_HL=dict(color='blue'),
               whiskerprops_HL=dict(color='blue', linestyle='-'),
               capprops_HL=dict(color='blue'),
               medianprops_HL=dict(color='blue'),
               boxprops_LH=dict(color='red'),
               whiskerprops_LH=dict(color='red', linestyle='-'),
               capprops_LH=dict(color='red'),
               medianprops_LH=dict(color='red')):
    """
    Method for creating a formatted subplot boxplot.

    This function will be bound to the matplotlib.axes.SubplotBase class as
    a new method for instances of the class. It should only be called when
    binding the method and after only as a method of SubplotBase objects.
    """

    self.boxplot(boxplotdata_HL,
                 showfliers=showfliers,
                 labels=label_HL,
                 boxprops=boxprops_HL,
                 whiskerprops=whiskerprops_HL,
                 capprops=capprops_HL,
                 medianprops=medianprops_HL)
    self.boxplot(boxplotdata_LH,
                 showfliers=showfliers,
                 labels=label_LH,
                 boxprops=boxprops_LH,
                 whiskerprops=whiskerprops_LH,
                 capprops=capprops_LH,
                 medianprops=medianprops_LH)
    self.xticks(rotation=45, ha='right')
    self.scatter(scatter_x,
                 np.concatenate(boxplotdata_HL),
                 c='blue',
                 marker='x',
                 label='H->L')
    self.scatter(scatter_x,
                 np.concatenate(boxplotdata_LH),
                 c='red',
                 marker='x',
                 label='L->H')


def subbarchart(self, x, y, names):
    """
    Method for creating a formatted subplot bar chart.

    This function will be bound to the matplotlib.axes.SubplotBase class as
    a new method for instances of the class. It should only be called when
    binding the method and after only as a method of SubplotBase objects.
    """

    self.bar(x,
             y,
             align='center',
             width=0.25,
             edgecolor='black',
             color='green')
    self.xticks(x, names, rotation=45)


def set_axes_props(self,
                   plot_title,
                   axis_fsize=10,
                   leg_loc='best',
                   scatterpoints=1,
                   leg_fsize=7,
                   **options):
    """
    Function for setting several properties of the axes of a matplotlib subplot
    at once.

    **options is a dictionary that contains details of optional properties that
    can be formatted. The keys for these options can only be: 'xlabel',
    'ylabel', 'xscale', 'yscale', 'xlim', 'ylim', 'axhline', 'axvline',
    'xticks', 'xticklabels', 'yticks', 'yticklabels'. See
    http://matplotlib.org/api/axes_api.html for further details.

    This function will be bound to the matplotlib.axes.SubplotBase class as
    a new method for instances of the class. It should only be called when
    binding the method and then only as a method of SubplotBase objects.
    """

    if ('xlabel' in options):
        self.set_xlabel(options['xlabel'])
    if ('ylabel' in options):
        self.set_ylabel(options['ylabel'])
    if ('xscale' in options):
        self.set_xscale(options['xscale'])
    if ('yscale' in options):
        self.set_yscale(options['yscale'])
    if ('xlim' in options):
        self.set_xlim(options['xlim'])
    if ('ylim' in options):
        self.set_ylim(options['ylim'])
    if ('axhline' in options):
        self.axhline(options['axhline'], lw=0.5, c='black')
    if ('axvline' in options):
        self.axvline(options['axvline'], lw=0.5, c='black')
    if ('xticks' in options):
        self.set_xticks(options['xticks'])
    if ('xticklabels' in options):
        self.set_xticklabels(options['xticklabels'])
    if ('yticks' in options):
        self.set_yticks(options['yticks'])
    if ('yticklabels' in options):
        self.set_yticklabels(options['yticklabels'])
    self.set_title(plot_title, fontsize=axis_fsize)
    self.legend(loc=leg_loc, scatterpoints=scatterpoints, fontsize=leg_fsize)


def save_image(gs, fig, image_path, wspace, hspace):
    """
    Save an image of fig to a file.
    """

    plt.tight_layout()
    # plt.subplots_adjust(top=0.92)
    gs.update(wspace=wspace, hspace=hspace)
    fig.savefig(image_path)
