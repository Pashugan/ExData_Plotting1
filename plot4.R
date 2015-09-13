hpc <- read.csv('household_power_consumption.txt', sep = ';', colClasses = c('character', 'character', rep('numeric', 7)), na.strings = '?')
hpc <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'),]
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = '%d/%m/%Y %T')

png('plot4.png', width = 480, height = 480, units = 'px')

par(mfrow = c(2, 2))
with(hpc, {
    plot(DateTime, Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
    plot(DateTime, Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
    plot(DateTime, Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'n')
    lines(DateTime, Sub_metering_1, col = 'black')
    lines(DateTime, Sub_metering_2, col = 'red')
    lines(DateTime, Sub_metering_3, col = 'blue')
    legend('topright', lty = 1, bty = 'n', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'))
    plot(DateTime, Global_reactive_power, xlab = 'datetime', type = 'l')
})

dev.off()