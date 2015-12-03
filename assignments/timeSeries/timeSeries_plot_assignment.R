library(ggplot2)
# Let us use the economics dataset
head(economics)

# Let us start with a line plot, plot date vs. unemploy
p <- ggplot(economics, 
            aes(
                # Your code here
            )
) + 
    geom_ # Select a geom
p

# the "data" column is in a Date format, so a date x-axis is automaticaly used, 
# Let us add a some fake confidence intervals, use geom ribbon for this. 
# geom_ribbon() takes a ymin and a ymax. You can use unemploy +/- 1000 for 
# this example. Make it mostly transparent.
p <- p + geom_ribbon(aes(ymin = , # Your values
                         ymax = # Your values
), 
alpha = ) # Your alpha
p

# The unemply variable is "number of unemployed in thousands", 
# let us update the Y axis to reflect this.
# Let us capitalize the X axis while we are at it. Use ylab for this.
p <- p + # Your code here
    

# There is wasted space at the edges of the graph, remove the extra space at the 
# edge of the x-axis, capitalize the name too. Use scale_x_date()
p <- p + scale_ # Your code here
p

# Too much grey, let us theme it. I like theme_classic(), but have a look at 
# theme_bw(), theme_minimal(), theme_classic(), theme_grey() and theme_light(),
p <- p + theme_classic()

# This looks nice. Save it
ggsave(filename = "timeSeries_plot.png", plot = p, width = 15, height = 10, units = "cm")

# There seems to be a peak from 1982 to 1985. Let us highlight it.
# You can annotate a region with the annotate() function. Look it up.
# First a box
p <- p + annotate("rect", 
                  xmin = as.Date("1980-01-01"), 
                  xmax = as.Date("1984-01-01"), 
                  ymin = , 
                  ymax = , 
                  alpha = )
# THen some text
p <- p + annotate("text", 
                  x = as.Date("1982-01-01"), 
                  y = , 
                  label = )
ggsave(filename = "timeSeries_plot2.png", plot = p, width = 15, height = 10, units = "cm")
