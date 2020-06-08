data<-read.delim('household_power_consumption.txt',sep=';')
data$Date<-as.Date(data$Date,format = '%d/%m/%Y')

dataSelected<-data[data$Date<='2007-02-02' & data$Date>='2007-02-01',]

dataSelected$Global_active_power=as.numeric(dataSelected$Global_active_power)
head(dataSelected)

library(lubridate)
dataSelected$DateTime <- ymd_hms(paste(as.character(dataSelected$Date), dataSelected$Time,sep=' '))

png('plot4.png')
par(mfrow=c(2,2))

plot(x=dataSelected$DateTime,y=dataSelected$Global_active_power,type = 'n',xlab = '',ylab='Global Active Power ')
lines(dataSelected$DateTime,dataSelected$Global_active_power)

plot(x=dataSelected$DateTime,y=dataSelected$Voltage,type = 'n',xlab = 'datetime',ylab='Voltage')
lines(dataSelected$DateTime,dataSelected$Voltage)

plot(x=dataSelected$DateTime,y=dataSelected$Sub_metering_1,type = 'n',xlab = '',ylab='Energy sub metering')
lines(x=dataSelected$DateTime,y=dataSelected$Sub_metering_1)
lines(x=dataSelected$DateTime,y=dataSelected$Sub_metering_2,col='red')
lines(x=dataSelected$DateTime,y=dataSelected$Sub_metering_3,col='blue')
legend('topright',pch ='__' ,col=c('black','blue','red'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), cex = 0.75,bty = "n")

plot(x=dataSelected$DateTime,y=dataSelected$Global_reactive_power,type = 'n',xlab = 'datetime',ylab='Global_rective_power')
lines(dataSelected$DateTime,dataSelected$Global_reactive_power)


dev.off()