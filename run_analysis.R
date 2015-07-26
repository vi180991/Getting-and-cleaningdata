#Merges the training and the test sets to create one data set.
trainingdata <- read.table("./train/X_train.txt")
traininglabel <- read.table("./train/y_train.txt")
trainSubject <- read.table("./train/subject_train.txt")
testData <- read.table("./test/X_test.txt")
testLabel <- read.table("./test/y_test.txt") 
testSubject <- read.table("./test/subject_test.txt")
joinData <- rbind(trainingdata, testData)
joinLabel <- rbind(traininglabel, testLabel)
joinSubject <- rbind(trainSubject, testSubject)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("./features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
joinData <- joinData[, meanStdIndices]
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 

#Uses descriptive activity names to name the activities in the data
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

#Appropriately labels the data set with descriptive variable names
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData)
write.table(cleanedData, "merged_data.txt")

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
cleanData <- aggregate(cleanedData, by = list(cleanedData$activity,cleanedData$subject),mean)
cleanData <- cleanData[,1:68]
write.table(cleanData, "data_with_means.txt")


