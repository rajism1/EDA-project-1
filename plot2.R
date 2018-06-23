##reading data into R
data <- read.table("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE, sep = ";")
names(data)
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
##modifying data type
subdata[,3:9] <- sapply(subdata[,3:9],as.numeric)
subdata$Date <- as.Date(subdata$Date , format = "%d/%m/%Y")
subdata$Time <- format(subdata$Time, format="%H:%M:%S")
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

##plot 2
png("plot2.png", width=480, height=480)
plot(datetime,subdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()