data <- read.csv("household_power_consumption.txt",sep=";",
                 header=TRUE,na.strings="?",
                 colClasses=c(rep("character",2),rep("numeric",7))
)
data$Timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 

data <-subset(data,data$Timestamp>=as.POSIXct("2007-02-01",format="%Y - %m - %d"))
data <-subset(data,data$Timestamp<as.POSIXct("2007-02-03",format="%Y - %m - %d"))

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power, col="red", 
              main="Global Active Power",
              xlab="Global Active Power (kilowatts)")
dev.off()
