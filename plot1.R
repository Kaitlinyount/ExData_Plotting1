download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./powerdata.zip");
unzip("./powerdata.zip");
unzip("./powerdata.zip",list=TRUE);
powerdata<-read.table("./household_power_consumption.txt",header = TRUE,sep=";");
powerdata$Date<-as.character(powerdata$Date);
powerdata$Date<-as.character(powerdata$Date);
powerdata$DateTime<-paste(powerdata$Date,powerdata$Time, sep=" ");
install.packages("lubridate");
library(lubridate);
powerdata$DateTime<-strptime(powerdata$DateTime,format="%d/%m/%Y %H:%M:%S");
pwrdata<-which((powerdata$DateTime>as.POSIXct("2007-02-01"))&(powerdata$DateTime<as.POSIXct("2007-02-03")));
pwrdata<-powerdata[pwrdata,];
pwrdata$Global_active_power<-as.numeric(as.character(pwrdata$Global_active_power));
hist(pwrdata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="orangered1");
dev.copy(png,"./plot1.png");
dev.off()