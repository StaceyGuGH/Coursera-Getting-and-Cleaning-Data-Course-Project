# Coursera-Getting-and-Cleaning-Data-Course-Project

The data used in this course project is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data for the project can be downloaed from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To summarize, the experiments was carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Based on certain sampling and signal processing strategy (refer to "README.txt" from the downloaded data), 10299 records were captured; 7352 were used as a training set, the remaining 2947 records were used as a test set. Each record included a 561-feature vector with time and frequency domain variables, its activity label, an identifier of the subject who carried out the experiment.

# Raw Data
The downloaded data set, when unzipped, are in a folder  ".\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset". There are 4 text files and 2 directories in this folder. 

## File "README.txt"
This file contains the detailed information on the raw data set.

## File "activity_labels.txt"
This file contains the mapping of activity ID's (1 to 6) and their corresponding activity names.

## File "features_info.txt" 
This file contains the detailed information on the 561 features.

## File "features.txt" 
This file contains the list of names of the 561 features; the same feature name could be duplicated up to 3 times in some cases.

## Directory "test" has 3 files. 

* subject_test.txt: ID of the subject for each of the 2947 records in the test set, subject ID ranges from 1 to 30.
* X_test.txt: Values of the 561 features for each of the 2947 records in the test set.
* y_test.txt: ID of the activity for each of the 2947 records in the test set, activities ID ranges from 1 to 6.

## Directory "train" has 3 files

* subject_train.txt: ID of the subject for each of the 7352 records in the training set, subject ID ranges from 1 to 30.
* X_train.txt: Values of the 561 features for each of the 2947 records in the test set.
* y_train.txt: ID of the activity for each of the 7352 records in the training set, activities ID ranges from 1 to 6.

# Processed Data
## Merge the test and training sets
* The data in the test set (subject_test.txt, X_test.txt, and y_test.txt) are combined together as a data frame for the test set; 
* The data in the trainiing set (subject_train.txt, X_train.txt, and y_train.txt) are combined together as a data frame for the training set; 
* The data from the 2 steps above are then combined together as the merged data set.

## Add descriptive names
* Activity names in "activity_labels.txt" are merged into the merged data set from the step above
* Feature names in "features.txt" are processed and assigned to the feature columns in the merged data set.  File "README.md" in this repo has more details on the sub-steps taken in this step.

## Extracts only the measurements on the mean and standard deviation for each measurement. 

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## save final data set as a txt file created with write.table() using row.name=FALSE

# Final data set columns
*  	1	Subject
*  	2	Activity_Label
*  	3	mean.of.tBodyAcc_mean()_X
*  	4	mean.of.tBodyAcc_mean()_Y
*  	5	mean.of.tBodyAcc_mean()_Z
*  	6	mean.of.tGravityAcc_mean()_X
*  	7	mean.of.tGravityAcc_mean()_Y
*  	8	mean.of.tGravityAcc_mean()_Z
*  	9	mean.of.tBodyAccJerk_mean()_X
*  	10	mean.of.tBodyAccJerk_mean()_Y
*  	11	mean.of.tBodyAccJerk_mean()_Z
*  	12	mean.of.tBodyGyro_mean()_X
*  	13	mean.of.tBodyGyro_mean()_Y
*  	14	mean.of.tBodyGyro_mean()_Z
*  	15	mean.of.tBodyGyroJerk_mean()_X
*  	16	mean.of.tBodyGyroJerk_mean()_Y
*  	17	mean.of.tBodyGyroJerk_mean()_Z
*  	18	mean.of.tBodyAccMag_mean()
*  	19	mean.of.tGravityAccMag_mean()
*  	20	mean.of.tBodyAccJerkMag_mean()
*  	21	mean.of.tBodyGyroMag_mean()
*  	22	mean.of.tBodyGyroJerkMag_mean()
*  	23	mean.of.fBodyAcc_mean()_X
*  	24	mean.of.fBodyAcc_mean()_Y
*  	25	mean.of.fBodyAcc_mean()_Z
*  	26	mean.of.fBodyAccJerk_mean()_X
*  	27	mean.of.fBodyAccJerk_mean()_Y
*  	28	mean.of.fBodyAccJerk_mean()_Z
*  	29	mean.of.fBodyGyro_mean()_X
*  	30	mean.of.fBodyGyro_mean()_Y
*  	31	mean.of.fBodyGyro_mean()_Z
*  	32	mean.of.fBodyAccMag_mean()
*  	33	mean.of.fBodyBodyAccJerkMag_mean()
*  	34	mean.of.fBodyBodyGyroMag_mean()
*  	35	mean.of.fBodyBodyGyroJerkMag_mean()
*  	36	mean.of.tBodyAcc_std()_X
*  	37	mean.of.tBodyAcc_std()_Y
*  	38	mean.of.tBodyAcc_std()_Z
*  	39	mean.of.tGravityAcc_std()_X
*  	40	mean.of.tGravityAcc_std()_Y
*  	41	mean.of.tGravityAcc_std()_Z
*  	42	mean.of.tBodyAccJerk_std()_X
*  	43	mean.of.tBodyAccJerk_std()_Y
*  	44	mean.of.tBodyAccJerk_std()_Z
*  	45	mean.of.tBodyGyro_std()_X
*  	46	mean.of.tBodyGyro_std()_Y
*  	47	mean.of.tBodyGyro_std()_Z
*  	48	mean.of.tBodyGyroJerk_std()_X
*  	49	mean.of.tBodyGyroJerk_std()_Y
*  	50	mean.of.tBodyGyroJerk_std()_Z
*  	51	mean.of.tBodyAccMag_std()
*  	52	mean.of.tGravityAccMag_std()
*  	53	mean.of.tBodyAccJerkMag_std()
*  	54	mean.of.tBodyGyroMag_std()
*  	55	mean.of.tBodyGyroJerkMag_std()
*  	56	mean.of.fBodyAcc_std()_X
*  	57	mean.of.fBodyAcc_std()_Y
*  	58	mean.of.fBodyAcc_std()_Z
*  	59	mean.of.fBodyAccJerk_std()_X
*  	60	mean.of.fBodyAccJerk_std()_Y
*  	61	mean.of.fBodyAccJerk_std()_Z
*  	62	mean.of.fBodyGyro_std()_X
*  	63	mean.of.fBodyGyro_std()_Y
*  	64	mean.of.fBodyGyro_std()_Z
*  	65	mean.of.fBodyAccMag_std()
*  	66	mean.of.fBodyBodyAccJerkMag_std()
*  	67	mean.of.fBodyBodyGyroMag_std()
*  	68	mean.of.fBodyBodyGyroJerkMag_std()


 