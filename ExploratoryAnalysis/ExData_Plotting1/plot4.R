#This R script will read the data and clean it a bit
read <- function(file){
 start_date <<- as.POSIXct("01/02/2007",format= "%d/%m/%Y")
 end_date <<- as.POSIXct("02/02/2007",format = "%d/%m/%Y")
 power_consumption <<- read.table(file,sep = ";", header = TRUE, stringsAsFactors = FALSE);
 power_consumption$Date <<- as.POSIXct(power_consumption$Date,format  = "%d/%m/%Y");
	sub_set <<- subset(power_consumption, Date >= start_date & Date <= end_date)
}


voltage_graph <- function(){
	voltage <- as.numeric(sub_set$Voltage)
  		  datetime <- strptime(paste(sub_set$Date, sub_set$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")	
plot(datetime,voltage)
	  }
global_graph <- function(){
	Global_reactive_power <- as.numeric(sub_set$Global_reactive_power);
	  		  datetime <- strptime(paste(sub_set$Date, sub_set$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")	
 plot(datetime,Global_reactive_power,type="l")
}

#Function that generates the graph
fourth_plot <- function(){
	par(mfrow=c(2,2))
  second_graph()
  voltage_graph()
  third_graph()
  global_graph()
}

#Function that creates the png file
plot4 <- function(){
 read("power.txt")
	file <- png("plot4.png")
	fourth_plot()
	dev.off()
}

plot4()