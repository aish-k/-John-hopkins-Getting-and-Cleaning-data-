# Getting and Cleaning data - Peer-Graded Programming Assignment

### Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### Code explaination
The code combined training dataset and test dataset,  and extracted partial variables to create another dataset with the averages of each variable for each activity.

### New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### Code explaination
The code combined training dataset and test dataset,  and extracted partial variables to create another dataset with the averages of each variable for each activity.

### New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

### The code was written based on the following instructions of this assignment

1. Merges the training and the test sets to create one data set.
I used command rbind to combine training and test set (for subject, X and y). We also added the column names of the combined data set. The first column is the subject ID, followed by the various values in the 'features.txt' followed by the Activty Ids.

2. Extract only the measurements on the mean and standard deviation for each measurement.
I used grep command to get column indexes for variable name contains "mean()" or "std()"

3. Uses descriptive activity names to name the activities in the data set
I Converted activity labels to characters and add a new column as factor().

4. Appropriately label the data set with descriptive variable names.
I gave the selected descriptive names to variable columns using the gsub() method.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 I used pipeline command to create a new tidy dataset with command group_by and summarize and across in dplyr package

# This repository contains 3 main files:


run_analysis.R - This script is used to build up and perform the analysis on the required sample data.

tidy_data.txt - This is the final output from the run_analysis.R script.  It contains a cleansed version of the sample data.

CodeBook.md - Contains the definitions of each of the columns in our generated tidy.txt file.
