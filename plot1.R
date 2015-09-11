#!/usr/bin/env Rscript

file.name <- "household_power_consumption.txt"
dates <- c("1/2/2007", "2/2/2007")

d <- read.csv(file.name, sep=";", na.strings="?", stringsAsFactors=F)

d <- d[d$Date %in% dates, ]

png("plot1.png", width=480, height=480, type="cairo")
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
null <- dev.off()
