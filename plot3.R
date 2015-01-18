# source("utility.R")

library(dplyr)

plotdata <- 
  filter( NEI, fips == "24510") %>%
  group_by(type,year) %>%
  summarise(
    sum = sum(Emissions)
  )

library(ggplot2)

g <- ggplot(data = plotdata, aes(x = year, y = sum)) +
  geom_line() +
  facet_grid(.~type) +
  ggtitle("Baltimore PM25 trend by 'type'") +
  ggsave(file = "plot3.png")

print(g)
