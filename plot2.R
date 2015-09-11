#!/usr/bin/env Rscript

library(lubridate, warn.conflicts=F, quietly=T)

file.name <- "household_power_consumption.txt"
dates <- c("1/2/2007", "2/2/2007")

d <- read.csv(file.name, sep=";", na.strings="?", stringsAsFactors=F)#, nrow=1000)

d <-d[d$Date %in% dates, ]

d$date.time <- paste(d$Date, d$Time)
d$date.time <- dmy_hms(d$date.time)

png("plot2.png", width=480, height=480, type="cairo")
plot(d$date.time, d$Global_active_power, t="l", xlab="", ylab="Global Active Power (kilowatts)")
dummy <- dev.off()
