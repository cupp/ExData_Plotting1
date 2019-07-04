## Read and shape data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.strings="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power <- power[,2:9]  # Dropping Date variable
names(power)[1] <- "DateTime"
power <- subset(power, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

## Create plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(power, plot(DateTime, Global_active_power, xlab="",
                 ylab="Global Active Power (kilowatts)", type="l"))
dev.off()