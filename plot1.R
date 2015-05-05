
#extracting data with dates 1/2/2007 and 2/2/2007 from larger dataset 
clmnames<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrows=1,colClasses="character")
data<-read.table("household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",skip=66637,nrows=2880)
names(data)<-clmnames[1,]

#generating plot1 and saving as .png
png("plot1.png",width=480,height=480,bg="transparent")
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()