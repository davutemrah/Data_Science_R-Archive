# Author: Davut Ayan
# Date: June 24, 2021
# Assignment 

setwd("~/Desktop/Coursera/ETL/week4/assignment/")
rm(list=ls())
library(readr)
library(dplyr)
library(stringr)

# 1. Merges the training and the test sets to create one data set.

### Reading Test files
features <- read_delim("UCI HAR Dataset/features.txt",
                       delim = " ", col_types = cols(),
                       col_names = F, skip = 0)
# Read X_test file
x_test <- read_delim("UCI HAR Dataset/test/X_test.txt",
                     delim = " ", col_types = cols(),
                     col_names = F, skip = 0,
                     n_max = Inf, guess_max = min(1000, Inf))
# Read subject_test file
subject_test <- read_delim("UCI HAR Dataset/test/subject_test.txt",
                           delim = " ", col_types = cols(), 
                           col_names = F, skip = 0)
# Read Y_test file
y_test <- read_delim("UCI HAR Dataset/test/y_test.txt",
                     delim = " ", col_types = cols(),
                     col_names = F, skip = 0)
# rename columns in files
colnames(subject_test) <- paste("sub",colnames(subject_test),sep="_")
colnames(y_test) <- paste("lab",colnames(y_test),sep="_")

# merge all test files
test_set <- cbind.data.frame(subject_test, y_test, x_test)

# Read subject_train file
subject_train <- read_delim("UCI HAR Dataset/train/subject_train.txt",
                            delim = " ", col_types = cols(), 
                            col_names = F, skip = 0)
# Read X_train file
x_train <- read_delim("UCI HAR Dataset/train/X_train.txt",
                      delim = " ", col_types = cols(),
                      col_names = F, skip = 0,
                      n_max = Inf, guess_max = min(1000, Inf))
# Read Y_train file
y_train <- read_delim("UCI HAR Dataset/train/y_train.txt",
                      delim = " ", col_types = cols(),
                      col_names = F, skip = 0)
# rename columns in files
colnames(subject_train) <- paste("sub",colnames(subject_train),sep="_")
colnames(y_train) <- paste("lab",colnames(y_train),sep="_")

# merge all Train set files
train_set <- cbind.data.frame(subject_train, y_train, x_train)

# merge test and train data
merged_set <- rbind.data.frame(test_set, train_set)
merged_set <- data.frame(apply(merged_set, 2, as.numeric))


# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- 
    features %>%
    filter(grepl("mean|std", X2))

mean_std$X1 <- str_replace(mean_std$X1, "^", "X")
merged_set %>%
    select_if(colnames(merged_set) %in% mean_std$X1)


# 3 Uses descriptive activity names to name the activities in the data set

# variable and activity labels
activity_labels <- read_delim("UCI HAR Dataset/activity_labels.txt",
                              delim = " ", col_types = cols(),
                              col_names = F, skip = 0)

merged_set$lab_X1 <- factor(merged_set$lab_X1, 
                            levels = activity_labels$X1,
                          labels = activity_labels$X2)
# test it  
unique(merged_set$lab_X1)


# 4 Appropriately labels the data set with descriptive variable names. 
features$X2 <- paste0(features$X1, features$X2)
names(merged_set)[3:563] <- features$X2


# 5 From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.
merged_set_ave <-
    merged_set %>%
    group_by(sub_X1, lab_X1) %>%
    summarise_all(mean, na.rm=T )

# writing data files
variables <- names(merged_set)
write.table(variables, "variables.txt", row.names=F)
write.table(merged_set, "merged_tidy.txt", row.names=F)
write.table(merged_set_ave, "merged_tidy_averages.txt", row.names=F )


