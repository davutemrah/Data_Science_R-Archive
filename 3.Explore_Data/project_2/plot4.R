
library(ggplot2)

# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

# take SCC list of Coal combustion related
coal2 = grepl("[Cc]oal", scc$Short.Name) & grepl("[Cc]omb", scc$Short.Name)
coal_scc <- scc$SCC[coal2]

# subset of nei data when source is coal combustion
nei_coal <- nei[nei$SCC %in% coal_scc, ]

nei_total4 <- aggregate(Emissions ~ year ,  data = nei_coal, FUN = sum )

# Open a png file
png(filename = "plot4.png",
    width = 480,
    height = 480)

ggplot(nei_total4, aes(year, Emissions)) + 
    geom_line()  +
    labs(title ="Total Emissions - Coal Combustion")

# Close the png file
 dev.off() 