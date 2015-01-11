
#Coursera - Exploratory Data Analysis - Course project 1 - Plot 4

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
png("plot4.png", width=480, height=480);

#Figure with 2x2 pictures
par(mfrow=c(2,2))

# Top left : Plot 2 again
plot(
  data_twodays$DateTime , #Datetimes in X axis
  as.numeric( as.character( data_twodays$Global_active_power ) ) , #Global active power as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", #Set graph type as Line
  ylab = "Global Active Power (kilowatts)", xlab="" #Set Y axis title and remove X axis title
);

#Top right
plot(
  data_twodays$DateTime , #Datetimes in X axis
  as.numeric( as.character( data_twodays$Voltage ) ) , #Voltage as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", #Set graph type as Line
  ylab = "Voltage", xlab="datetime" #Set Y and X axis titles
)


# Bottom left : Plot 3 again
#Plot first variable
plot(
  data_twodays$DateTime , #Datetime in X axis
  as.numeric( as.character( data_twodays[ , "Sub_metering_1"] ) ) , #Sub metering 1 as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", col="black" , #Set graph type as line and color as black
  ylab = "Energy sub metering", xlab="" #Set Y axis title and remove X axis title
)
#Add second variable into the plot
lines(
  data_twodays$DateTime , #Datetime in X axis
  as.numeric( as.character( data_twodays$Sub_metering_2 ) ) , #Sub metering 2 as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", col="red" #Set graph type as line and color as red
)
#Add third variable into the plot
lines(
  data_twodays$DateTime , #Datetime in X axis
  as.numeric( as.character( data_twodays[ , "Sub_metering_3"] ) ) , #Sub metering 3 as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", col="blue" #Set graph type as line and color as blue
)
#Set legend position, and labels, colors and line width for variables, also remove borderline from legend box
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1, bty="n")

#Bottom right
plot(
  data_twodays$DateTime , #Datetime in X axis
  as.numeric( as.character( data_twodays$Global_reactive_power ) ) , #Global reactive power as Y axis values (transform from Factor to Numeric data type through Character data type)
  type="l", #Set graph type as Line
  ylab = "Global_reactive_power", xlab="datetime" #Set Y and X axis titles
)

dev.off(); #Close PNG device
