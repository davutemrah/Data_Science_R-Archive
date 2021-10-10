#coursera week 4 - Getting and cleaning Data

#Appropriately labels the data set with descriptive variable names Number 4

# get the names from features.txt
features <- read.table("features.txt")

# only second column needed
features <- features[2]

# to get a vector transform it
features <- t(features)

# first, read all the test, data, name is our feature-vector
test_X <- read.table("test/X_test.txt", col.names = features) # test DATA 
test_Y <- read.table("test/y_test.txt", col.names = "activity_grp") # test activity LABELS --> Number 3, descriptive activity names
test_subject<- read.table("test/subject_test.txt", col.names = "subject_num") # test SUBJECT#

bind.Test <- cbind(test_subject, test_Y, test_X)

train_Y <- read.table("train/y_train.txt", col.names="activity_grp")# train DATA
train_X <- read.table("train/X_train.txt", col.names = features) # train activity LABELS
train_subject <- read.table("train/subject_train.txt", col.names = "subject_num") # train SUBJECT#

bind.Subject <- cbind(train_subject, train_Y, train_X)

# now merge the data together
# Merges the training and the test sets to create one data set. Number 1.
Data <- rbind(bind.Test, bind.Subject)

library(tibble)
Data <- as_tibble(Data)
Data # looking at data

# Number 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# filter all columns with the char "mean" and "std" in it.
library(dplyr)
grep.mean <- Data[,grepl("mean", names(Data))]
grep.std  <- Data[,grepl("std", names(Data))]
extract <- cbind(Data[1], Data[2], grep.mean, grep.std)

# use descriptive names
colnames(extract) <- sub("-mean\\()","Mean",names(extract))
colnames(extract) <- sub("-std\\()","Std",names(extract))
colnames(extract) <- sub("\\()","",names(extract))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.#
Tidydata <- extract%>%
    group_by(subject_num, activity_grp)%>%
    summarise(
        across(.cols = everything(), mean))
write.csv(Tidydata,"tidydata.csv")

write.table(Tidydata,"tidyforCoursera.txt", row.name=FALSE)