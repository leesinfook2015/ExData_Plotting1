library(ggplot2)

dataFile <- "C:/Users/User/Desktop/school/IDA_MOOC/coursera2015/4.Exploratory Data Analysis/project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project1<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

names(project1)
head(project1)
str(project1)

datetime <- strptime(paste(project1$Date, project1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(project1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()