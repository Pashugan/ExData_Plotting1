hpc <- read.csv('household_power_consumption.txt', sep = ';', colClasses = c('character', 'character', rep('numeric', 7)), na.strings = '?')
hpc <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'),]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %T')

png('plot2.png', width = 480, height = 480, units = 'px')

with(hpc, plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l'))

dev.off()