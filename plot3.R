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



#plot(as.POSIXlt(tidyFile$DateTime),tidyFile$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")

plot(as.POSIXlt(tidyFile$DateTime),tidyFile$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="",col="black")
points(as.POSIXlt(tidyFile$DateTime),tidyFile$Sub_metering_2,type="l",col="red")
points(as.POSIXlt(tidyFile$DateTime),tidyFile$Sub_metering_3,type="l",col="blue")
## Add legend

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=1,col=c("black","red","blue"),
       ncol=1,cex=0.8, 
       bty="1",  
       inset =c(0,0),
       text.col=c("black"))

##now write to fiel as well
##
dev.copy(png,"./plot3.png")
dev.off()
