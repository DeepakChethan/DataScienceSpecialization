corr <- function(directory, threshold = 0){
	nobs_table<- complete("specdata")
	co <- c()
  nobs_id <-	nobs_table[nobs_table$nobs > threshold,]$ids
  for (id in nobs_id){
  	  temp <- as.character(id)
 if (nchar(temp)==1){
 	i <-paste("00",id,sep = "")
 }else if(nchar(temp)==2){
 	i<-paste("0",id,sep="")
 }
else i <- id
  data <-	read.csv(paste(directory,"/",i,".csv",sep = ""))
 	co <- c(co, cor(data$sulfate,data$nitrate,use = "complete.obs"))
  }
  co
}