library(ggplot2)
library(reshape2)
# First generate some fake expression data
set.seed(1)

means <- runif(10, 30, 90)
change <- sample(c(-1, 1), 10, replace = TRUE)

healthy <- data.frame(t(sapply(means, rnorm, sd = 15, n = 10)))
sick <- data.frame(t(sapply(means + change * 20, rnorm, sd = 10, n = 10)))

genes <- paste0("Long Gene Name", 1:10)
type <- rep(c("Metabolic", "Cancer", "TF"), c(2,3,5))

healthy$Gene <- genes
healthy$type <- type
sick$Gene <- genes
sick$type <- type

healthy <- melt(healthy)
healthy$variable <- "Healthy"
sick <- melt(sick)
sick$variable <- "Sick"

plotData <- rbind(healthy, sick)
rm(healthy, sick, genes, type, means, change)

# First lets just plot them (use position = position_dodge() instead of position = "dodge", possible bug)
p <- ggplot(plotData, aes(x = Gene, 
                     y = value, 
                     group = variable)
       ) + 
    geom_point(position = position_dodge(0.5))
p 

# An OK start, add faceting to highlight the categories, facet_grid is a good match here. Can you see why?
p <- p + facet_grid(~type, scales = "free_x", space = "free_x")
p

# Looks acceptable, lets theme it. Get rid of the x-axis title, and rotate the x-axis labels 90 degrees
# And lets change the name of the y-axis to Expression (you can use scale_y_continous() or ylab()) 
p <- p + theme(axis.title.x = element_blank(),
          axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    ylab("Expression")

p

# Maybe add some colour, here are two pastel colours from colorBrewer: #7fc97f & #beaed4
p <- p %+% aes(colour = variable) + 
    scale_color_manual(name = "Condition", 
                       values = c("Healthy" = "#7fc97f", 
                                  "Sick" = "#beaed4")
    )
p
# Finally save your plot
ggsave(filename = "point_plot.png", plot = p, width = 15, height = 10, units = "cm")

# Take a look at the code below to see how you can use the stat_summary to annotate your plot.
# Can you figure out how to add a point at the median?
p + stat_summary(geom = "errorbar", position = position_dodge(0.5), 
                 fun.ymax = function(x){quantile(x, 0.90)},
                 fun.ymin = function(x){quantile(x, 0.10)},
                 colour = "black",
                 width = 0.25,
                 alpha = 0.9) +
    stat_summary(geom = "point", position = position_dodge(0.5), 
                 fun.y = median,
                 colour = "black",
                 alpha = 0.9)
ggsave(filename = "point_plot2.png", width = 15, height = 10, units = "cm")
