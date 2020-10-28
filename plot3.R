data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#filter data and format date
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

#datetime for graph
datetime<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert string to numeric
submet1<-as.numeric(sdata[,"Sub_metering_1"])
submet2<-as.numeric(sdata[,"Sub_metering_2"])
submet3<-as.numeric(sdata[,"Sub_metering_3"])

# Create a plot
png("plot3.png",width = 480, height = 480)
plot(datetime,submet1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(datetime, submet2, col = "red")
lines(datetime, submet3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()