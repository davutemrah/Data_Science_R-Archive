library(ggplot2)

# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

# take a subset of nei, Baltimore city
baltimore <- subset(nei, fips =="24510")

# by type
baltimore_total2 <- aggregate(Emissions ~ year + type,
                              data = baltimore, FUN = sum )


# Open a png file
png(filename = "plot3.png",
    width = 480,
    height = 480)

ggplot(baltimore_total2, aes(x = year, y = Emissions)) +
    geom_line(aes(color = type)) +
    facet_grid(vars(type)) +
    labs(title ="Total Emissions - Baltimore City")

# Close the png file
dev.off() 