# Library of functions for analysis and plotting of the Automated PV
# Measurement data output.

import matplotlib.pyplot as plt
import numpy as np
from matplotlib import gridspec


def create_figure(rows,
                  cols,
                  title=None,
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
    if title is not None:
        fig.suptitle(title, fontsize=title_fsize, fontweight=title_fweight)
    gs = gridspec.GridSpec(rows, cols)
    return fig, gs


def subboxplot(self,
               boxplotdata_HL,
               boxplotdata_LH,
               scatter_x,
               label_HL,
               label_LH,
               set_yscale='linear',
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
    self.set_xticklabels(label_HL, rotation=45, ha='right')
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
    self.set_yscale(set_yscale)


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
    self.set_xticks(x)
    self.set_xticklabels(names, rotation=45)


def set_axes_props(self,
                   title_fsize=10,
                   title=None,
                   xlabel=None,
                   xscale=None,
                   ylabel=None,
                   yscale=None,
                   xlim=None,
                   ylim=None,
                   axhline=None,
                   axvline=None,
                   xticks=None,
                   yticks=None,
                   xticklabels=None,
                   yticklabels=None,
                   legend=False,
                   loc='best',
                   scatterpoints=1,
                   fontsize=8):
    """
    Function for setting several properties of the axes of a matplotlib subplot
    at once.

    See http://matplotlib.org/api/axes_api.html for further details of each
    option.

    This function will be bound to the matplotlib.axes.SubplotBase class as
    a new method for instances of the class. It should only be called when
    binding the method and then only as a method of SubplotBase objects.
    """

    if xlabel is not None:
        self.set_xlabel(xlabel)
    if ylabel is not None:
        self.set_ylabel(ylabel)
    if xscale is not None:
        self.set_xscale(xscale)
    if yscale is not None:
        self.set_yscale(yscale)
    if xlim is not None:
        self.set_xlim(xlim)
    if ylim is not None:
        self.set_ylim(ylim)
    if axhline is not None:
        self.axhline(axhline, lw=0.5, c='black')
    if axvline is not None:
        self.axvline(axvline, lw=0.5, c='black')
    if xticks is not None:
        self.set_xticks(xticks)
    if xticklabels is not None:
        self.set_xticklabels(xticklabels)
    if yticks is not None:
        self.set_yticks(yticks)
    if yticklabels is not None:
        self.set_yticklabels(yticklabels)
    if legend is True:
        self.legend(loc=loc, fontsize=fontsize, scatterpoints=scatterpoints)
    if title is not None:
        self.set_title(title, fontsize=title_fsize)


def save_image(gs, fig, image_path, wspace, hspace):
    """
    Save an image of fig to a file.
    """

    plt.tight_layout()
    # plt.subplots_adjust(top=0.92)
    gs.update(wspace=wspace, hspace=hspace)
    fig.savefig(image_path)
