## load reshape2 library for melt function later
library(reshape2)

## reading in the training datasets
trainx <- read.table("train/X_train.txt")
trainy <- read.table("train/y_train.txt")
trainsub <- read.table("train/subject_train.txt")

## reading in the test datasets
testx <- read.table("test/X_test.txt")
testy <- read.table("test/y_test.txt")
testsub <- read.table("test/subject_test.txt")

## reading in the variable names
features <- read.table("features.txt")

## reading the activity names
activities <- read.table("activity_labels.txt")

## setting the column names
colnames(testy) = "ActivityID"
colnames(trainy) = "ActivityID"
colnames(trainsub) = "SubjectID"
colnames(testsub) = "SubjectID"
colnames(trainx) = features[,2]
colnames(testx) = features[,2]

## combining the datasets together
test <- cbind(testsub, testy, testx)
train <- cbind(trainsub, trainy, trainx)
alldata <- rbind(train, test)

## select only the variables with mean() or std() in the names
seldata <- alldata[,c(1, 2, grep("mean\\(\\)|std\\(\\)", features[,2])+2)]

## linking the activity names with the main dataset
colnames(activities) = c("ActivityID", "ActivityName")
seldata <- merge(seldata, activities, by.x = "ActivityID", by.y = "ActivityID")

## reshape the dataset for aggregation
seldata <- melt(seldata, c("SubjectID", "ActivityID", "ActivityName"))

## calculate average based by subject, activity and variable
tidydata <- aggregate(value ~ SubjectID + ActivityName + variable, data = seldata, FUN = mean)

## settting the column names
colnames(tidydata) = c("SubjectID", "ActivityName", "VariableName", "AverageValue")

## writing the output to a text file
write.table(tidydata, "tidydata.txt", row.names=F)