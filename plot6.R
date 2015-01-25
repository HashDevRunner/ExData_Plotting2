source("utility.R")

#Get SCC code with motor vehicles sources
motorSCC <- SCC[grep("[Mm]otor|[Vv]ehicle|[Mm]obile", SCC$Short.Name),]

library(dplyr)

#filter baltimore and LA and summarize
df <-   filter(NEI,fips == "24510" | fips == "06037") %>%
  inner_join(motorSCC, by = "SCC") %>%
  group_by(year,fips) %>%
  summarise(
    sum = sum(Emissions)
  )

#build factors to have readable labels
df$fips <- as.factor(df$fips)
levels(df$fips)[levels(df$fips)=="24510"] <- "Baltimore City"
levels(df$fips)[levels(df$fips)=="06037"] <- "Los Angeles County, California"

#plot the data
library(ggplot2)
g <- ggplot(data = df, aes(x = year, y = sum)) +
  geom_line() +
  facet_grid(.~fips) +
  ggtitle("Motor Vehicle Emissions comparison") +
  ylab("Total Emissions (kg)") +
  xlab("Year") + 
  ggsave(file = "plot6.png")

print(g)