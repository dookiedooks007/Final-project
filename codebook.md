Dataset downloaded in folder called UCI HAR Dataset and stored into working directory
Libraries used were data.table and dylyr

Training data variables used and size:
XTrain: 7352 rows x 561 columns (Features in train data)
YTrain: 7352 rows x 1 column (Activities in train data)
subjectTrain: 7352 rows x 1 column ( train data of subjects under observation)

Test data variable used and size:
XTest: 2947 rows x 561 columns (Features in test data)
YTest: 2947 rows x 1 column (Activities in test data)
subjectTest: 2947 rows x 1 column (Test data of subjects under observation)

featuresNames: 561 rows x 2 columns (All features)
activityLabels: 6 rows x 2 column (All activities)

subject: 10299 rows x 1 column ( Variable when subject train and subject test data merged)
features: 10299 rows x 561 columns (Variable when test and training features data are merged)
activity: 10299 rows x 1 column ( Variable when test and training activities are merged)
fullDataSet: 10299 rows x 563 columns( when features activity and subject are merged into one complete data set)

meanAndStd: logical vector (int [1:86]) of integer type extracting columns with mean and standard deviation
validColumns: logical vector (num[1:88]) of number type of meanAndStd together with activity and subject columns
requiredData: 10299 rows x 88 columns subset of fullDataSet containing only columns containing mean and standard deviation 

Setting appropriate labels with descriptive variable names
All Acc in column's name replaced by Accelerometer
All Gyro in column's name replaced by Gyroscope
All BodyBody in column's name replaced by Body
All Mag in column's name replaced by Magnitude
All start with character f in column's name replaced by Frequency
All start with character t in column's name replaced by Time

tidyData: 180 rows x 88 columns from fullDataSet creates independent tidy data set with average of each variable 






