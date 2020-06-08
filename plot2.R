data<-read.delim('household_power_consumption.txt',sep=';')
data$Date<-as.Date(data$Date,format = '%d/%m/%Y')

dataSelected<-data[data$Date<='2007-02-02' & data$Date>='2007-02-01',]

dataSelected$Global_active_power=as.numeric(dataSelected$Global_active_power)
head(dataSelected)
library(lubridate)
dataSelected$DateTime <- ymd_hms(paste(as.character(dataSelected$Date), dataSelected$Time,sep=' '))

#head(dataSelected)
png('plot2.png')
plot(x=dataSelected$DateTime,y=dataSelected$Global_active_power,type = 'n',xlab = '',ylab='Global Active Power (kilowatts)')
lines(dataSelected$DateTime,dataSelected$Global_active_power)


dev.off()