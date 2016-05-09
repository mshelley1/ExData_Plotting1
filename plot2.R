#
# plot2.R reads the power usage data, creates the second plot for the assingment, and writes it out as a png
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
plot(x$Global_active_power, type="n", ylab="Global Active Power (Kilowatts)", xaxt="n", xlab="")
lines(x$Global_active_power)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
     
   
# Output to PNG
png(filename="plot2.png",width=480, height=480)
plot(x$Global_active_power, type="n", ylab="Global Active Power (Kilowatts)", xaxt="n", xlab="")
lines(x$Global_active_power)
axis(side=1,at=c(0,nrow(x)/2,nrow(x)),labels=c("Thu","Fri","Sat"))
dev.off()
