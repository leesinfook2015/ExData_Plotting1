library(ggplot2)

dataFile <- "C:/Users/User/Desktop/school/IDA_MOOC/coursera2015/4.Exploratory Data Analysis/project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project1<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

names(project1)
head(project1)
str(project1)

project1$Date <- as.Date(project1$Date, format="%d/%m/%Y")

## Converting dates
datetime <- paste(as.Date(project1$Date), project1$Time)
project1$Datetime <- as.POSIXct(datetime)


## Plot 3
with(project1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
