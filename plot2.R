download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./powerdata.zip");
unzip("./powerdata.zip",list=TRUE);
unzip("./powerdata.zip");
powerdata<-read.table("./household_power_consumption.txt",header = TRUE,sep=";");
powerdata$Date<-as.character(powerdata$Date);
powerdata$Time<-as.character(powerdata$Time);
powerdata$DateTime<-paste(powerdata$Date,powerdata$Time, sep=" ");
install.packages("lubridate");
library(lubridate);
powerdata$DateTime<-strptime(powerdata$DateTime,format="%d/%m/%Y %H:%M:%S");
pwrdata<-which((powerdata$DateTime>as.POSIXct("2007-02-01"))&(powerdata$DateTime<as.POSIXct("2007-02-03")));
pwrdata<-powerdata[pwrdata,];
for (i in 1:nrow(pwrdata)) {
        pwrdata$weekday;
        pwrdata$weekday[i]<-weekdays(pwrdata$DateTime[i],abbreviate=TRUE)
};
plot(pwrdata$DateTime, pwrdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)");
dev.copy(png,"./plot2.png");
dev.off()