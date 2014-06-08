data <- read.csv("household_power_consumption.txt",sep=";",
                 header=TRUE,na.strings="?",
                 colClasses=c(rep("character",2),rep("numeric",7))
)
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

data <-subset(data,data$Timestamp>=as.POSIXct("2007-02-01",format="%Y - %m - %d"))
data <-subset(data,data$Timestamp<as.POSIXct("2007-02-03",format="%Y - %m - %d"))


png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(data[,10],data[,7], type="l",xlab="",ylab="Energy Sub Metering")
lines(data[,10],data[,8],col="red")
lines(data[,10],data[,9],col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()