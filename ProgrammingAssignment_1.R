pad_int<-function(n,scale){
  out_string<-paste(10*scale + n,sep='')
  out_string<-substr(out_string,2,nchar(out_string))
  return(out_string)
}
##
pollutantmean <- function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector indicating the location of the CSV files
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
  #print (pollutant)
  print (mean(dataset[[pollutant]], na.rm=TRUE))  

 ##
 ##for (file in file_list)
 ##{
   # create a merged dataset if doesn't exist   
 ##  if (!exists("dataset"))
 ##{
 ##    dataset <- read.csv(file, header=TRUE)
 ##  }
 ##   else 
 ##  {
 ##    temp_dataset <-read.csv(file, header=TRUE)
 ##    dataset<-rbind(dataset, temp_dataset)
 ##    rm(temp_dataset)
 ##   }
 ##  
 ## }

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  #print(dataset) 
}
