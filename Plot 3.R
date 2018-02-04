##READ AND FORMAT

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE, na.strings="?",skip=66636,nrows = 2880)
header <- read.table(unz(temp, "household_power_consumption.txt"),nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames( data ) <- unlist(header)
unlink(temp)
data$timestamp<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## PLOT 3
png(filename = "Plot 3.png", width = 480, height = 480)
plot(data$timestamp,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(data$timestamp,data$Sub_metering_2,type="l",col="red")
lines(data$timestamp,data$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch="-") 
dev.off()