# Coursera-Getting-and-Cleaning-Data-Course-Project

Acknowledgement:
* Thread "Getting Started with the Course Project" by Jawad Habib (https://class.coursera.org/getdata-013/forum/thread?thread_id=191) is most helpful in understanding the requriments for this course project.
* Thread "David's personal course project FAQ" by David Hood (https://class.coursera.org/getdata-013/forum/thread?thread_id=30) helped to provide more explanations on what is expected (e.g. both wide and narrow forms are considered tidy; whether "mean()" or "mean" columns are considered "measurements on the mean" is up to the student's interpretation; do not need data from the inertial folder).

# This script created tidy data set in the wide form, and only considers "mean()" as "measurements on the mean".  

Assumptions:  
Samsung data (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) is unzipped into the current R working directory.

## Step A
The script starts with checking if the folder for Samsung data, "getdata-projectfiles-UCI HAR Dataset", exists in the working directory.  If it does not exist, an error message will be displayed.

## Step B
The script then reads the following files from the training and test directories, merge them into one data frame named "mergedData"
* subject_test.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt

The script also named the first 2 columns of "mergedData" as "Subject" and "ActivityID".

## Step C
Next, the script reads file "activity_labels.txt", and merge it with "mergedData" to add activity names to the data frame.

## Step D
Next, the script reads file "features.txt", and assigned the names of columns 3 to 563 in "mergedData" to be their feature names.
* Character "-" in the feature names in "features.txt" was replaced by "_" in "mergedData"
* Character "," in the feature names in "features.txt" was replaced by "." in "mergedData"
* In "mergedData", appended ".1" or ".2" to duplicated feature names originally from "features.txt" 

## Step E
Next, the script loads the "dplyr" package, then uses "select" to extract measurements on the mean and standard deviation; the extracted data is saved as "extractData"
* Only extracted feature names that contain "mean()" and "std"

## Step F
Next, the script groups "extractData" by Subject and Activity, then uses "summarise_each" to calculate the average of each feature in "extractData" for each activity and each subject. 
* Added "mean.of.extractData" to column names and saved the averges as "mean.of.extractData"

## Step G
Lastly, the script uses "write.table() with row.name=FALSE" to create the text file needed for uploading to the project submission.

## Step H
The script ends with the command on how to read to output text file back into R to double check.
