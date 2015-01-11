
#Coursera - Exploratory Data Analysis - Course project 1 - Plot 1

#Change Locale to English for weekdays to be in English (and not in local language)
Sys.setlocale("LC_TIME","English");

#Clear variables from memory
rm(list=ls());
gc();

# - Data -

#Load data from csv file to data.frame
data <- read.csv("household_power_consumption.txt", sep=";", dec=".", header=TRUE);

#Create datetime column by combining Date and Time column values, combined values are in format: dd/mm/YYYY HH:MM:SS (e.g. 16/11/2008 14:05:56)
data$DateTime <- strptime( paste(data$Date , data$Time) , "%d/%m/%Y %H:%M:%S" );

#Select data for the two days given in the assignment (2007-02-01 and 2007-02-02)
data_twodays <- data[ data$DateTime >= '2007-02-01' & data$DateTime < '2007-02-03' , ];

# - Plot -

#Create PNG device
png("plot1.png", width=480, height=480);
#Plot Histogram
hist(
  as.numeric( as.character( data_twodays[!is.na(data_twodays$Global_active_power),]$Global_active_power ) ) #Remove NAs and transform from Factor to Numeric data type through Character data type
  , main = "Global Active Power" #Set graph title
  , xlab = "Global Active Power (kilowatts)" #Set X axis title
  , breaks = seq(from=0, to=8, by=0.50) #Set X axis breaks
  , axes = F #Disable automatically drawn axes
  , ylim = c(0,1200), xlim=c(0,8) #Set X and Y limits
  , col = c('red') #Set color
);
axis(1, seq(0, 6, by = 2)) #Set X axis
axis(2, seq(0, 1200, by = 200)) #Set Y axis
dev.off(); #Close PNG device
