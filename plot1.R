data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
df <- rbind(subset(data, Date == "2007-02-01"), subset(data, Date == "2007-02-02")) 

png(filename = "plot1.png")
hist(df$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()