# Library of classes and functions for solar sim data analysis and plotting.
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NOT FINISHED ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
import matplotlib.pyplot as plt
from matplotlib import gridspec


class full_page_figure:
    """
    Defines full page figure objects comprised of subplots. The methods add
    subplot axes, data, define subplot properties, and save the figure.
    """

    # Class variables
    A4_width = 10
    A4_height = 7.5
    dpi = 300
    title_fsize = 10
    title_fweight = 'bold'

    def __init__(self, title, rows, cols):
        """
        title = title of the full page figure
        rows = number of subplot rows
        cols = number of subplot columns
        """

        self.axes_num = 0
        self.title = title
        self.rows = rows
        self.cols = cols
        self.fig = plt.figure(figsize=(self.A4_width, self.A4_height),
                              dpi=self.dpi)
        self.fig.suptitle(self.title,
                          fontsize=self.title_fsize,
                          fontweight=self.title_fweight)
        self.gs = gridspec.GridSpec(self.rows, self.cols)

    def add_axes(self, row, col, plot_title, axis_fsize):
        """
        Add subplot axes to the figure and add a subplot title.

        row = row number position for the subplot
        col = column number position for the subplot
        plot_title = subplot title
        """

        self.axes_num += 1
        self.row = row
        self.col = col
        self.plot_title = plot_title
        self.axis_fsize = axis_fsize
        self.ax = self.fig.add_subplot(self.gs[self.row, self.col])
        self.ax.set_title(self.plot_title, fontsize=self.axis_fsize)

    def add_data(self, xdata, ydata, label, plot_type, color):
        """
        Add data to subplot axes. Currently there is no support for specifying
        the subplot number so this method should be called immediately after
        add_axis.

        plot_type must be \'plot\', \'boxplot\', \'scatter\', or \'plot_date\'.
        """

        if self.axes_num == 0:
            raise AttributeError(
                'Cannot add data to axis. No axes have been defined.')
        else:
            self.xdata = xdata
            self.ydata = ydata
            self.label = label
            self.plot_type = plot_type
            self.color = color
            if self.plot_type == 'plot':
                self.ax.plot(self.xdata,
                             self.ydata,
                             color=self.color,
                             label=self.label)
            elif self.plot_type == 'boxplot':
                self.ax.boxplot(self.xdata,
                                self.ydata,
                                color=self.color,
                                label=self.label)
            elif self.plot_type == 'scatter':
                self.ax.scatter(self.xdata,
                                self.ydata,
                                color=self.color,
                                label=self.label)
            elif self.plot_type == 'plot_data':
                self.ax.scatter(self.xdata,
                                self.ydata,
                                color=self.color,
                                label=self.label)
            else:
                raise NameError(
                    'Invalid plot_type. See help for valid plot_type\'s')

    def set_axes_props(self, xlabel, ylabel, axis_fsize, xlim, ylim):
        """
        Set the properties of the axes of a subplot. Currently there is no
        support for specifying the subplot number so this method should be
        called immediately after add_data.
        """

        if self.axes_num == 0:
            raise AttributeError(
                'Cannot add data to axis. No axes have been defined.')
        else:
            self.xlabel = xlabel
            self.ylabel = ylabel
            self.axis_fsize = axis_fsize
            self.xlim = xlim
            self.ylim = ylim
            self.ax.set_xlabel(self.xlabel)
            self.ax.set_ylabel(self.ylabel)
            self.ax.set_xticklabels([])
            self.ax.set_xlim(self.xlim)
            self.ax.set_ylim(self.ylim)
            self.ax.legend(loc='best')

    def save_image(self, image_path, wspace, hspace):
        """
        Save image of plot to file.
        """

        self.image_path = image_path
        self.wspace = wspace
        self.hspace = hspace
        self.gs.update(wspace=self.wspace, hspace=self.hspace)
        self.fig.savefig(image_path)

# Test the class
x = [0, 1, 2, 3, 4]
y = list(map(lambda x: x**2, x))

figure_page = full_page_figure(title='test', rows=1, cols=1)
figure_page.add_axes(row=0, col=0, plot_title='test plot', axis_fsize=10)
figure_page.add_data(xdata=x,
                     ydata=y,
                     label='x-y',
                     plot_type='scatter',
                     color='red')
figure_page.set_axes_props(xlabel='x',
                           ylabel='y',
                           axis_fsize=10,
                           xlim=[min(x), max(x)],
                           ylim=[min(y), max(y)])
figure_page.save_image(image_path=r'C:/Users/jball/test_class.png',
                       wspace=0.6,
                       hspace=0.4)
