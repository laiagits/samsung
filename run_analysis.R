library (plyr)
## 1. Merges the training and the test sets to create one data set:
##Read all files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Combines data table 
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
s <- rbind(subject_train, subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
## 3. Uses descriptive activity names to name the activities in the data set:
# Read features labels
features <- read.table("./UCI HAR Dataset/features.txt")
mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
measurements <- X[, (mean.col | std.col)]
colnames(measurements) <- features[(mean.col | std.col), 2]


## 4. Appropriately labels the data set with descriptive activity names:
# Friendly names to activities column
names(activities) <- c('act_id', 'act_name')
y[, 1] = activities[y[, 1], 2]
names(y) <- "activity"
names(s) <- "subject"

allDataSet <- cbind(measurements, y, s)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
tidyDataSet <- ddply(allDataSet, .(subject, activity), function(x) colMeans(x[,1:66]))

# Created csv (tidy data set) in diretory
tidydf <- "./tidy-UCI-HAR-dataset.txt"
write.table(tidyDataSet, tidydf, row.names=FALSE)


