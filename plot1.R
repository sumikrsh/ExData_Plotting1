################################
## This code is for plot1.png ##
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

## Base plotting code to construct plot1.png
## Open png device with suitable pixels and background
png(filename = "plot1.png",
    width=480, 
    height=480,
    units="px",
    bg="white")

## Plot histogram
hist(mdat$Global_active_power, 
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

## Close device
dev.off() 
