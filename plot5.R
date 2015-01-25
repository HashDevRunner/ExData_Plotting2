source("utility.R")

#Get SCC code with motor vehicles sources
motorSCC <- SCC[grep("[Mm]otor|[Vv]ehicle|[Mm]obile", SCC$Short.Name),]

library(dplyr)

df <-   filter(NEI,fips == "24510") %>%
  inner_join(motorSCC, by = "SCC") %>%
  group_by(year) %>%
  summarise(
    sum = sum(Emissions)
  )

library(ggplot2)

g <- ggplot(data = df, aes(x = year, y = sum)) +
  geom_line() +
  ggtitle("Baltimore motor vehicle Emissions'") +
  ylab("Total Emissions (kg)") +
  xlab("Year") + 
  ggsave(file = "plot5.png")

print(g)