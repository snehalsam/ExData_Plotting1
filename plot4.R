pow <- read.table("household_power_consumption.txt", sep=";", nrows=2075259, na.strings="?", header=TRUE, stringsAsFactors=FALSE)

pow[,1] <- as.Date(pow[,1], format="%d/%m/%y")

sb_pow <- pow[,1] >= "2007-02-01" & pow[,1] <="2007-02-02"

sb_pow <- pow[sb_pow,]

par(mfrow=c(2,2))
par(mar=c(2,4,2,2))


plot(sb_pow[,3], type="l", ylab = "Global Active Power (kilowatts)",  xaxt = "n")
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))

plot(sb_pow[,5], type="l", ylab = "Voltage",  xaxt = "n")
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))


plot(sb_pow[,7], type="l", ylab = "Energy sub metering", xlab="", xaxt = "n", ylim=range(c(sb_pow[,7],sb_pow[,8],sb_pow[,9])))
lines(sb_pow[,8], col="red", ylab = "",  xaxt = "n", ylim=range(c(sb_pow[,7],sb_pow[,8],sb_pow[,9])))
lines(sb_pow[,9], col="blue", ylab = "",  xaxt = "n", ylim=range(c(sb_pow[,7],sb_pow[,8],sb_pow[,9])))
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid")

plot(sb_pow[,4], type="l", ylab = "Global Active Power (kilowatts)",  xaxt = "n")
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))

dev.copy(png,'plot4.png')
dev.off()
