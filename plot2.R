data <- read.csv("household_power_consumption.txt",sep=";",
                  header=TRUE,na.strings="?",
                    colClasses=c(rep("character",2),rep("numeric",7))
                  )
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

data <-subset(data,data$Timestamp>=as.POSIXct("2007-02-01",format="%Y - %m - %d"))
data <-subset(data,data$Timestamp<as.POSIXct("2007-02-03",format="%Y - %m - %d"))

png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(data[,10],data[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
