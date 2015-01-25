### run_analysis.R - Data 

The script uses data available puclicly and performs some modifications explained below.
A description of the original data can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data can be downloaded folloing this link http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The original data contains 10299 observations in total for test and train data of 30 invididual subjects whilst perfoming different activities. 

These are the main changes and hence differences between the original data set and the one produced after unning this script:

* Train and test data is combines into one data set as rows and hence totalling 10299 observations
* The original file contains 561 measurements for both training and test data. By using the description file features.txt, we can identify those measurements that relate to mean and standard deviations and select only those variables from the data. We reduce the initial 561 variables to 66.
* Activities are encided with numbers which makes difficult to understand what the subject was doing when the measurement was taken. The script will use the activities file to replace those codes with a textual description.
* The script calculates the mean of all the measurements for each subject given a specific activity, giving a total number of 180 combinations. 
* The final file includes hence an observation for each subject on each different type of activity each observation being the average of measures taken by the device as mean or standar deviation


###Process
run_analysis.R will clean and prepare the data as follows:
* combines all the training and test datasets into 3 data frames
* gets all the values from X sets where columns represent a mean or a standard deviation. For this the script uses the features file which contains descriptions for all columns 
* the measurements variable holds only the required measurements 
* in order to change labelling to a descriptive name, instead of using codes, the file activities is used to replace the values in Y with the relevant codes.
* Finnally ddaply will run the colMeans function for each combination of subject and activity found 



