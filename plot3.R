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

hpc$Date_Time <- as.POSIXct(paste(hpc$Date,hpc$Time),format='%d/%m/%Y %H:%M:%S')

png(file="plot3.png", width = 480, height = 480)

with(hpc, plot(Date_Time, Sub_metering_1, type ="n", ylab="Energy sub metering", xlab =""))
with(hpc, points(Date_Time, Sub_metering_1,  type="l", ylab="Energy sub metering", xlab =""))
with(hpc, points(Date_Time, Sub_metering_2,  type="l", col="red", ylab="Energy sub metering", xlab =""))
with(hpc, points(Date_Time, Sub_metering_3,  type="l", col="blue", ylab="Energy sub metering", xlab =""))
legend("topright", lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.off()