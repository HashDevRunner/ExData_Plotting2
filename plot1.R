source("utility.R")

library(dplyr)

#summarize total emissions per year
plotdat <- group_by(NEI, year) %>%
  summarise(
    sum = sum(Emissions)
    )

png("plot1.png",width = 1024, height = 640, units = "px")
plot(plotdat$sum~plotdat$year, type=c("l"),
     xlab = "Year", ylab = "Total Emissions (kg)",
     main = "Total PM2.5 Emissions by Year",
     lwd = 2)

#nice to have regression line
rl <- lm(sum ~ year,plotdat)
abline(rl, lwd = 1, ,lty = 4,col = 'blue')

legend("topright", col=c("black", "blue"), 
       lty=c(1,4), lwd=c(2,1), 
       legend = c("Emissions","Regression"))

dev.off()
