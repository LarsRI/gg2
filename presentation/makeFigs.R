library(ggplot2)
library(reshape2)

# slide 5
p <- qplot(1:5, 1:5)
p

# slide 6
p + geom_line()

# slide 7
p + geom_line() + 
    xlab("X-label") + 
    ylab("Y-label") + 
    theme_bw()

# slide 10
ex <- data.frame(matrix(1:9, nrow = 3))
colnames(ex) <- c("Sample1", "Sample2", 
                   "Sample3")
ex$Gene <- c("Gene1", "Gene2", "Gene3")
ex
melt(ex)

# slide 12
p <- ggplot(data = diamonds, 
            mapping = aes(x = carat, y = price)
)

# slide 13
p + geom_point()

# slide 15
p %+% 
    aes(colour = color) + 
    geom_point()

# slide 16
p %+% 
    aes(colour = price) + 
    geom_point()

dat_gl <- data.frame(condition = c("Healthy", "Healthy", "Diseased", "Diseased"),
                     treatment = c("Untreated", "Treated", "Untreated", "Treated"),
                     score = c(10.5, 11, 6.4, 10)
                     )
dat_gl$condition <- relevel(dat_gl$condition, "Diseased")
dat_gl$treatment <- relevel(dat_gl$treatment, "Untreated")

# slide 18
p <- ggplot(dat_gl, 
            aes(
                x = treatment, 
                y = score, 
                group = 
                    condition           
            ))
p + geom_line()

# slide 19
p %+% aes(
    linetype = condition) +
    geom_line()

# slide 20
p <- ggplot(diamonds, 
            aes(x = cut, 
                y = log(carat)
            )
) 
p + geom_boxplot()

# slide 21
p + geom_boxplot(
    aes(colour = cut)
)

# slide 22
p + geom_boxplot(
    aes(fill = cut)
)

# slide 23
p + geom_jitter()

# slide 24
p + geom_jitter(
    alpha = 0.1
)

# slide 25
p + geom_jitter(
    alpha = 0.1
) +
    geom_boxplot(
        aes(fill = cut), 
        width = 0.5
    )

# slide 26
p <- ggplot(diamonds, 
            aes(x = price))
p + geom_histogram()

# slide 27
p + geom_histogram(
    binwidth = 50
) + 
    xlim(c(300, 5000))

# slide 28
p + geom_density(
    fill = "grey"
)

# slide 29
p + geom_histogram(
    aes(y = 
            ..density..), 
    binwidth = 50) +
    geom_density(
        fill = "grey", 
        alpha = 0.5
    ) + xlim(c(300, 5000))

# slide 30
ggplot(diamonds, 
       aes(x = cut)) + 
    geom_bar()

# slide 31
p <- ggplot(dat_gl, 
            aes(x = condition, 
                y = score, 
                group = treatment)
)
p + geom_bar(
    stat = "identity"
)

# slide 33
p + geom_bar(
    stat = "identity", 
    position = "dodge", 
    width = 0.5
)

# slide 34
p <- p + geom_bar(
    stat = "identity", 
    position = 
        position_dodge(0.8), 
    width = 0.5)
p


# slide 35
p + geom_errorbar(
    aes(ymin = score - 1, 
        ymax = score + 1), 
    position = 
        position_dodge(0.8), 
    width = 0.25)

# slide 36
p <- ggplot(diamonds, 
            aes(x = 'a', 
                fill = cut)
) + 
    geom_bar(
        width = 1
    )
p

# slide 37
p + coord_polar(
    theta = 'y'
)

# slide 38
p <- ggplot(diamonds, 
            aes(x = cut, 
                fill = color)
)
p + geom_bar()

# slide 39
p + geom_bar(
    position = 
        "dodge"
)

# slide 41
p <- ggplot(mtcars, 
            aes(mpg, 
                hp,
                colour = 
                    factor(cyl))) + 
    geom_point()
p

# slide 42
p + facet_wrap(~cyl)

# slide 43
p + facet_wrap(~cyl, 
               scales = "free", 
               nrow = 2)

# slide 44
p + facet_grid(~cyl, 
               scales = "free", 
               space = "free")

# slide 45
p <- p + facet_grid(
    cyl~., 
    scales = "free", 
    space = "free")
p

# slide 46
p <- ggplot(diamonds, 
            aes(carat, 
                price, 
                colour = 
                    price)
) + 
    geom_point()
p

# slide 47
p + 
    scale_colour_gradient(
        name = "Dollars",
        low = "red", 
        high = "green")

# slide 48
p + 
    scale_colour_gradient2(
        low = "red", 
        mid = "blue",
        high = "green",
        midpoint = 10000)

# slide 49
p + 
    scale_colour_gradientn(
        colours = rainbow(7)
    )

# slide 51
colScale <- 
    scale_colour_gradientn(
        rescaler = function(x, ...)x, 
        oob = identity, 
        colours=c("red", "red", "green", 
                  "blue", "orange", "orange"), 
        values=c(0, 2000, 5000, 10000, 
                 15000, 20000),
        breaks = c(0, 5000, 9000, 20000),
        limits = c(0, 20000))    

# slide 52
p + 
    colScale

# slide 53
p <- ggplot(mtcars, 
            aes(mpg, 
                hp,
                colour = 
                    factor(cyl))) + 
    geom_point()
p

# slide 54
colScale <- 
    scale_colour_manual(
        values = c('4' = "#7fc97f", 
                   '8' = "#beaed4", 
                   '6' = "#fdc086"),
        labels = c('4' = "Four", '6' = "Six", 
                   '8' = "Eight"),
        breaks = c('6', '8', '4'),
        name = "Cylinders"
    )

# slide 55
p + colScale

# slide 56
p %+% subset(
    mtcars, 
    cyl != 8
)

