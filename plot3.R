setwd("C:/Users/jwilliams/SkyDrive/Study/DataScienceToolbox/ExploratoryDataAnalysis/Labs/")

#Read in the file
elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")

#Convert the date and time fields to a DateTime
elec$DateTime <- strptime(paste(elec$Date,elec$Time),"%d/%m/%Y%H:%M:%S")

#Subset to just the dates we are interested in
elecsub <- subset(elec,DateTime >= strptime("2007-02-01","%Y-%m-%d") & DateTime < strptime("2007-02-03","%Y-%m-%d"))

png("plot3.png")

plot(elecsub$DateTime,elecsub$Sub_metering_1, type = "n", ylab="Entergy sub metering", xlab = "" )
points(elecsub$DateTime,elecsub$Sub_metering_1, type = "l")
points(elecsub$DateTime,elecsub$Sub_metering_2, type = "l", col="Red")
points(elecsub$DateTime,elecsub$Sub_metering_3, type = "l", col="Blue")
legend("topright", lty=1,col = c("Black","Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_3","Sub_metering_3"))
dev.off()