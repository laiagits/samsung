### Description
The script run-analysis.R:

* Reads all the data required for execution located in the running directory within a subdirectory named ./UCI HAR Dataset/
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The Data
A description of the data can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Data can be downloaded folloing this link http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

###Process
run_analysis.R will clean and prepare the data as follows:
* combines all the training and test datasets into 3 data frames
* gets all the values from X sets where columns represent a mean or a standard deviation. For this the script uses the features file which contains descriptions for all columns 
* the measurements variable holds only the required measurements 
* in order to change labelling to a descriptive name, instead of using codes, the file activities is used to replace the values in Y with the relevant codes.
* Finnally ddaply will run the colMeans function for each combination of subject and activity found



