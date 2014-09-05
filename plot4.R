setwd("C:/Users/jwilliams/SkyDrive/Study/DataScienceToolbox/ExploratoryDataAnalysis/Labs/")

#Read in the file
elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")

#Convert the date and time fields to a DateTime
elec$DateTime <- strptime(paste(elec$Date,elec$Time),"%d/%m/%Y%H:%M:%S")

#Subset to just the dates we are interested in
elecsub <- subset(elec,DateTime >= strptime("2007-02-01","%Y-%m-%d") & DateTime < strptime("2007-02-03","%Y-%m-%d"))

#Set output to file
png("plot4.png",width = 480, height = 480)

#Set to have two columns each with two graphs
par(mfcol=c(2,2))
plot(elecsub$DateTime,elecsub$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "" )

plot(elecsub$DateTime,elecsub$Sub_metering_1, type = "n", ylab="Entergy sub metering", xlab = "" )
points(elecsub$DateTime,elecsub$Sub_metering_1, type = "l")
points(elecsub$DateTime,elecsub$Sub_metering_2, type = "l", col="Red")
points(elecsub$DateTime,elecsub$Sub_metering_3, type = "l", col="Blue")
legend("topright", lty=1,col = c("Black","Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(elecsub,plot(DateTime,Voltage, type = "l"))
with(elecsub,plot(DateTime,Global_reactive_power, type = "l"))
#Close File
dev.off()