# Load and transform the data 
# Note: the data file must be in the working directory
data<-read.table("household_power_consumption.txt", sep=";",
                 header=TRUE,colClass="character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date==as.Date("2007/02/01") | 
                   data$Date==as.Date("2007/02/02"),]
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")
for(i in 3:9){data[,i]<-as.numeric(data[,i])}

# Multiple graphs:
Sys.setlocale("LC_TIME","English")
par(mfrow=c(2,2),cex=0.5,mar=c(4,4,1,1))

plot(data$Global_active_power,x=data$Time,type="l",
     ylab="Global Active Power",xlab="")

plot(data$Voltage,type="l",
     ylab="Voltage",xlab="datetime")

plot(data$Sub_metering_1,type="l",x=data$Time,
     ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2,x=data$Time,col="red");lines(data$Sub_metering_3,x=data$Time,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

plot(data$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime")

## Save the plot in a 'png' file
dev.copy(png,file="plot4.png",width=480,height=480) 
dev.off() ## close the device

