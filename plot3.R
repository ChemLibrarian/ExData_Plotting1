plot3 <- function () {
        #load needed packages 
        library(dplyr)
        
        #Read data file and subsetting needed data
        HPConsum <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("", "NA", " ", "?"))
        HPConsum <- tbl_df(HPConsum)
        HPConsum2d <- filter(HPConsum, Date == "1/2/2007" | Date == "2/2/2007")
        rm(HPConsum)
        
        #Combine and convert Date and Time to POSIXlt format
        HPConsum2d[ ,1:2] <- list(NULL, strptime(paste(HPConsum2d$Date, HPConsum2d$Time), format = "%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles" ))
        
        #plot the third plot and save it as png file
        png(file = "plot3.png", width = 480, height = 480)
        plot(HPConsum2d$Time, HPConsum2d$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab ="")
        lines(HPConsum2d$Time, HPConsum2d$Sub_metering_1)
        lines(HPConsum2d$Time, HPConsum2d$Sub_metering_2, col = "red")
        lines(HPConsum2d$Time, HPConsum2d$Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1),merge = TRUE )
        dev.off()
        
}