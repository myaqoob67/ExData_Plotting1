pd0 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
# Check dimensions of the training data
#dim(pd0) 
# Dimensions are:  
# Check the headers for of the Training data
#head(pd0)
#### Convert date
## pd0$Date1 <-format(as.Date(pd0$Date), "%Y-%m-%d")
### paste date and time
##x <- as.character(pd0$Date)
pd0$Date1 <- as.Date((as.character(pd0$Date)), format="%d/%m/%Y")
pd0$DateTime <- paste(pd0$Date1, pd0$Time) 
print(head(pd0))
### Subset data based on date
tidyFile <- pd0[pd0$Date1 >= "2007-02-01" & pd0$Date1 <= "2007-02-02", ] 
#head(tidyFile)
## draw histgram
hist(tidyFile$Global_active_power, freq = TRUE, ylim = c(0, 2000),xlab="Global Active Power(kilowatts)",main="Global Active Power")
##now write to fiel as well
##
dev.copy(png,"./plot1.png")
dev.off()
