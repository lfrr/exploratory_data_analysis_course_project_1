#loading data
formats <- c("character", "character", rep("numeric", 7))
dat <- read.csv(file = "household_power_consumption.txt", sep = ";", colClasses = formats, na.strings = "?")
head(dat, 20)
dim(dat)

dat$Date2 <- strptime(dat$Date, format = "%d/%m/%Y")
dat2 <- subset(dat, dat$Date2 == "2007-02-01" | dat$Date2 == "2007-02-02")
dat2$Time2 <- strptime(paste(dat2$Date2, dat2$Time), format = "%Y-%m-%d %H:%M:%S", tz = "GMT")


# plotting
png("plot3.png", width = 480, height = 480)
with(dat2, plot(Time2, Sub_metering_1, type = "l", ylab = "Energy sub metering (Wh)", xlab = "Time", col = "red"))
with(dat2, points(Time2, Sub_metering_2, type = "l", col = "green"))
with(dat2, points(Time2, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("red", "green", "blue"), lty = "solid", lwd = 2)
dev.off()

