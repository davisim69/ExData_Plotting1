
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

#Energy sub metering plot

with(plotData1,plot(DateTime, SubMetering1, main = "", type = "l", ylab="Energy sub metering", xlab="", cex.axis=0.9, cex.lab=0.9)) 
with(plotData1,points(DateTime, SubMetering2, col = "red", type="l")) 
with(plotData1,points(DateTime, SubMetering3, col = "blue", type="l")) 
legend("topright",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.9) # Add legend


#Copy graph to .png file
dev.copy(png,file="plot3.png")
dev.off()
