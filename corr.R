#Function to format csv file names
pad_int<-function(n,scale){
  out_string<-paste(10*scale + n,sep='')
  out_string<-substr(out_string,2,nchar(out_string))
  return(out_string)
}
corr <- function(directory, threshold = 0)
    {
  ## Load Needed Libaries
    library(sqldf)
  ## 'directory' is a character vector indicating the location of the CSV files
      directory<-paste("C:\\Coursera\\DataScience\\R Programming","\\",directory,"\\",sep='')
      if (dir.exists(directory)==FALSE)
        {
          message("Error:file directory does not exist")
          returnValue(-1) 
        }
    #Read csv files into a data frame
      setwd(directory)
      
      file_list <- list.files()
      
      for (file in file_list)
          {
          
          # if the merged dataset doesn't exist, create it
          if (!exists("dataset"))
              {
                dataset <- read.csv(file, header=TRUE, sep=",")
              }
          
          # if the merged dataset does exist, append to it
          if (exists("dataset"))
              {
                  temp_dataset <-read.csv(file, header=TRUE, sep=",")
                  dataset<-rbind(dataset, temp_dataset)
                  rm(temp_dataset)
              }
          }   
     #omit rows with na Values
    finalDF <- na.omit(dataset)
    finalmt <- as.matrix(finalDF[2:3])
    finalmt
    #Select counts of final records by ID
    #SqlCmd <- paste("SELECT finalDF.sulfate, finalDF.nitrate FROM finalDF Having COUNT(finalDF.ID) > ",threshold,sep='')
    #resultset <- sqldf(SqlCmd,stringsAsFactors = FALSE)
    cor(finalmt) 
}

