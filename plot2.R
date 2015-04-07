plot2 <- function () {
        #load needed packages 
        library(dplyr)
        
        #Read data file and subsetting needed data
        HPConsum <- read.csv("household_power_consumption.txt", sep=";", na.strings = c("", "NA", " ", "?"))
        HPConsum <- tbl_df(HPConsum)
        HPConsum2d <- filter(HPConsum, Date == "1/2/2007" | Date == "2/2/2007")
        rm(HPConsum)
        
        #Combine and convert Date and Time to POSIXlt format
        HPConsum2d[ ,1:2] <- list(NULL, strptime(paste(HPConsum2d$Date, HPConsum2d$Time), format = "%d/%m/%Y %H:%M:%S",tz="America/Los_Angeles" ))
        
        #plot the second plot and save it to a png file
        png(file = "plot2.png", width = 480, height = 480)
        plot(HPConsum2d$Time, HPConsum2d$Global_active_power, type = "n", ylab ="Global Active Power (kilowatts)", xlab ="")
        lines(HPConsum2d$Time, HPConsum2d$Global_active_power, type = "l")
        dev.off()
        
}