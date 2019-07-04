## Read and shape data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.strings="?")
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power <- power[,2:9]  # Dropping Date variable
names(power)[1] <- "DateTime"
power <- subset(power, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

## Create plot
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(power, plot(DateTime, Sub_metering_1, col="black", type="l", xlab="",
                 ylab="Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()