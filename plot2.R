# Load and transform the data 
# Note: the data file must be in the working directory
data<-read.table("household_power_consumption.txt", sep=";",
                 header=TRUE,colClass="character")
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Date==as.Date("2007/02/01") | 
                   data$Date==as.Date("2007/02/02"),]
data$Time<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

for(i in 3:9){data[,i]<-as.numeric(data[,i])}; rm(i)

# plot of Global Active Power
Sys.setlocale("LC_TIME","English")
par(cex=0.75)
plot(x=data$Time,y=data$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

## Save the plot in a 'png' file
dev.copy(png,file="plot2.png",width=480,height=480) 
dev.off() ## close the device

