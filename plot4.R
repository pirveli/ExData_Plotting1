#!/usr/bin/env Rscript

library(lubridate, warn.conflicts=F, quietly=T)

file.name <- "household_power_consumption.txt"
dates <- c("1/2/2007", "2/2/2007")

d <- read.csv(file.name, sep=";", na.strings="?", stringsAsFactors=F)#, nrow=1000)

d <-d[d$Date %in% dates, ]

d$datetime <- paste(d$Date, d$Time)
d$datetime <- dmy_hms(d$datetime)

png("plot4.png", width=480, height=480, type="cairo")
par(mfrow=c(2, 2))
with(d, plot(datetime, Global_active_power, t="l", xlab="", ylab="Global Active Power"))

with(d, plot(datetime, Voltage, t="l"))

with(d, plot(datetime, Sub_metering_1, t="l", xlab="", ylab="Energy sub metering"))
with(d, lines(datetime, Sub_metering_2, col="red"))
with(d, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", names(d)[c(7, 8, 9)], lty=1, bty="n", col=c("black", "red", "blue"))

with(d, plot(datetime, Global_reactive_power, t="l"))

dummy <- dev.off()
