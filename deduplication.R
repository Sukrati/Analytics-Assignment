#Deduplication of records of patients
#library used is stringdist
library("stringdist")

#reading the data set
tbl <- read.csv("Deduplication Problem - Sample Dataset.csv")

# user defined common words are removed
toRemove <- c(" JR", " SR", " II", " III", " IV") 
for (tR in toRemove) {
  tbl$fn <- gsub(tR, "", tbl$fn)
  tbl$ln <- gsub(tR, "", tbl$ln)
  }

#duplicates are removed
tbl <- unique(tbl)

#new column 'fullName' is created and all the spaces are removed
tbl$fullName <- paste(tbl$fn, tbl$ln, sep = '')
toRemove <- c(" ")
for (tR in toRemove) {
  tbl$fullName <- gsub(tR,"",tbl$fullName)}

# Jaro winkler distance matrix is created for all the strings present in column named fullName
combine <- tbl[,5]
combineDist <- stringdistmatrix(combine,combine,method = "jw")
len <- length(combine)

# a threshold value is set. If distance between strings is between zero and this threshold value then all those are removed 
threshold <- 0.09
for(i in 1:len)
{
  for(j in i:len)
  {
    if(combineDist[i,j]>0 && combineDist[i,j]<threshold)
    {
      s <- combine[j]
      rno <- which(tbl$fullName == s)           #calculating row number
      if(length(rno) == 1){
     		 tbl <- tbl[-c(rno),]                  #removing the row
	}
    }
  }
}
tbl <- tbl[,-c(5)]                              
write.csv(tbl, file = "output.csv")            #writing final output to a csv file


