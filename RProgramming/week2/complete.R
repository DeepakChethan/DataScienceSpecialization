complete <- function(directory, id = 1:322){
	 ids <- c()
	 nobs <- c()
	if (class(id)=="numeric" && !is.vector(id)){
  temp <- as.character(id)
 if (nchar(temp)==1){
 	i <-paste("00",id,sep = "")
 }else if(nchar(temp)==2){
 	i<-paste("0",id,sep="")
 }
 data <-	read.csv(paste(directory,"/",i,".csv",sep = ""))
 temp1<- length(which(!is.na(data$sulfate)& !is.na(data$nitrate)))
 ids <- c(ids,id)
 nobs <- c(nobs,temp1)
	}else{
	for(i in id){
	  temp <- as.character(i)
 if (nchar(temp)==1){
 	it <-paste("00",i,sep = "")
 }else if(nchar(temp)==2){
 	it<-paste("0",i,sep="")
 }
	else it <- i
	 data <-	read.csv(paste(directory,"/",it,".csv",sep = ""))
 temp1<- length(which(!is.na(data$sulfate)& !is.na(data$nitrate)))
 ids <- c(ids,i)
 nobs <- c(nobs,temp1)
	}
	}
	 data.frame(ids,nobs)
}

