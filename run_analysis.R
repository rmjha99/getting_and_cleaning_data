###############################################
# STEP 0 :: Downloading and unzipping dataset.
###############################################

# STEP 0.1 : download dataset and unzip
filename <- "dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# STEP 0.2 : Load activity labels and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
features_need <- features[grep("mean|std", features[,2]), ]

# STEP 0.3 : Load test and train data, and select the needed features
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
data_train_need <- data_train[, as.numeric(features_need[,1])]
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_test_need <- data_test[, as.numeric(features_need[,1])]
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


##########################################################################
# STEP 1 :: Merges the training and the test sets to create one data set.
##########################################################################

# STEP 1.1 : Combining test and train data with labels
train <- cbind(subject_train, label_train, data_train_need)
test <- cbind(subject_test, label_test, data_test_need)

# STEP 1.2 : Merging the two datasets (test and train) into one
mergeddata <- rbind(train, test)


####################################################################################################
# STEP 2 :: Extracts only the measurements on the mean and standard deviation for each measurement.
####################################################################################################

# STEP 2.1 : Reading column names
colNames <- colnames(mergeddata)

# STEP 2.2 : Create vector for defining ID, mean and standard deviation
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

# STEP 2.3 : Making nessesary subset from mergeddata
setForMeanAndStd <- mergeddata[ , mean_and_std == TRUE]


####################################################################################
# STEP 3 :: Uses descriptive activity names to name the activities in the data set.
####################################################################################

# STEP 3.1 : clean the label names, then rename merged data with descriptive variable names
features_need[,2]<- gsub("-","_", features_need[,2])
features_need[,2]<- gsub("[()]","", features_need[,2]) #need to add []
colnames(mergeddata) <- c("subject", "activity", features_need[,2]) 

# STEP 3.2 : Use descriptive activity names to name the activities in the data set
mergeddata$activity <- factor(mergeddata$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])


###############################################################################
# Step 4 :: Appropriately labels the data set with descriptive variable names.
###############################################################################

# STEP 4.1 : Labeling data set with descriptive variable names
names(mergeddata)[2] = "activity"
names(mergeddata)<-gsub("Acc", "Accelerometer", names(mergeddata))
names(mergeddata)<-gsub("Gyro", "Gyroscope", names(mergeddata))
names(mergeddata)<-gsub("BodyBody", "Body", names(mergeddata))
names(mergeddata)<-gsub("Mag", "Magnitude", names(mergeddata))
names(mergeddata)<-gsub("^t", "Time", names(mergeddata))
names(mergeddata)<-gsub("^f", "Frequency", names(mergeddata))
names(mergeddata)<-gsub("tBody", "TimeBody", names(mergeddata))
names(mergeddata)<-gsub("-mean()", "Mean", names(mergeddata), ignore.case = TRUE)
names(mergeddata)<-gsub("-std()", "STD", names(mergeddata), ignore.case = TRUE)
names(mergeddata)<-gsub("-freq()", "Frequency", names(mergeddata), ignore.case = TRUE)
names(mergeddata)<-gsub("angle", "Angle", names(mergeddata))
names(mergeddata)<-gsub("gravity", "Gravity", names(mergeddata))


###########################################################################################################################################################
# Step 5 :: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###########################################################################################################################################################

# STEP 5.1 : creates a tidy data set with the average of each variable for each activity and each subject.
summary_data <-aggregate(mergeddata[, 3:ncol(mergeddata)], by=list(mergeddata$subject,mergeddata$activity), FUN=mean, na.rm=TRUE)
colnames(summary_data) [1:2]<- c("subject", "activity") 
write.table(summary_data, file="summary_data.txt", row.names = FALSE)