
#extracting data with dates 1/2/2007 and 2/2/2007 from larger dataset 
clmnames<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrows=1,colClasses="character")
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",skip=66637,nrows=2880)
names(data)<-clmnames[1,]

#subsetting and converting the Date and Time columns to POSIXlt class
datetime<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

#generating plot2 and saving as .png
png("plot2.png",width=480,height=480,bg="transparent")
plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()