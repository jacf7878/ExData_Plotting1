#code that makes plot2

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


#make plot2 - testing
#ATTENTION: There is no Saturday in the range demanded in project instruction: "We will only be using data from the dates 2007-02-01 and 2007-02-02."
#So I setted x lab manually
plot(dfok$Global_active_power,type="l", xaxt ='n', xlab='', ylab='Gloval ACtive Power (kilowatts)')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))

#exporting to png
png(filename='plot2.png', type=c('windows'), height=480, width=480)
plot(dfok$Global_active_power,type="l", xaxt ='n', xlab='', ylab='Gloval ACtive Power (kilowatts)')
axis(1, at=c(1, length(dfok$Global_active_power)/2, length(dfok$Global_active_power)), labels = c('Thu', 'Fri','Sat'))
dev.off()

#clean objects
rm(df)
rm(dfok)

