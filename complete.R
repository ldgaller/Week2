#Function to format csv file names
pad_int<-function(n,scale){
  out_string<-paste(10*scale + n,sep='')
  out_string<-substr(out_string,2,nchar(out_string))
  return(out_string)
}
complete <- function(directory, id = 1:332){
  ## Load Needed Libaries
    library(sqldf)
  ## 'directory' is a character vector indicating the location of the CSV files
      directory<-paste("C:\\Coursera\\DataScience\\R Programming","\\",directory,"\\",sep='')
      if (dir.exists(directory)==FALSE){
      message("Error:file directory does not exist")
      returnValue(-1) 
    }
   #Read csv files into a data frame
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
    #omit rows with na Values
    finalDF <- na.omit(dataset)
    #Select counts of final records by ID
    SqlCmd <- "SELECT finalDF.ID as id,COUNT(finalDF.ID) as nobs FROM finalDF Group By finalDF.ID"
    resultset <- sqldf(SqlCmd, stringsAsFactors = FALSE)
    print (resultset)
}

