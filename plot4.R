
#extracting data with dates 1/2/2007 and 2/2/2007 from larger dataset 
clmnames<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrows=1,colClasses="character")
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",skip=66637,nrows=2880)
names(data)<-clmnames[1,]

#subsetting and converting the Date and Time columns to POSIXlt class
datetime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

#generating plot4 and saving as .png
png("plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
plot(datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()