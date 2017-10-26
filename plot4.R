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
feb_gap <- as.numeric(as.character(feb$Global_active_power, rm.na = TRUE))
sm1 <- as.numeric(as.character(feb$Sub_metering_1, rm.na = TRUE))
sm2 <- as.numeric(as.character(feb$Sub_metering_2, rm.na = TRUE))
sm3 <- as.numeric(as.character(feb$Sub_metering_3, rm.na = TRUE))
voltage <- as.numeric(as.character(feb$Voltage, rm.na = TRUE))
react <- as.numeric(as.character(feb$Global_reactive_power, rm.na = TRUE))

#open a png file
png('plot4.png')

#split the page into 4 differents areas
par(mfrow = c(2, 2))

#set the margins
par(mar=c(4,4,1,1))

#create the requested plot (TOP LEFT CORNER)
plot(feb_gap, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))

#create the requested plot (TOP RIGHT CORNER)
plot(voltage, type="l", xaxt="n", xlab="", ylab="Voltage")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))

#create the requested plot (BOTTOM LEFT CORNER)
plot(sm1, type="l", xaxt="n", xlab="", ylab="Energy sub metering", col= "black")
lines(sm2, col= "red")
lines(sm3, col= "blue")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

#create the requested plot (BOTTOM LEFT CORNER)
plot(react, type="l", xaxt="n", xlab="", ylab="Global_reactive_power")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))

#close the png file
dev.off()