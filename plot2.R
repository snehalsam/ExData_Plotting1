pow <- read.table("household_power_consumption.txt", sep=";", nrows=2075259, na.strings="?", header=TRUE, stringsAsFactors=FALSE)

pow[,1] <- as.Date(pow[,1], format="%d/%m/%y")

sb_pow <- pow[,1] >= "2007-02-01" & pow[,1] <="2007-02-02"

sb_pow <- pow[sb_pow,]

plot(sb_pow[,3], type="l", ylab = "Global Active Power (kilowatts)",  xaxt = "n")
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri","Sat"))

dev.copy(png,'plot2.png')
dev.off()