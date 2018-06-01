rm(list=ls())

library(dplyr)
library(reshape2)

## download original dataset
url = c("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
dest = c("wearComp.zip")
download.file(url, dest)
unzip("wearComp.zip")

## read required files into R
train <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
test <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
activity_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
activity_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

## read variable names into R
features <- read.table(file = "UCI HAR Dataset/features.txt") %>% 
    .[,2] %>% 
    as.character() %>%
    c("activity", "subject")

## append activity and subject data to train and test sets and then merge them
train <- cbind(train, activity_train, subject_train)
test <- cbind(test, activity_test, subject_test)
merged <- rbind(train, test)
colnames(merged) <- features
rm(test, train, activity_train, activity_test, subject_train, subject_test)

## extract only the measurements on the mean and standard deviation
## for each measurement
merged_mean <- colnames(merged) %>% grep(pattern = "mean\\(\\)") %>% merged[, .]
merged_std <- colnames(merged) %>% grep(pattern = "std\\(\\)") %>% merged[, .]
mean_std <- cbind(merged_mean, merged_std, merged$activity, merged$subject)
colnames(mean_std)[67] <- c("activity")
colnames(mean_std)[68] <- c("subject")
rm(merged_mean, merged_std)

## use descriptive activity names to name the activities in the data set
activity <- read.table(file = "UCI HAR Dataset/activity_labels.txt") %>%
    .[, 2] %>%
    tolower()

mean_std$activity <- activity[mean_std$activity]

## appropriately label the data set with descriptive variable names
pattern_replacement <- matrix(
    data = c(
        "^t", "time",
        "^f", "frequency",
        "Acc", "Acceleration",
        "Mag", "Magnitude",
        "Gyro", "Gyroscope",
        "\\(\\)", ""), 
    ncol = 2, byrow = TRUE) 

for (i in 1:nrow(pattern_replacement)) {
    colnames(mean_std) <- sub(pattern = pattern_replacement[i, 1], 
                              replacement = pattern_replacement[i, 2], 
                              colnames(mean_std))
}

## create a second, independent tidy data set with the average of each variable
## for each activity and each subject
melted <- melt(data = mean_std,
               id.vars = c("activity", "subject"))
final <- dcast(data = melted, 
               activity + subject ~ variable, mean)
rm(melted)
rm(pattern_replacement, activity, url, dest, features, i)

## output tidy data set as a txt file
write.table(final, file = "./tidyDataSet.txt", row.names = FALSE)
