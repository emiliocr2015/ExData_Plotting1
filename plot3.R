# Load and transform the data 
# Note: the data file must be in the working directory
data<-read.table("household_power_consumption.txt", sep=";",
                 header=TRUE,colClass="character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date==as.Date("2007/02/01") | 
                   data$Date==as.Date("2007/02/02"),]
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

for(i in 3:9){data[,i]<-as.numeric(data[,i])}; rm(i)

# plot of Energy sub metering (1,2 and 3)
par(cex=0.75)
plot(data$Sub_metering_1,type="l",x=data$Time,
     ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2,x=data$Time,col="red");lines(data$Sub_metering_3,x=data$Time,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
      lty=c(1,1,1),col=c("black","red","blue"))

## Save the plot in a 'png' file
dev.copy(png,file="plot3.png") 
dev.off() ## close the device


