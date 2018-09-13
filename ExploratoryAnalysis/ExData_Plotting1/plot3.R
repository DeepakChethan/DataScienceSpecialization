
#This R script will read the data and clean it a bit
read <- function(file){
 start_date <<- as.POSIXct("01/02/2007",format= "%d/%m/%Y")
 end_date <<- as.POSIXct("02/02/2007",format = "%d/%m/%Y")
 power_consumption <<- read.table(file,sep = ";", header = TRUE, stringsAsFactors = FALSE);
 power_consumption$Date <<- as.POSIXct(power_consumption$Date,format  = "%d/%m/%Y");
	sub_set <<- subset(power_consumption, Date >= start_date & Date <= end_date)
}

#Function that does the plotting
third_graph <- function(){
	  date <- strptime(paste(sub_set$Date, sub_set$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")	
    sub_1 <- as.numeric(sub_set$Sub_metering_1)
    sub_2 <- as.numeric(sub_set$Sub_metering_2)
    sub_3 <- as.numeric(sub_set$Sub_metering_3)
    plot(date,sub_1,type = "n", xlab="",ylab="Energy Sub Metering")
    lines(date,sub_1,col="black",type="l")
    lines(date,sub_2,col="red",type="l")
    lines(date,sub_3,col="blue",type="l")
    legend("topright",col=c("black","red","blue"),legend = c("Submetering_1","Submetering_2","Submetering_3"),lty=c(1,1))
}

#Function to generate the graph
plot3 <- function(){
	png(filename = "plot3.png")
	third_graph()
	dev.off()
}

plot3()

