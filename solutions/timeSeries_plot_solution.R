library(ggplot2)
# Let us use the economics dataset
head(economics)

# Let us start with a line plot, plot date vs. unemploy
p <- ggplot(economics, 
            aes(x = date, 
                y = unemploy)
            ) + 
    geom_line() 
p

# the "data" column is in a Date format, so a date x-axis is automaticaly used, 
# Let us add a some fake confidence intervals, use geom ribbon for this. 
# Make it mostly transparent.
p <- p + geom_ribbon(aes(ymin = unemploy - 1000, 
                         ymax = unemploy + 1000
                         ), 
                     alpha = 0.2)
p

# The unemply variable is "number of unemployed in thousands", 
# let us update the Y axis to reflect this.
# Let us capitalize the X axis while we are at it. Use ylab for this.
p <- p + ylab("Unemployed [in thousands]")

# There is wasted space at the edges of the graph, remove the extra space at the 
# edge of the x-axis, capitalize the name too. Use scale_x_date()
p <- p + scale_x_date(name = "Date", expand = c(0,0))
p

# Too much grey, let us theme it. I like theme_classic(), but have a look at 
# theme_bw(), theme_minimal(), theme_classic(), theme_grey() and theme_light(),
p <- p + theme_classic()

# This looks nice. Save it
ggsave(filename = "timeSeries_plot.png", plot = p, width = 15, height = 10, units = "cm")

# There seems to be a peak from 1982 to 1985. Let us highlight it.
# You can annotate a region with the annotate() function. Look it up.
p <- p + annotate("rect", 
             xmin = as.Date("1980-01-01"), 
             xmax = as.Date("1984-01-01"), 
             ymin = 0, 
             ymax = 14000, 
             alpha = 0.3)

p <- p + annotate("text", 
                  x = as.Date("1982-01-01"), 
                  y = 15000, 
                  label = "Recession")
ggsave(filename = "timeSeries_plot2.png", plot = p, width = 15, height = 10, units = "cm")
