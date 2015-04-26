# Coursera-Getting-and-Cleaning-Data-Course-Project

Based on course project description (https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions), the data used in this course project is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data for the project can be downloaed from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To summarize, the experiments were carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Based on certain sampling and signal processing strategy (refer to "README.txt" from the downloaded data), 10299 records were captured; 7352 were used as a training set, the remaining 2947 records were used as a test set. Each record included a 561-feature vector with time and frequency domain variables, its activity label, an identifier of the subject who carried out the experiment.

# Raw Data
The downloaded data set, when unzipped, can be found in a folder named  ".\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset". There are 4 text files and 2 directories in this folder. 

## File "README.txt"
This file contains the detailed information on the raw data set and the experiments.

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

## Directory "train" has 3 files.

* subject_train.txt: ID of the subject for each of the 7352 records in the training set, subject ID ranges from 1 to 30.
* X_train.txt: Values of the 561 features for each of the 7352 records in the training set.
* y_train.txt: ID of the activity for each of the 7352 records in the training set, activities ID ranges from 1 to 6.

# Processed Data
## Merge the test and training sets
* The data in the test set (subject_test.txt, X_test.txt, and y_test.txt) are combined together as a data frame for the test set; 
* The data in the trainiing set (subject_train.txt, X_train.txt, and y_train.txt) are combined together as a data frame for the training set; 
* The data sets from the 2 steps above are then combined together as the merged data set.

## Add descriptive names
* Activity names in "activity_labels.txt" are merged into the merged data set from the step above.
* Feature names in "features.txt" are processed and assigned to the feature columns in the merged data set.  File "README.md" in this repo has more details on the sub-steps taken in this step.

## Extract data from the merged data set 
Only the measurements on the mean and standard deviation for each feature is extracted. Regarding "measurements on the mean", only the columns whose name contain "mean()" is extracted.

## Create a 2nd tidy data set
For the 2nd, independent tidy data set, the average of each extracted feature (from the step above) for each activity and each subject was calculated.

## Output the 2nd tidy data set
The final data set from the step above is saved as a txt file created with write.table() using row.name=FALSE.

# Final data set columns
For details on the feature, refer to Feature Info copied from "features_info.txt" (at the end of this code book).  Note that according to "README.txt" from the downloaded data, each feature in the raw data was normalized and bounded within [-1,1].
*  	1	Subject	: ID for the 30 volunteers
*  	2	Activity_Label	: 6 activities peformed by the volunteers (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
*  	3	mean.of.tBodyAcc_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_mean()_X"
*  	4	mean.of.tBodyAcc_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_mean()_Y"
*  	5	mean.of.tBodyAcc_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_mean()_Z"
*  	6	mean.of.tGravityAcc_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_mean()_X"
*  	7	mean.of.tGravityAcc_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_mean()_Y"
*  	8	mean.of.tGravityAcc_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_mean()_Z"
*  	9	mean.of.tBodyAccJerk_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_mean()_X"
*  	10	mean.of.tBodyAccJerk_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_mean()_Y"
*  	11	mean.of.tBodyAccJerk_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_mean()_Z"
*  	12	mean.of.tBodyGyro_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_mean()_X"
*  	13	mean.of.tBodyGyro_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_mean()_Y"
*  	14	mean.of.tBodyGyro_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_mean()_Z"
*  	15	mean.of.tBodyGyroJerk_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_mean()_X"
*  	16	mean.of.tBodyGyroJerk_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_mean()_Y"
*  	17	mean.of.tBodyGyroJerk_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_mean()_Z"
*  	18	mean.of.tBodyAccMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccMag_mean()"
*  	19	mean.of.tGravityAccMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAccMag_mean()"
*  	20	mean.of.tBodyAccJerkMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerkMag_mean()"
*  	21	mean.of.tBodyGyroMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroMag_mean()"
*  	22	mean.of.tBodyGyroJerkMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerkMag_mean()"
*  	23	mean.of.fBodyAcc_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_mean()_X"
*  	24	mean.of.fBodyAcc_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_mean()_Y"
*  	25	mean.of.fBodyAcc_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_mean()_Z"
*  	26	mean.of.fBodyAccJerk_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_mean()_X"
*  	27	mean.of.fBodyAccJerk_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_mean()_Y"
*  	28	mean.of.fBodyAccJerk_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_mean()_Z"
*  	29	mean.of.fBodyGyro_mean()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_mean()_X"
*  	30	mean.of.fBodyGyro_mean()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_mean()_Y"
*  	31	mean.of.fBodyGyro_mean()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_mean()_Z"
*  	32	mean.of.fBodyAccMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccMag_mean()"
*  	33	mean.of.fBodyBodyAccJerkMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyAccJerkMag_mean()"
*  	34	mean.of.fBodyBodyGyroMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyGyroMag_mean()"
*  	35	mean.of.fBodyBodyGyroJerkMag_mean()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyGyroJerkMag_mean()"
*  	36	mean.of.tBodyAcc_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_std()_X"
*  	37	mean.of.tBodyAcc_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_std()_Y"
*  	38	mean.of.tBodyAcc_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAcc_std()_Z"
*  	39	mean.of.tGravityAcc_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_std()_X"
*  	40	mean.of.tGravityAcc_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_std()_Y"
*  	41	mean.of.tGravityAcc_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAcc_std()_Z"
*  	42	mean.of.tBodyAccJerk_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_std()_X"
*  	43	mean.of.tBodyAccJerk_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_std()_Y"
*  	44	mean.of.tBodyAccJerk_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerk_std()_Z"
*  	45	mean.of.tBodyGyro_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_std()_X"
*  	46	mean.of.tBodyGyro_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_std()_Y"
*  	47	mean.of.tBodyGyro_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyro_std()_Z"
*  	48	mean.of.tBodyGyroJerk_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_std()_X"
*  	49	mean.of.tBodyGyroJerk_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_std()_Y"
*  	50	mean.of.tBodyGyroJerk_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerk_std()_Z"
*  	51	mean.of.tBodyAccMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccMag_std()"
*  	52	mean.of.tGravityAccMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tGravityAccMag_std()"
*  	53	mean.of.tBodyAccJerkMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyAccJerkMag_std()"
*  	54	mean.of.tBodyGyroMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroMag_std()"
*  	55	mean.of.tBodyGyroJerkMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "tBodyGyroJerkMag_std()"
*  	56	mean.of.fBodyAcc_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_std()_X"
*  	57	mean.of.fBodyAcc_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_std()_Y"
*  	58	mean.of.fBodyAcc_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAcc_std()_Z"
*  	59	mean.of.fBodyAccJerk_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_std()_X"
*  	60	mean.of.fBodyAccJerk_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_std()_Y"
*  	61	mean.of.fBodyAccJerk_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccJerk_std()_Z"
*  	62	mean.of.fBodyGyro_std()_X	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_std()_X"
*  	63	mean.of.fBodyGyro_std()_Y	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_std()_Y"
*  	64	mean.of.fBodyGyro_std()_Z	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyGyro_std()_Z"
*  	65	mean.of.fBodyAccMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyAccMag_std()"
*  	66	mean.of.fBodyBodyAccJerkMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyAccJerkMag_std()"
*  	67	mean.of.fBodyBodyGyroMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyGyroMag_std()"
*  	68	mean.of.fBodyBodyGyroJerkMag_std()	: For each subject in column "Subject" and each activity in column "Activity_Label", the average of feature "fBodyBodyGyroJerkMag_std()"


## Feature Info copied from "features_info.txt"

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
