#This R script will read the data and clean it a bit
read <- function(file){
 start_date <<- as.POSIXct("01/02/2007",format= "%d/%m/%Y")
 end_date <<- as.POSIXct("02/02/2007",format = "%d/%m/%Y")
 power_consumption <<- read.table(file,sep = ";", header = TRUE, stringsAsFactors = FALSE);
 power_consumption$Date <<- as.POSIXct(power_consumption$Date,format  = "%d/%m/%Y");
	sub_set <<- subset(power_consumption, Date >= start_date & Date <= end_date)
}
#Function that actually does the plotting
second_graph <- function(){
  date <- strptime(paste(sub_set$Date, sub_set$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")	
	sub_set$Global_active_power <- as.numeric(sub_set$Global_active_power);
	plot(date,sub_set$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
}

#Function that prints into the file
plot2 <- function(){
	read("power.txt")
	png(filename = "plot2.png", height = 480, width = 480)
	second_graph()
	dev.off()
}

#Calling the main function
plot2()
