source("utility.R")

library(dplyr)

#summarize total emissions per year
plotdat <-
  filter( NEI, fips == "24510") %>%
  group_by(year) %>%
  summarise(
    sum = sum(Emissions)
  )

png("plot2.png",width = 1024, height = 640, units = "px")
plot(plotdat$sum~plotdat$year, type=c("l"),
     xlab = "Year", ylab = "Total Emissions (kg)",
     main = "Baltimore Total PM2.5 Emissions by Year",
     lwd = 2)

#nice to have regression line
rl <- lm(sum ~ year,plotdat)
abline(rl, lwd = 1, ,lty = 4,col = 'blue')

legend("topright", col=c("black", "blue"), 
       lty=c(1,4), lwd=c(2,1), 
       legend = c("Emissions","Regression"))

dev.off()
