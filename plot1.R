Row <- read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")
x <- as.POSIXct("2006-12-17 00:00:00")
y <- as.POSIXct("2007-02-01 00:00:00")
y - x
#46*24*60 = 66240
#66240+397 = 66637
Row <- read.table("household_power_consumption.txt", skip=66637, nrow = 1, header = TRUE, sep=";")


hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", na.strings="?", 
                   col.names = colnames(read.table("household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";"))) 

for( i in 1:2) {  hpc[, i] <- as.character(hpc[, i])}
for(i in 3:9){  hpc[, i] <- as.numeric(hpc[, i])}
png(file="plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()