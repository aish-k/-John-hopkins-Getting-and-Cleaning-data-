
#1. Goal of Step 1 is to merge the training, test data to one data set.
#Read the training data from the text files
targetfilepath<-paste(getwd(),"/Data Science Specialization John hopkins/GEtting and CLeaning data/Week 4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/",sep = "")

#Read the training data
#activity data
X_train_data= read.table(paste(targetfilepath, "train/X_train.txt",sep = ""))
#activity value
Y_train_data= read.table(paste(targetfilepath, "train/y_train.txt",sep=""))
subject_train_data= read.table(paste(targetfilepath, "train/subject_train.txt",sep=""))

#Read the test data
X_test_data= read.table(paste(targetfilepath, "test/X_test.txt",sep = ""))
Y_test_data= read.table(paste(targetfilepath, "test/y_test.txt",sep=""))
subject_test_data= read.table(paste(targetfilepath, "test/subject_test.txt",sep=""))

#Read the activities and features

activities<-read.table(paste(targetfilepath,"activity_labels.txt",sep=""))
features<-read.table(paste(targetfilepath,"features.txt",sep=""),as.is = TRUE)


#Concatenate all test and train datas
Total_training_data<-cbind(subject_train_data, X_train_data, Y_train_data)
Total_test_data<-cbind(subject_test_data, X_test_data, Y_test_data)
Total_Activity <- rbind(Total_training_data,Total_test_data)
colnames(Total_Activity)<-c("Subject",features[,2],"activities")

#Step 2.Extract only Standard deviation (SD) and mean related columns:
Total_Activity<-Total_Activity[,grep("std|mean|activities|Subject",names(Total_Activity))]

#Step 3. Descriptive labels to the activties column


Total_Activity$activities<-factor(Total_Activity$activities,levels = activities[,1],labels = activities[,2])

#Step 4. Make sure other column names are descriptive.
Total_Activity_col_names<-names(Total_Activity)
Total_Activity_col_names<-gsub("Freq","Frequency",Total_Activity_col_names)
Total_Activity_col_names<-gsub("^f","Frequency",Total_Activity_col_names)
Total_Activity_col_names<-gsub("std","Standard Deviation",Total_Activity_col_names)
Total_Activity_col_names<-gsub("^t","Time Domain",Total_Activity_col_names)
Total_Activity_col_names<-gsub("Gyro","Gyroscope",Total_Activity_col_names)
Total_Activity_col_names<-gsub("Acc","Accelerometer",Total_Activity_col_names)
Total_Activity_col_names<-gsub("Mag","Magnitude",Total_Activity_col_names)

colnames(Total_Activity)<-Total_Activity_col_names


# Step 5 - Create a second, independent tidy set with the average of each
#          variable for each activity and each subject

row_names_to_summarize<-names(Total_Activity)
row_names_to_summarize<-row_names_to_summarize[!row_names_to_summarize == "Subject" &  !row_names_to_summarize == "activities"]
Total_activity_mean = Total_Activity %>%
                         group_by(Subject,activities)%>%
                         summarise(across(row_names_to_summarize, ~ mean(.x, na.rm = TRUE))) %>%
                         print

#Step 6. Store the table in a seperate text file called tidy_data.txt
write.table(Total_activity_mean, paste(targetfilepath,"tidy_data.txt",sep=""), row.names = FALSE, 
            quote = FALSE)
