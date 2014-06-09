pd0 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
# Check dimensions of the training data
#dim(pd0) 
# Dimensions are:  
# Check the headers for of the Training data
#head(pd0)
#### Convert date

pd0$Date1 <- as.Date((as.character(pd0$Date)), format="%d/%m/%Y")
pd0$DateTime <- paste(pd0$Date1, pd0$Time) 
#print(head(pd0))
### Subset data based on date
tidyFile <- pd0[pd0$Date1 >= "2007-02-01" & pd0$Date1 <= "2007-02-02", ] 

#head(tidyFile)



plot(as.POSIXlt(tidyFile$DateTime),tidyFile$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

##now write to fiel as well
##
dev.copy(png,"./plot2.png")
dev.off()
