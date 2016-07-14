#loading data
formats <- c("character", "character", rep("numeric", 7))
dat <- read.csv(file = "household_power_consumption.txt", sep = ";", colClasses = formats, na.strings = "?")
head(dat, 20)
dim(dat)
dat$Date2 <- strptime(dat$Date, format = "%d/%m/%Y")
dat2 <- subset(dat, dat$Date2 == "2007-02-01" | dat$Date2 == "2007-02-02")
head(dat2)

# plotting
png("plot1.png", width = 480, height = 480)
hist(dat2$Global_active_power, xlab = "Global Active Power (kW)", ylab = "Frequency", col = "wheat", main = "Global Active Power")
dev.off()
