data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#filter data and format date
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")

# Convert string to numeric
GlobalActivePower<-as.numeric(sdata[,"Global_active_power"])
# Create a plot
png("plot1.png",width = 480, height = 480)
hist(GlobalActivePower, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
