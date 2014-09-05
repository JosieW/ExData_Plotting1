setwd("C:/Users/jwilliams/SkyDrive/Study/DataScienceToolbox/ExploratoryDataAnalysis/Labs/")

#Read in the file
elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")

#Convert the date and time fields to a DateTime
elec$DateTime <- strptime(paste(elec$Date,elec$Time),"%d/%m/%Y%H:%M:%S")

#Subset to just the dates we are interested in
elecsub <- subset(elec,DateTime >= strptime("2007-02-01","%Y-%m-%d") & DateTime < strptime("2007-02-03","%Y-%m-%d"))

png("plot2.png", width = 480, height = 480)

plot(elecsub$DateTime,elecsub$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "" )

dev.off()