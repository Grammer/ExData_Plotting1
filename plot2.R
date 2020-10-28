data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#filter data and format date
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

#datetime for graph
datetime<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert string to numeric
GlobalActivePower<-as.numeric(sdata[,"Global_active_power"])
# Create a plot
png("plot2.png",width = 480, height = 480)
plot(datetime,GlobalActivePower,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")
dev.off()
