##READ AND FORMAT

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE, na.strings="?",skip=66636,nrows = 2880)
header <- read.table(unz(temp, "household_power_consumption.txt"),nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames( data ) <- unlist(header)
unlink(temp)
data$timestamp<-strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

## PLOT 2
png(filename = "Plot 2.png", width = 480, height = 480)
with(data
     ,plot(timestamp,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()