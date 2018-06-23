##reading data into R
data <- read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE, sep = ";")
names(data)
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
##modifying data type
subdata[,3:9] <- sapply(subdata[,3:9],as.numeric)
subdata$Date <- as.Date(subdata$Date , format = "%d/%m/%Y")
subdata$Time <- format(subdata$Time, format="%H:%M:%S")
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

##plo 3
png("plot3.png", width = 480, height = 480)
plot(datetime, subdata$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
lines(datetime,subdata$Sub_metering_2, col = "red" ,type ="l")
lines(datetime,subdata$Sub_metering_3, col = "blue" ,type ="l")
legend("topright", lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
