### The code was written based on the following instructions of this assignment

1. Merged the training and the test sets to create one data set.
I used rbind command  to combine training and test set (for subject, X and y). We also added the column names of the combined data set. The first column is the subject ID, followed by the various values in the 'features.txt' followed by the Activty Ids.

2. Extracted only the measurements on the mean and standard deviation for each measurement.

I used grep command to get column indexes for variable name contains "mean()" or "std()"

3. Used descriptive activity names to name the activities in the data set

I Converted activity labels to characters and add a new column as factor().

4. Appropriately labelled the data set with descriptive variable names.
I gave the selected descriptive names to the rest of variable columns using the gsub() method as following:
* All columns that contains  Acc in column’s name replaced by Accelerometer
* All columns that contains Gyro in column’s name replaced by Gyroscope
* All columns that contains Mag in column’s name replaced by Magnitude
* All columns that contains character f in column’s name replaced by Frequency
* All columns that contains character t in column’s name replaced by Time Domain

5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
 I used pipeline command to create a new tidy dataset with command group_by and summarize and across in dplyr package

The tidy data set is stored in tidy_data.txt file by using write.table() command.


# The tidy data contains 6 rows (averaged based on activity) and 68 columns (66 variables and activity labels) :

"activitylabel"
"subject"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"