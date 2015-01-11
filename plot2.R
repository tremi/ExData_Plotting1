
#Coursera - Exploratory Data Analysis - Course project 1 - Plot 2

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
png("plot2.png", width=480, height=480);
#Plot time series
plot(
  data_twodays$DateTime , #Datetimes in X axis
  as.numeric( as.character( data_twodays$Global_active_power ) ) , #Global active power as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", #Set graph type as Line
  ylab = "Global Active Power (kilowatts)", xlab="" #Set Y axis title and remove X axis title
);
dev.off();#Close PNG device
