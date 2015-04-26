## R script for "Getting and Cleaning Data" Course Project


dataDir <- "getdata-projectfiles-UCI HAR Dataset"
if (!file.exists(dataDir)) {
    stop("Please download data for this course project and unzip it in your R working directory")
}

## task 1: Merges the training and the test sets to create one data set.
    dataDir <- paste("./",dataDir,"/UCI HAR Dataset", sep="")
    subject_test <- read.table(paste(dataDir,"/test/subject_test.txt",sep=""))
    X_test <- read.table(paste(dataDir,"/test/X_test.txt",sep=""))
    y_test <- read.table(paste(dataDir,"/test/y_test.txt",sep=""))
    subject_train <- read.table(paste(dataDir,"/train/subject_train.txt",sep=""))
    X_train <- read.table(paste(dataDir,"/train/X_train.txt",sep=""))
    y_train <- read.table(paste(dataDir,"/train/y_train.txt",sep=""))
    
    tmp1 <- cbind(subject_test,y_test,X_test)
    tmp2 <- cbind(subject_train,y_train,X_train)
    mergedData <- rbind(tmp1,tmp2)
    colnames(mergedData)[1] <- "Subject"
    colnames(mergedData)[2] <- "ActivityID"


## task 3: Uses descriptive activity names to name the activities in the data set
    activity_labels <- read.table(paste(dataDir,"/activity_labels.txt",sep=""))
    colnames(activity_labels) <- c("ActivityID", "Activity_Label")
    
    mergedData <- merge(mergedData,activity_labels)

## task 4: Appropriately labels the data set with descriptive variable names.
    features <- read.table(paste(dataDir,"/features.txt",sep=""))
    features[,2] <- gsub("-","_",features[,2])
    features[,2] <- gsub(",",".",features[,2])
  ##features[,2] <- gsub("\\(\\)","FUN",features[,2])

    colnames(mergedData)[3:563] <- features[,2]
    ## shortcut to add "*.2" or "*.2" to duplicated column names due to 
    ##          duplicated names in "features.txt"
    mergedData <- mergedData[,]

## task 2: Extracts only the measurements on the mean and standard deviation for 
##         each measurement. 
    library("dplyr")
    tmp3 <- tbl_df(mergedData)
    extractData <- select(tmp3,contains("Subject"),contains("Activity_Label"),
                    contains("mean()"), contains("std"))

## task 5: From the data set in task 4, creates a second, independent tidy data 
##         set with the average of each variable for each activity and each subject.
    tmp4 <- group_by(extractData, Subject, Activity_Label)
    mean.of.extractData <- summarise_each(tmp4,funs(mean))
    colnames(mean.of.extractData)[3:68] <- 
             paste("mean.of.",colnames(mean.of.extractData)[3:68],sep="")

## save final data set as a txt file created with 
##      write.table() using row.name=FALSE

    write.table(mean.of.extractData, "./class3project-output.txt", row.name=FALSE)

## read the output txt file back for testing
    data <- read.table("./class3project-output.txt", header = TRUE)
    View(data)


