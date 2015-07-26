* The downloaded zip file consists of  x_train, y_train, x_test, y_test, subject_train and subject_test ie the test and training data
* Join data, join label, join subject are the files by combining test and training data
* features.txt contains the variable names
* We need only those vairables of mean and std deviation 
* we clean the names by removing () from the variables
* activity_labels.txt contains the name of the activities
* Then we combined the cleaned data of label,subject and data into merged_data.txt
* Next we have the variable clean data which has average of each variable for each activity and each subject using the aggregate function
* This is written into file called data_with_means.txt using the write.table function
