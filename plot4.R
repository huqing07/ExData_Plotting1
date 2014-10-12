data <- read.table('./household_power_consumption.txt', sep=';', header = TRUE)

data1 <- subset(data, as.Date(Date, '%d/%m/%Y')>='2007-02-01' & as.Date(Date, '%d/%m/%Y')<'2007-02-03')

data1$datetime <- paste(data1$Date, data1$Time)

par(mfrow=c(2,2))
plot(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Global_active_power)), type='l', xlab='', ylab='Global Active Power (kilowatts)')

plot(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Voltage)), type='l', xlab='datetime', ylab='Voltage')


plot(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Sub_metering_1)), type='l', xlab='', ylab='Energy sub metering')
lines(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Sub_metering_2)), col='red')
lines(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Sub_metering_3)), col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))

plot(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Global_reactive_power)), type='l', xlab='datetime', ylab='Global_reactive_power')

dev.copy(device=png,file="./plot4.png")
dev.off()

