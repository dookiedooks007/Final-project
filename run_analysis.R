library(data.table)
library(dplyr)

##Reading training data

XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

##Reading test data

XTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
YTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

##Reading features and activity
featuresNames <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
activityLabels<- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

##Question 1
##Merges test data and train data to create one data set
subject <- rbind(subjectTrain, subjectTest)
features <- rbind(XTrain, XTest)
activity <- rbind(YTrain, YTest)
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
fullDataSet <- cbind(features,activity,subject)## Creating full data set


##Question 2
## Extracts only the measurements on the mean and standard deviation for each measurement. 

meanAndStd <- grep(".*Mean.*|.*Std.*", names(fullDataSet), ignore.case=TRUE) ##extracting cols with mean and STD
validColumns <- c(meanAndStd, 562, 563)
requiredData <- fullDataSet[,validColumns]



##Question 3
##Uses descriptive activity names to name the activities in the data set

requiredData$Activity <- as.character(requiredData$Activity)
for (i in 1:6){
    requiredData$Activity[requiredData$Activity == i] <- as.character(activityLabels[i,2])
}

requiredData$Activity <- as.factor(requiredData$Activity)

##Question 4 Appropriately labels the data set with descriptive variable names. 

names(requiredData)<-gsub("Acc", "Accelerometer", names(requiredData))
names(requiredData)<-gsub("Gyro", "Gyroscope", names(requiredData))
names(requiredData)<-gsub("BodyBody", "Body", names(requiredData))
names(requiredData)<-gsub("Mag", "Magnitude", names(requiredData))
names(requiredData)<-gsub("^t", "Time", names(requiredData))
names(requiredData)<-gsub("^f", "Frequency", names(requiredData))
names(requiredData)<-gsub("tBody", "TimeBody", names(requiredData))
names(requiredData)<-gsub("-mean()", "Mean", names(requiredData), ignore.case = TRUE)
names(requiredData)<-gsub("-std()", "STD", names(requiredData), ignore.case = TRUE)
names(requiredData)<-gsub("-freq()", "Frequency", names(requiredData), ignore.case = TRUE)
names(requiredData)<-gsub("angle", "Angle", names(requiredData))
names(requiredData)<-gsub("gravity", "Gravity", names(requiredData))


##Question 5 From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

requiredData$Subject <- as.factor(requiredData$Subject)
requiredData <- data.table(requiredData)
tidyData <- aggregate(. ~Subject + Activity, requiredData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)





