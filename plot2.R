data <- read.table('./household_power_consumption.txt', sep=';', header = TRUE)

data1 <- subset(data, as.Date(Date, '%d/%m/%Y')>='2007-02-01' & as.Date(Date, '%d/%m/%Y')<'2007-02-03')

data1$datetime <- paste(data1$Date, data1$Time)

plot(strptime(as.character(data1$datetime), "%d/%m/%Y%H:%M:%S"), as.numeric(paste(data1$Global_active_power)), type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.copy(device=png,file="./plot2.png")
dev.off()
