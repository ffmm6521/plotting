data<-read.delim('household_power_consumption.txt',sep=';')
data$Date<-as.Date(data$Date,format = '%d/%m/%Y')

dataSelected<-data[data$Date<='2007-02-02' & data$Date>='2007-02-01',]

dataSelected$Global_active_power=as.numeric(dataSelected$Global_active_power)
head(dataSelected)

png('plot1.png')
hist(dataSelected$Global_active_power,col='red',xlab = 'Global Active Power (kilowatts)',main='Global Active Power')



dev.off()
