library(dplyr)

##Read in the main text files
filetest <- read.table("UCI HAR Dataset/test/X_test.txt")
filetrain <- read.table("UCI HAR Dataset/train/X_train.txt")

activitytest <- read.table("UCI HAR Dataset/test/y_test.txt")
activitytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

headers <- read.table("UCI HAR Dataset/features.txt")
activityHeaders <- read.table("UCI HAR Dataset/activity_labels.txt")


##Apend headers to data frames
colnames(filetest) <- headers[[2]]
colnames(filetrain) <- headers[[2]]

##Rename headers for Activity
colnames(activitytest) <- "Activity"
colnames(activitytrain) <- "Activity"

##Append activity to main data sets
filetest <- cbind(filetest,activitytest)
filetrain <- cbind(filetrain,activitytrain)

##Rename headers for Subject
colnames(subjecttest) <- "Subject"
colnames(subjecttrain) <- "Subject"

##Append subject to main data sets
filetest <- cbind(filetest,subjecttest)
filetrain <- cbind(filetrain,subjecttrain)

##Combine data sets
combinedDataSet <- rbind(filetest,filetrain)


## Merge the activity names with dataset
colnames(activityHeaders) <- c("Activity","ActivityName")
combinedDataSet <- merge(combinedDataSet,activityHeaders)


## Only mean and std columns
filterSet <- combinedDataSet[grep("(std|mean|^activityname|^subject)", tolower(colnames(combinedDataSet)), perl=T)]


##Create final dataset
finalDataSet <- aggregate(filterSet[, 1:86], list(filterSet$Subject, filterSet$ActivityName), mean)
colnames(finalDataSet)[1:2] <- c("Subject","ActivityName")