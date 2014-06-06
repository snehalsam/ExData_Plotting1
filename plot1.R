pow <- read.table("household_power_consumption.txt", sep=";", nrows=2075259, na.strings="?", header=TRUE, stringsAsFactors=FALSE)

pow[,1] <- as.Date(pow[,1], format="%d/%m/%y")

sb_pow <- pow[,1] >= "2007-02-01" & pow[,1] <="2007-02-02"

sb_pow <- pow[sb_pow,]

hist(sb_pow[,3], xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "orangered", main = "Global Active Power")
dev.copy(png,'plot1.png')
dev.off()

