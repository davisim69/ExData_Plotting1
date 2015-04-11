
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

#Set up the screen device to receive 4 plots filled in by row
par(mfrow=c(2,2), mar =c(4,4,2,2))  # Two rows, two cols - row fill

with(plotData1, {
  plot(DateTime,GlobalActivePower, type = "l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.7)
  plot(DateTime,Voltage, type = "l", xlab="datetime", ylab="Voltage", lwd=0.5, cex.lab=0.7)
  plot(DateTime, SubMetering1, main = "", type = "l", ylab="Energy sub metering", xlab="", cex.lab=0.7) 
  points(DateTime, SubMetering2, col = "red", type="l") 
  points(DateTime, SubMetering3, col = "blue", type="l") 
  legend("topright",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty=0, cex=0.5)
  plot(DateTime,GlobalReactivePower, type = "l", xlab="datetime", ylab="Global_reactive_power", lwd=0.5, cex.lab=0.7)
  
}) 



#Copy graph to .png file
dev.copy(png,file="plot4.png")
dev.off()
