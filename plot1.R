
library(dplyr)
setwd("C:/Users/Ian/Documents/DataScience/ExploratoryAnalysis/Data")
plotData<-read.table(paste(getwd(),"/","household_power_consumption.txt",sep = ""), 
                     header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings="?"
                     ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Tidy up the variable names
names(plotData)<-c("Date","Time","GlobalActivePower","GlobalReactivePower","Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3")


#Convert the variables into appropriate classes



#Subset the data
plotData1<-