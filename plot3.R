#Intalling extra package needed to explore this data
install.packages("lubridate")
library(lubridate)

#read the raw data
power <- read.csv("Exploratory data/power.txt", sep=";")

#turn the date into date
power$Date <- dmy(power$Date)

#subset only the days we focus on for this analysis
feb <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

#turn the analyzed data into numeric values
sm1 <- as.numeric(as.character(feb$Sub_metering_1, rm.na = TRUE))
sm2 <- as.numeric(as.character(feb$Sub_metering_2, rm.na = TRUE))
sm3 <- as.numeric(as.character(feb$Sub_metering_3, rm.na = TRUE))

#open a png file
png('plot3.png')

#create the requested plot
plot(sm1, type="l", xaxt="n", xlab="", ylab="Energy sub metering", col= "black")
lines(sm2, col= "red")
lines(sm3, col= "blue")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close the png file
dev.off()
