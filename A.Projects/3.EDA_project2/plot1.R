
# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

nei_total <- aggregate(Emissions ~ year,  data = nei, FUN = sum )

# Open a png file
png(filename = "plot1.png",
    width = 480,
    height = 480)

with(nei_total,
     plot(y = log10(Emissions), x =year,
          xlab = "Years", ylab = "Log(10) of Emissions",
          main = "Total Emissions",
          type = "b", col = "blue",
          lty = 1, lwd =1))

# Close the png file
dev.off() 