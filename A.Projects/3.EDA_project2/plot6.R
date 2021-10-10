library(ggplot2)
library(dplyr)

# Read data file
nei <- readRDS("data/summarySCC_PM25.rds")

# take SCC list of motor vehicles 
motor = grepl("[vV]ehicle", scc$EI.Sector) 
vehicle_scc <- scc$SCC[motor]

nei_sample <-
    nei%>%
    filter(SCC %in% vehicle_scc) %>%
    filter(fips  %in% c("06037", "24510")) %>%
    mutate(year = year,
           city = recode_factor(fips, '06037' = "Los Angeles County",
                                '24510' = "Baltimore City")) %>%
    group_by(year, city) %>%
    summarise(Emissions = sum(Emissions),
              .groups = "drop")


# Graph
# Open a png file
png(filename = "plot6.png",
    width = 480,
    height = 480)

ggplot(nei_sample, aes(year, log10(Emissions), color = city)) + 
    geom_line()  +
    labs(title ="Total Emissions - LA vs Baltimore City")

# Close the png file
dev.off() 