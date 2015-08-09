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
png(filename = "plot2.png")
with(df, plot(datetime, Global_active_power, type="l", xlab = "", 
              ylab = "Global Active Power (kilowatts)"))
dev.off()
