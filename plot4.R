download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./powerdata.zip");
unzip("./powerdata.zip");
unzip("./powerdata.zip",list=TRUE);
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
pwrdata$Sub_metering_1<-as.numeric(as.character(pwrdata$Sub_metering_1));
pwrdata$Sub_metering_2<-as.numeric(as.character(pwrdata$Sub_metering_2));
pwrdata$Sub_metering_3<-as.numeric(as.character(pwrdata$Sub_metering_3));
pwrdata$Voltage<-as.numeric(as.character(pwrdata$Voltage));
pwrdata$Global_reactive_power<-as.numeric(as.character(pwrdata$Global_reactive_power));
par(mfcol=c(2,2));
plot(pwrdata$DateTime, pwrdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)");
plot(pwrdata$DateTime, pwrdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering");
with(pwrdata$sub_metering_1,points(pwrdata$DateTime,pwrdata$Sub_metering_1,type="l"),col="black");
with(pwrdata$sub_metering_2,points(pwrdata$DateTime,pwrdata$Sub_metering_2,type="l",col="red"));
with(pwrdata$sub_metering_3,points(pwrdata$DateTime,pwrdata$Sub_metering_3,type="l",col="blue"));
legend("topright",xjust=1, yjust=1, cex=0.5, lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
plot(pwrdata$DateTime, pwrdata$Voltage,type="l",xlab="datetime",ylab="Voltage");
plot(pwrdata$DateTime,pwrdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power");
dev.copy(png,"./plot4.png");
dev.off()