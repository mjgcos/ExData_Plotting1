data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")

#subset data first to make dataframe more manageble 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
df <- rbind(subset(data, Date == "2007-02-01"), subset(data, Date == "2007-02-02")) 

#construct datetime variable
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$datetime <- strptime(paste(df$Date, "-", df$Time), format = "%Y-%m-%d - %H:%M:%S")

#save plot
png(filename = "plot3.png")
with(df, plot(datetime, Sub_metering_1, type="n", xlab="",
              ylab = "Energy sub metering"))
with(df, lines(datetime, Sub_metering_1, col="black"))
with(df, lines(datetime, Sub_metering_2, col="red"))
with(df, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.off()
