

setwd("C:/Users/Ian/Documents/DataScience/ExploratoryAnalysis/Data")
plotData<-read.table(paste(getwd(),"/","household_power_consumption.txt",sep = ""), 
                     header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings="?"
                     ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Tidy up the variable names
names(plotData)<-c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")


#Convert the date and time variables
plotData$DateTime<-paste(plotData$Date,plotData$Time)

plotData$DateTime<-strptime(plotData$DateTime, format="%d/%m/%Y %H:%M:%S")


#Subset the data
plotData1<-subset(plotData,as.Date(plotData$DateTime) >= "2007-02-01" & as.Date(plotData$DateTime) <= "2007-02-02")

#Plot histogram of Global Active Power
with(plotData1,hist(GlobalActivePower, main="Global Active Power", xlab="Global Active Power (kilowats)", col="red"))

#Copy graph to .png file
dev.copy(png,file="plot1.png")
dev.off()