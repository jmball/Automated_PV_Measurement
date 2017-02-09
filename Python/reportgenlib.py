# Library of functions for solar sim data analysis and plotting.

import matplotlib.pyplot as plt
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


def set_axes_props(self,
                   xlabel,
                   ylabel,
                   xlim,
                   ylim,
                   plot_title,
                   axis_fsize=10,
                   loc='best'):
    """
    Function for setting several properties of the axes of a matplotlib subplot
    at once.

    This function will be bound to the matplotlib.axes.SubplotBase class as
    a new method for instances of the class. It should only be called when
    binding the method and then only as a method of SubplotBase objects.
    """

    self.set_xlabel(xlabel)
    self.set_ylabel(ylabel)
    self.set_xlim(xlim)
    self.set_ylim(ylim)
    self.set_title(plot_title, fontsize=axis_fsize)
    self.legend(loc=loc)


def save_image(gs, fig, image_path, wspace, hspace):
    """
    Save an image of fig to a file.
    """

    gs.update(wspace=wspace, hspace=hspace)
    fig.savefig(image_path)
