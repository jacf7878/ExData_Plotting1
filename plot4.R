#code that makes plot4

#reading data file
df <- read.csv("household_power_consumption.txt", header = TRUE, sep=';', na.strings = '?')
str(df)
dim(df)
View(df)
df$Date <- as.Date(df$Date,format='%d/%m/%Y')

#filtering dates 2007-02-01 and 2007-02-02
dfok = subset(df,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
dim(dfok)
View(dfok)

#get week day (my system is settin up to show in portuguese qui=Thu, sex=Fri, sab=Sat)
dfok$weekday <- weekdays(dfok$Date, TRUE)

#prepare frame
par(mfrow = c(2,2))

#make plot2 - testing
#ATTENTION: There is no Saturday in the range demanded in project instruction: "We will only be using data from the dates 2007-02-01 and 2007-02-02."
#So I setted x lab manually
#1
plot(dfok$Global_active_power,type="l", xaxt ='n', xlab='', ylab='Gloval ACtive Power')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))

#2
plot(dfok$Voltage,type="l", xaxt ='n', ylab='Voltage',xlab='datetime')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))

#3
plot(dfok$Sub_metering_1,type="l", xaxt ='n', xlab='', ylab='Energy sub metering')
lines(dfok$Sub_metering_2, col='red')
lines(dfok$Sub_metering_3, col='blue')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black', 'red','blue'), bty='n')

#4
plot(dfok$Global_reactive_power,type="l", xaxt ='n', xlab='datetime', ylab='Global_reactive_power')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))


#exporting to png
png(filename='plot4.png', type=c('windows'), height=480, width=480)
#prepare frame
par(mfrow = c(2,2))
#1
plot(dfok$Global_active_power,type="l", xaxt ='n', xlab='', ylab='Gloval ACtive Power')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))
#2
plot(dfok$Voltage,type="l", xaxt ='n', ylab='Voltage',xlab='datetime')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))
#3
plot(dfok$Sub_metering_1,type="l", xaxt ='n', xlab='', ylab='Energy sub metering')
lines(dfok$Sub_metering_2, col='red')
lines(dfok$Sub_metering_3, col='blue')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black', 'red','blue'), bty='n')
#4
plot(dfok$Global_reactive_power,type="l", xaxt ='n', xlab='datetime', ylab='Global_reactive_power')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))

dev.off()

#clean objects
rm(df)
rm(dfok)