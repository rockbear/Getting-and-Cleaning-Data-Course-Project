Getting and Cleaning Data Course Project
========================================

The script "run_analysis.R" loads the original data set, perform the following steps, and writes results to a local file called "tidydata.txt".
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates the final tidy data set with the average of each variable for each activity and each subject. 

Before running the script, please make sure the following:
* Library "reshape2" is installed in R
* Current working directory is set to the "UCI HAR Dataset" folder unzipped from the raw dataset. There should be two subfolders in the current working directory - "train" and "test".
* The current user has the read and write permission to the current working directory

To run the script, use the following statement in R:
source("run_analysis.R")

The activity descriptions ("ActivityName" column) in the tidy data set are sourced from the "activity_labels.txt" file in the original data set.

The variable names ("VariableName" column) in the tidy data set are sourced from the "features.txt" file in the original data set.



