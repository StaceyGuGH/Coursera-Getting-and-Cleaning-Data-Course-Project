# Coursera-Getting-and-Cleaning-Data-Course-Project

Requirements for this script:  
Samsung data (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) is unzipped into the current R working directory.

## The script starts with checking if the folder for Samsung data, getdata-projectfiles-UCI HAR Dataset, exists in the working directory.  If it does not exist, an error message will be displayed.

## The script then reads the following files from the training and test directories, merge them into one data frame named "mergedData"
* subject_test.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt
The script also named the first 2 columns of "mergedData" as "Subject" and "ActivityID"

## Next, the script reads file "activity_labels.txt", and merge it with "mergedData" to add activity names to the data frame

## Next, the script reads file "features.txt", and assigned the names of columns 3 to 563 in "mergedData" to be their feature names.
* Character "-" in the feature names in "features.txt" was replaced by "_"
* Character "," in the feature names in "features.txt" was replaced by "."
* Appended ".2" or ".3" to duplicated feature names from "features.txt" 

## Next, load the "dplyr" package, then use "select" to extract measurements on the mean and standard deviation; the extracted data is saved as "extractData"
* Only extracted feature names that contain "mean()" and "std"

## Next, group "extractData" by Subject and Activity, then use "summarise_each" to calculate the average of each feature in "extractData" for each activity and each subject. 
* Added "mean.of.extractData" to column names and saved the averges as "mean.of.extractData"

## Lastly, use "write.table() with row.name=FALSE" to create the text file needed for uploading to the project submission.

## The script ends with the command on how to read to text file back into R to double check.
