dat=read.csv('household_power_consumption.txt',header=TRUE,sep=';',na.strings=c('?'))
# Note that the argument "na.strings=c('?')" is a MUST, because missing values in the dataset are coded as "?", otherwise '?' char will make R treat the numeric column as factor(i.e. class(dat$Global_active_power) retruns [1] "factor")
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
target=subset(dat,dat[,1] %in% c("1/2/2007","2/2/2007"))

plot(target$DateTime,target$Global_active_power,xlab='',ylab="Global Active Power (kilowatts)",type='l')

dev.copy(png,file="plot2.png")
dev.off()
