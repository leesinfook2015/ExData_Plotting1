library(ggplot2)

dataFile <- "C:/Users/User/Desktop/school/IDA_MOOC/coursera2015/4.Exploratory Data Analysis/project1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
project1<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

names(project1)
head(project1)
str(project1)

globalActivePower <- as.numeric(project1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