# slide 57
p %+% subset(
    mtcars, 
    cyl != 8
) + 
    colScale

# slide 58
colScale <- 
    scale_colour_manual(
        values = c('4' = "#7fc97f", 
                   '8' = "#beaed4", 
                   '6' = "#fdc086"),
        labels = c('4' = "Four", '6' = "Six", 
                   '8' = "Eight"),
        breaks = c('6', '8', '4'),
        name = "Cylinders",
        drop = FALSE)

# slide 59
scale_fill_gradient()
scale_fill_gradient2()
scale_fill_gradientn()
scale_fill_manual()

# slide 60
p <- ggplot(diamonds, 
            aes(x = cut)) + 
    geom_bar()
p

# slide 61
xScale <- scale_x_discrete(name = "Cut", 
                           labels = c("Fair" = "F",
                                      "Good" = "G",
                                      "Very Good" = "VG",
                                      "Premium" = "P",
                                      "Ideal" = "I"))
yScale <- scale_y_sqrt("sqrt(counts)",
                       expand = c(0,0))

# slide 62
p + xScale + yScale

# slide 63
p <- ggplot(dat_gl, 
            aes(x = treatment, 
                y = score, 
                shape = condition, 
                linetype = condition, 
                group = condition)) + 
    geom_point() + 
    geom_line()
p

# slide 65
lineScale <- scale_linetype_manual(
    values = c("Healthy" = 1, "Diseased" = 2), 
    labels = c('Healthy' = "A-OK", 
               'Diseased' = "Not so good"),
    breaks = c('Healthy', 'Diseased'),
    name = "Types of object"
)

# slide 66
lineScale2 <- scale_linetype_manual(
    values = c("Healthy" = 1, "Diseased" = 2)
)

# slide 67
shapeScale <- scale_shape_manual(
    values = c("Healthy" = 1, "Diseased" = 2)
)

# slide 68
scale_alpha_continuous()
scale_alpha_manual()

# slide 69
p

# slide 70
p + guides(
    shape = FALSE
)

# slide 71
p + guides(
    shape = FALSE, 
    linetype = FALSE
)

# slide 72
p + theme_bw()

# slide 73
p + theme_classic()

# slide 76
p + theme(axis.text.x = 
              element_text(
                  family = 
                      "Comic Sans MS", 
                  colour = "red", 
                  angle = 90, 
                  face = "bold.italic", 
                  vjust = 0.5, hjust = 1
              ))

# slide 77
p + theme(
    legend.title = 
        element_blank(),
    axis.title =
        element_blank()
)

# slide 78
p + theme_classic(
    base_size = 20, 
    base_family = 
        "Arial") +
    theme(
        axis.title.x = 
            element_blank()
    )    

# slide 79
set.seed(1)
mat <- matrix(rnorm(600), ncol = 6)
colnames(mat) <- 
    paste(rep(c("p1", "p2", "p3"), 2), 
          rep(c("baseline", "treated"), 
              each = 3))
rownames(mat) <- paste0("Gene", 
                        seq_len(nrow(mat)))

# slide 80
mat2 <- melt(mat)
mat2$condition <- sub("p\\d ", 
                      "", mat2$Var2)
mat2$Var2 <- sub("(p\\d).+", 
                 "\\1", mat2$Var2)
colnames(mat2) <- c("Gene", "Participant", 
                    "Score", "Condition")
mat2$Significant <- abs(mat2$Score) > 2.5

# slide 82
p <- ggplot(mat2, aes(
    x = Participant, 
    y = Gene, 
    fill = Score)) +
    geom_tile() +
    facet_wrap(
        ~Condition)
p

# slide 83
myTheme <- theme(
    axis.text.y = element_blank(),
    axis.title = element_blank(),
    axis.ticks.y = element_blank()
)

# slide 84
p + myTheme

# slide 85
xScale <- scale_x_discrete(
    labels = c("p1" = "Bob",
               "p2" = "Jim",
               "p3" = "Johnny"),
    expand = c(0,0)
)

# slide 86
p + myTheme + 
    xScale 

# slide 87
fillScale <- 
    scale_fill_gradientn(colours=
                             c("#d7191c", "#d7191c", "#fdae61", 
                               "#ffffbf", "#a6d96a", "#1a9641", 
                               "#1a9641"
                             ), rescaler = function(x, ...)x, 
                         oob = identity, 
                         values=c(-5, -2.5, -1.25, 0, 1.25, 2.5, 5),
                         breaks = c(-2.5, -1.25, 0, 1.25, 2.5),
                         limits = c(-3, 3))

# slide 88
p + myTheme + 
    xScale +
    fillScale

# slide 89
labelConversion <- list(
    "baseline" = "Baseline", 
    "treated" = "Treated"
)
c_labeller <- function(variable,value){
    return(labelConversion[value])
}

# slide 90
p <- p + myTheme + 
    xScale +
    fillScale +
    facet_grid(~Condition, 
               labeller=c_labeller
    )
p

# slide 91
p %+% aes(
    colour = Significant
)

# slide 92
colScale <- scale_colour_manual(
    name = element_blank(),
    values = c("TRUE" = "black", "FALSE" = NA),
    labels = c("TRUE" = "Significant"),
    limits = "TRUE")

# slide 93
p %+% 
    aes(
        colour = Significant
    ) + 
    colScale + 
    geom_tile(size = 0.5)

# slide 94
alphaScale <- scale_alpha_manual(
    name = element_blank(),
    values = c("TRUE" = 1, "FALSE" = 0),
    guide = FALSE)

# slide 95
p + geom_tile(
    aes(
        colour = Significant, 
        alpha = Significant), 
    size = 0.5) + 
    colScale + 
    alphaScale    
