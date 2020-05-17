# About the Code in R 
## Working of the Code
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
    
   
## Raw Data Collection

The data for this project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The folder includes the following data sets that are being used:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample for training and test set respectively. Its range is from 1 to 30.


## Descriptions of new variables

- activity_labels: link class labels with their activity name
- features: list of all features
- features_need: feactures containing mean (‘mean’)and standard deviation(‘std’)
- data_train: training set
- data_train_need: training set with features containing mean and standard deviation
- label_train: training labels
- subject_train: each row identifies the subject who performed the activity for each window sample for training set
- data_test：test set
- data_test_need: test set with features containing mean and standard deviation
- label_test: test labels
- subject_test: each row identifies the subject who performed the activity for each window sample for test set
- train: training set together with subject and activity
- test: test set together with subject and activity
- mergeddata: merged data set including both train and test
- summary_data: summary data set with the average of each variable for each activity and each subject
