#This R script will read the data and clean it a bit
read <- function(file){
 start_date <<- as.POSIXct("01/02/2007",format= "%d/%m/%Y")
 end_date <<- as.POSIXct("02/02/2007",format = "%d/%m/%Y")
 power_consumption <<- read.table(file,sep = ";", header = TRUE, stringsAsFactors = FALSE);
 power_consumption$Date <<- as.POSIXct(power_consumption$Date,format  = "%d/%m/%Y");
	sub_set <<- subset(power_consumption, Date >= start_date & Date <= end_date)
}

read("power.txt")