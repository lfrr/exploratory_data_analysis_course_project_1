#loading data
formats <- c("character", "character", rep("numeric", 7))
dat <- read.csv(file = "household_power_consumption.txt", sep = ";", colClasses = formats, na.strings = "?")
head(dat, 20)
dim(dat)

dat$Date2 <- strptime(dat$Date, format = "%d/%m/%Y")
dat2 <- subset(dat, dat$Date2 == "2007-02-01" | dat$Date2 == "2007-02-02")
dat2$Time2 <- strptime(paste(dat2$Date2, dat2$Time), format = "%Y-%m-%d %H:%M:%S", tz = "GMT")


# plotting
png("plot2.png", width = 480, height = 480)
with(dat2, plot(Time2, Global_active_power, type = "l", ylab = "Global Active Power (kW)", xlab = "Date"))
dev.off()

