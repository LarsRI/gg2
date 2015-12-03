library(ggplot2)
library(reshape2)
# First generate some fake TF binding data
set.seed(1)

# Make a background
chipData <- data.frame(
    Normal = rpois(500, 5),
    Cancer = rpois(500, 5),
    Position = seq_len(500)
)

# Add common peaks
indCommon <- do.call("c", 
                     lapply(floor(runif(2, 10, 490)), seq, length.out = 10))
chipData[indCommon, "Normal"] <- chipData[indCommon, "Normal"] + rnorm(10, mean = 20, sd = 2)
chipData[indCommon, "Cancer"] <- chipData[indCommon, "Cancer"] + rnorm(10, mean = 20, sd = 2)

# Add cell-type specific peaks
indCancer <- do.call("c", 
                     lapply(floor(runif(3, 10, 490)), seq, length.out = 10))
chipData[indCancer, "Cancer"] <- chipData[indCancer, "Cancer"] + rnorm(10, mean = 20, sd = 2)

indNormal <- do.call("c", 
                     lapply(floor(runif(2, 10, 490)), seq, length.out = 10))
chipData[indNormal, "Normal"] <- chipData[indNormal, "Normal"] + rnorm(10, mean = 20, sd = 2)

plotData <- melt(chipData, id.vars = "Position")

# Now start with the plot. Figure out what you want on the x- and y-axis and what you want to color by.
# Finally choose what geom to use. geom_line() will work, but I think geom_area() looks nicer.
p <- ggplot(plotData, 
            aes(
                # Your code here
            )
            ) + 
    geom_area()
p

# Add faceting
p <- p + facet_grid(
    # Your code here
)
p

# Let's improve the colours a bit, here are two nice and bright colours: #e41a1c (red) and #377eb8 (blue)
# or you can pick your own. You can also rename the legend, or remove the title.

colScale <- scale_ #Select scale
p <- p + colScale
p

# Lets update the x-axis to remove the blak space around the edge
# And lets change the name of the y-axis to -lop10(p) (you can use scale_y_continous() or ylab()) 
xScale <- scale_x_continuous(
    # Your code here
)
yScale <- # Your code here

p <- p + xScale + yScale
p

# Add theming (if you like)
p <- p + theme_bw(
    # Your theming here
)
p

# save your plot
ggsave(filename = "ChIP_plot.png", plot = p, width = 15, height = 10, units = "cm")

# Extra, this deals with new things
# You can annotate a region with the annotate() function. Look it up.
p + annotate("rect", xmin = , xmax = , ymin = , ymax = , alpha = )

# Unfortunately it affects all facets. To target a specific facet you have to use geom_polygon()
# The dataframe below will work with geom_polygon(), figure out how why it works, and draw it. 
# You can add one in the normal tissue too if you like.
df <- data.frame(Position = c(98, 98, 112, 112),
                 value = c(0, 32, 32, 0),
                 variable = rep("Cancer", 4))
p <- p + geom_polygon(data = df)
p
ggsave(filename = "ChIP_plot2.png", plot = p, width = 15, height = 10, units = "cm")
