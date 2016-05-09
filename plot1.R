#
# plot1.R reads the power usage data, creates the first plot for the assingment, and writes it out as a png
#


# Set the working directory, read in the data, and limit the observations to the specified days
setwd("D:\\Libraries\\Documents\\DataScienceCourse\\04 Exploratory Data Analysis\\week 1\\exdata_data_household_power_consumption")

con<-file("household_power_consumption.txt")
readLines(con, n=10) # Check file structure without reading in entire file

dat<-read.table("household_power_consumption.txt", header=T, sep=";",na.strings = "?")
head(dat)
dim(dat)
str(dat)

# Keep only rows from  2007-02-01 and 2007-02-02
x<- dat[which(dat$Date=="1/2/2007" | dat$Date=="2/2/2007"),]
head(x)
names(x)

# Plot to screen
hist(x$Global_active_power, col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Output to PNG
png(filename="plot1.png",width=480, height=480)
hist(x$Global_active_power, col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()