#
# plot4.R reads the power usage data, creates the fourth plot for the assingment, and writes it out as a png
#


# Set the working directory, read in the data, and limit the observations to the specified days
setwd("D:\\Libraries\\Documents\\DataScienceCourse\\04 Exploratory Data Analysis\\week 1\\exdata_data_household_power_consumption")

dat<-read.table("household_power_consumption.txt", header=T, sep=";",na.strings = "?",stringsAsFactors = F)

# Keep only rows from  2007-02-01 and 2007-02-02, convert to date, calculate day of week
x<- dat[which(dat$Date=="1/2/2007" | dat$Date=="2/2/2007"),]
x$dt<-paste(x$Date,x$Time)
x$dt2<-strptime(x$dt, "%d/%m/%Y %H:%M:%S")
x$dow<-weekdays(x$dt2)
  
# Plot to screen
# Set params to show four plots
par(mfrow=c(2,2))

# first plot
plot(x$Global_active_power, type="n", ylab="Global Active Power", xaxt="n",xlab="")
lines(x$Global_active_power)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
     
# second plot
plot(x$Voltage,type="n", ylab="Voltage", xaxt="n", xlab="datetime")
lines(x$Voltage)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))

# Third plot
plot(x$Sub_metering_1, type="n", ylab="Energy Sub-Mertering", xaxt="n", xlab="")
lines(x$Sub_metering_1, col="black")
lines(x$Sub_metering_2, col="red")
lines(x$Sub_metering_3, col="blue")
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
legend("topright",
       c("sub_metering1", "sub_metering2", "sub_metering3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"))

# Fourth plot
plot(x$Global_reactive_power, type="n", xaxt="n", xlab="datetime")
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
lines(x$Global_reactive_power)



# Output to PNG
png(filename="plot4.png",width=480, height=480)

# Set params to show four plots
par(mfrow=c(2,2))

# first plot
plot(x$Global_active_power, type="n", ylab="Global Active Power", xaxt="n",xlab="")
lines(x$Global_active_power)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))

# second plot
plot(x$Voltage,type="n", ylab="Voltage", xaxt="n", xlab="datetime")
lines(x$Voltage)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))

# Third plot
plot(x$Sub_metering_1, type="n", ylab="Energy Sub-Mertering", xaxt="n", xlab="")
lines(x$Sub_metering_1, col="black")
lines(x$Sub_metering_2, col="red")
lines(x$Sub_metering_3, col="blue")
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
legend("topright",
       c("sub_metering1", "sub_metering2", "sub_metering3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"))

# Fourth plot
plot(x$Global_reactive_power, type="n", xaxt="n", xlab="datetime")
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
lines(x$Global_reactive_power)
dev.off()
