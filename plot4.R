# source("utility.R")

#Get SCC code with coal pollutant sources
coalSCC <- SCC[grep("[Cc]oal", SCC$Short.Name),]

library(dplyr)

df <- inner_join(NEI, coalSCC, by = "SCC") %>%
  group_by(year) %>%
  summarise(
    sum = sum(Emissions)
  )

library(ggplot2)

g <- ggplot(data = df, aes(x = year, y = sum)) +
  geom_line() +
#   facet_grid(.~type) +
  ggtitle("Coal Emissions'") +
  ggsave(file = "plot4.png")

print(g)