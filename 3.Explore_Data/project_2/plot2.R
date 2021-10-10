
# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

# take a subset of nei, Baltimore city
baltimore <- subset(nei, fips =="24510")

baltimore_total <- aggregate(Emissions ~ year,  data = baltimore, FUN = sum )

# Open a png file
png(filename = "plot2.png",
    width = 480,
    height = 480)

with(nei_total,
     plot(y = log10(Emissions), x =year,
          xlab = "Years", ylab = "Log(10) of Emissions",
          main = "Total Emissions - Baltimore City",
          type = "b", col = "forestgreen",
          lty = 1, lwd =1))

# Close the png file
dev.off() 