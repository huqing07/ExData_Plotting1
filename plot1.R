data <- read.table('./household_power_consumption.txt', sep=';', header = TRUE)

data1 <- subset(data, as.Date(Date, '%d/%m/%Y')>='2007-02-01' & as.Date(Date, '%d/%m/%Y')<'2007-02-03')

hist(as.numeric(paste(data1$Global_active_power)), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.copy(device=png,file="./plot1.png")
dev.off()


