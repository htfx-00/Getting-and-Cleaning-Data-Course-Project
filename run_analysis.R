
#Loading required Packages

library(dplyr)

#Download data


filezip="DataExamC3.zip" #Name of zipfile in my working repository

if (!file.exists(filezip)){
  link_Url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(link_Url_data, filezip)
}

# Checking if folder exists
if (!file.exists(filezip)) { 
  unzip(filezip) 
}

getwd()
  