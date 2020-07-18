
##Loading required Packages

library(dplyr)

##Download data


filezip="DataExamC3.zip" #Name of zipfile in my working repository

if (!file.exists(filezip)){
  link_Url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(link_Url_data, filezip)
}

# Checking if folder exists and to unzip
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filezip) 
}

##Import all data frames

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("number","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity_label"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")


#Step 1: Merges the training and the test sets to create one data set.

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
my_merged_Data <- cbind(Subject, Y, X)
  
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

my_measuresData <- my_merged_Data %>% select(subject, code, contains("mean"), contains("std"))


#Step 3: Uses descriptive activity names to name the activities in the data 

my_measuresData$code <- activities[my_measuresData$code, 2]


#Step 4 : Appropriately labels the data set with descriptive variable names

names(my_measuresData)[2] = "activity"

names(my_measuresData)<-gsub("^t", "Time", names(my_measuresData))
names(my_measuresData)<-gsub("^f", "Frequency", names(my_measuresData))
names(my_measuresData)<-gsub("tBody", "TimeBody", names(my_measuresData))
names(my_measuresData)<-gsub("-mean()", "Mean", names(my_measuresData), ignore.case = TRUE)
names(my_measuresData)<-gsub("-std()", "STD", names(my_measuresData), ignore.case = TRUE)
names(my_measuresData)<-gsub("Acc", "Accelerometer", names(my_measuresData))
names(my_measuresData)<-gsub("Gyro", "Gyroscope", names(my_measuresData))
names(my_measuresData)<-gsub("BodyBody", "Body", names(my_measuresData))
names(my_measuresData)<-gsub("Mag", "Magnitude", names(my_measuresData))
names(my_measuresData)<-gsub("-freq()", "Frequency", names(my_measuresData), ignore.case = TRUE)
names(my_measuresData)<-gsub("angle", "Angle", names(my_measuresData))
names(my_measuresData)<-gsub("gravity", "Gravity", names(my_measuresData))


#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

my_final_tidy_data <- my_measuresData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.table(my_final_tidy_data, "my_final_tidy_data.txt", row.name=FALSE)
