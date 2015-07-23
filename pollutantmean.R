pad_int<-function(n,scale){
  out_string<-paste(10*scale + n,sep='')
  out_string<-substr(out_string,2,nchar(out_string))
  return(out_string)
}
##
pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector indicating the location of the CSV files
  directory<-paste("C:\\Coursera\\DataScience\\R Programming","\\",directory,"\\",sep='')
    if (dir.exists(directory)==FALSE){
      message("Error:file directory does not exist")
      returnValue(-1) 
    }

 if (pollutant != "sulfate" & pollutant != "nitrate"){
   message("Error:pullutantmean expects sulfate or nitrate for its pollutant parameter")
   returnValue(-1) 
 }
  for (i in id)
    {
      padded<-pad_int(i,100)
      file_name<-paste(directory,padded,'.csv',sep='')
      if (!exists("dataset"))
      {
        dataset <- read.csv(file_name, header=TRUE)
      }
      else 
      {
        temp_dataset <-read.csv(file_name, header=TRUE)
        dataset<-rbind(dataset, temp_dataset)
        rm(temp_dataset)
      }
      
    }
  print (mean(dataset[[pollutant]], na.rm=TRUE))  
}
