# Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository contains a submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis required.

## Dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files
**CodeBook.md** a code book that describes the variables, the data, and any transformations or  work that I performed to clean up the data

**run_analysis.R** performs the data preparation and then followed by the 5 steps required as    described in the course project's definition:
* Merges the training and the test sets to create one data set.  <br/>
* Extracts only the measurements on the mean and standard deviation for each measurement. <br/>
* Uses descriptive activity names to name the activities in the data set <br/>
* Appropriately labels the data set with descriptive variable names. <br/>
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br/>

**tidy_data.txt** is the exported final data after going through all the sequences described above.