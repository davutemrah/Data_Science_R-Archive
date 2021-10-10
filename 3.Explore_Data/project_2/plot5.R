library(ggplot2)

# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

# take SCC list of motor vehicles 
motor = grepl("[vV]ehicle", scc$EI.Sector) 
vehicle_scc <- scc$SCC[motor]

# take a subset of nei, Baltimore city
baltimore <- subset(nei, fips =="24510")

# Now, subset of baltimore data that source of pollution is motor vehicles
baltimore_vehicle <- baltimore[baltimore$SCC %in% vehicle_scc, ]

baltimore_tot5 <- aggregate(Emissions ~ year ,  data = baltimore_vehicle, FUN = sum )

# Graph
# Open a png file
png(filename = "plot5.png",
    width = 480,
    height = 480)

ggplot(baltimore_tot5, aes(year, Emissions)) + 
    geom_line()  +
    labs(title ="Total Emissions - Baltimore - Motor Vehicles")

# Close the png file
dev.off() 