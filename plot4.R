dat=read.csv('household_power_consumption.txt',header=TRUE,sep=';',na.strings=c('?'))
# Note that the argument "na.strings=c('?')" is a MUST, because missing values in the dataset are coded as "?", otherwise '?' char will make R treat the numeric column as factor(i.e. class(dat$Global_active_power) retruns [1] "factor")
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
target=subset(dat,dat[,1] %in% c("1/2/2007","2/2/2007"))

par(mfrow = c(2, 2)) 

plot(target$DateTime,target$Sub_metering_1,
     type='n',xlab="",ylab="Energy sub metering")
lines(target$DateTime, target$Global_active_power)

plot(target$DateTime, target$Voltage, ylab="Voltage", xlab="datetime", type='l')

plot(target$DateTime,target$Sub_metering_1,
     type='n',xlab="",ylab="Energy sub metering")

lines(target$DateTime, target$Sub_metering_1)
lines(target$DateTime, target$Sub_metering_2, col='red')
lines(target$DateTime, target$Sub_metering_3, col='blue')

legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty='n'
       )
plot(target$DateTime, target$Global_reactive_power, xlab='datetime', type='l')
dev.copy(png,file="plot4.png")
dev.off()
