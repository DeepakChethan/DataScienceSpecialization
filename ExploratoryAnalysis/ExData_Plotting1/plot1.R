#This script is to generate the first graph
#This R script will read the data and clean it a bit
read <- function(file){
 start_date <<- as.POSIXct("01/02/2007",format= "%d/%m/%Y")
 end_date <<- as.POSIXct("02/02/2007",format = "%d/%m/%Y")
 power_consumption <<- read.table(file,sep = ";", header = TRUE, stringsAsFactors = FALSE);
 power_consumption$Date <<- as.POSIXct(power_consumption$Date,format  = "%d/%m/%Y");
	sub_set <<- subset(power_consumption, Date >= start_date & Date <= end_date)
}

# Function that actually creates graph
first_graph <- function(){
sub_set$Global_active_power <- as.numeric(sub_set$Global_active_power)
hist(sub_set$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (Kilowatts)")
}

#Function that creates the png file
plot1 <- function(){
	read("power.txt")
	file <- png(filename = "plot1.png", width = 480, height = 480)
	first_graph()
	dev.off()
}

#Calling the main function
plot1()