################################
## This code is for plot3.png ##
################################

## Since the master csv file has too many rows, this code extracts data for dates 
## 1/2/2007 and 2/2/2007 by skipping all other rows. read.csv function is used. 

## Read only relevant rows from master csv to get mdat
mdat <- read.csv("./data/household_power_consumption.csv", 
                 sep=";", 
                 header=FALSE, 
                 blank.lines.skip=TRUE, 
                 nrows=2880,
                 skip=66637,
                 na.strings=""?"",
                 colClasses=c("character",
                              "character",
                              "numeric", 
                              "numeric",
                              "numeric",
                              "numeric",      
                              "numeric", 
                              "numeric",           
                              "numeric"))

## Dummy read of one row to get file header from master csv file
colnames <- read.csv("./data/household_power_consumption.csv", 
                     sep=";",
                     header=TRUE, 
                     blank.lines.skip = TRUE,
                     nrows=1)

## Copy file header to mdat
names(mdat) <- names(colnames)

## Base plotting code to construct plot3.png
## Open png device with suitable pixels and background
png(filename = "plot3.png",
    width=480, 
    height=480,
    units="px",
    bg="white")

## Process date and time columns
temp <- paste(mdat$Date, mdat$Time)
newdate <- strptime(temp, "%d/%m/%Y %H:%M:%S")

## Plot all three plots one by one in appropriate colors
with(mdat, plot(newdate,
               Sub_metering_1,
               type="l",
               xlab=" ",
               ylab="Energy sub metering"))

with(mdat, points(newdate, 
                  Sub_metering_2, 
                  type="l", 
                  col="red"))

with(mdat, points(newdate, 
                  Sub_metering_3, 
                  type="l", 
                  col="blue"))

## Add legend
legend("topright", 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1)

## Close device
dev.off() 
