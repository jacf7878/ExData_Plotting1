#code that makes plot1

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

#make plot1
png(filename='plot1.png', type=c('windows'), height=480, width=480)
hist(dfok$Global_active_power, col='red', xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()

#clean objects
rm(df)
rm(dfok)

