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

#open a png file
png('plot2.png')

#create the requested plot
plot(feb_gap, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, length(feb_gap)/2, length(feb_gap)), labels=c("Thu", "Fri", "Sat"))

#close the png file
dev.off()