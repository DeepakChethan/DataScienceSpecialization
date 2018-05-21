pollutantmean <- function(directory,pollutant,id=1:322){

 me<- c()
	if (class(id)=="numeric"){
  temp <- as.character(id)
 if (nchar(temp)==1){
 	i <-paste("00",id,sep = "")
 }else if(nchar(temp)==2){
 	i<-paste("0",id,sep="")
 }
 data <-	read.csv(paste(directory,"/",i,".csv",sep = ""))
 me <- c(me,data[[pollutant]])
	}else{
	for(i in id){
	  temp <- as.character(i)
 if (nchar(temp)==1){
 	i <-paste("00",i,sep = "")
 }else if(nchar(temp)==2){
 	i<-paste("0",i,sep="")
 }
	 data <-	read.csv(paste(directory,"/",i,".csv",sep = ""))
	 me <- c(me,data[[pollutant]])
	}
	}
 
 mean(me,na.rm = TRUE)

}