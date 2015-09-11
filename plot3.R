#!/usr/bin/env Rscript

library(lubridate, warn.conflicts=F, quietly=T)

file.name <- "household_power_consumption.txt"
dates <- c("1/2/2007", "2/2/2007")

d <- read.csv(file.name, sep=";", na.strings="?", stringsAsFactors=F)#, nrow=1000)

d <-d[d$Date %in% dates, ]

d$date.time <- paste(d$Date, d$Time)
d$date.time <- dmy_hms(d$date.time)

png("plot3.png", width=480, height=480, type="cairo")
plot(d$date.time, d$Sub_metering_1, t="l", xlab="", ylab="Energy sub metering")
lines(d$date.time, d$Sub_metering_2, col="red")
lines(d$date.time, d$Sub_metering_3, col="blue")
legend("topright", names(d)[c(7, 8, 9)], lty=1, col=c("black", "red", "blue"))
dummy <- dev.off()
