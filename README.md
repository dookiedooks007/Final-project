Assignment: Getting and Cleaning Data Course Project

Contains codebook.md which describes all variables used in project and also sizes


run_analysis.R is the main program which contains 5 steps

1) Merges the training and the test sets to create one data set
	
This is done by reading in the activity, features, subject tables for both trianing and test data
by use of the read.table function

rbind is used to merge data sets together 
cbind is used to create a full data set

2) Extracts only the measurements on the mean and standard deviation for each measurement.

Function grep is used to return a logical vector containing columns containing mean and standard deviations

3) Uses descriptive activity names to name the activities in the data set

A simple loop is used to rename the activity data from when activity table read previously is used

4) Appropriately labels the data set with descriptive variable names.

gsub function is used to map descriptive variable names. e.g Acc is mapped to Accelerometer

5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 Clean tidy data produced and table written to file Tidy.txt and stored in working directory

