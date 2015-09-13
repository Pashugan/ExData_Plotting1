hpc <- read.csv('household_power_consumption.txt', sep = ';', colClasses = c('character', 'character', rep('numeric', 7)), na.strings = '?')
hpc <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'),]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %T')

png('plot3.png', width = 480, height = 480, units = 'px')

with(hpc, {
    plot(DateTime, Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'n')
    lines(DateTime, Sub_metering_1, col = 'black')
    lines(DateTime, Sub_metering_2, col = 'red')
    lines(DateTime, Sub_metering_3, col = 'blue')
    legend('topright', lty = 1, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'))
})

dev.off()