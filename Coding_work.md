# About this Code in R 
This code works in the following manner:

0) Downloading and unzipping dataset.

    0.1) Download dataset and unzip
   
    0.2) Load activity labels and features
    
    0.3) Load test and train data, and select the needed features

1) Merges the training and the test sets to create one data set.

    1.1) Combining test and train data with labels
    
    1.2) Merging the two datasets (test and train) into one

2) Extracts only the measurements on the mean and standard deviation for each measurement.

    2.1) Reading column names
    
    2.2) Create vector for defining ID, mean and standard deviation
    
    2.3) Making nessesary subset from "mergeddata"
    
3) Uses descriptive activity names to name the activities in the data set.

    3.1) Clean the label names, then rename merged data with descriptive variable names
    
    3.2) Use descriptive activity names to name the activities in the data set
    
4) Appropriately labels the data set with descriptive variable names.

    4.1) Labeling data set with descriptive variable names
    
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
    5.1) creates a tidy data set with the average of each variable for each activity and each subject
