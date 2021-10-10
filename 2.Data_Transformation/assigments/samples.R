# Load the needed packages
packages <- c("data.table", "reshape2", "dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)


# Assumes the Git repository : https://github.com/dholtz/GettingAndCleaningData
# has been cloned to a users local machine, and the R, setwd(), has been used 
# to set the working directory to the root of this cloned repository.
path <- getwd()

# Give warning to set the working directory if not able to find data files.
projectDataPath <- file.path(path, "project_data")
fileCount <- length(list.files(projectDataPath, recursive=TRUE))
if (fileCount != 28) {
    stop("Please use setwd() to the root of the cloned repository.")
}


# Read in the 'Subject' data
dtTrainingSubjects <- fread(file.path(projectDataPath, "train", "subject_train.txt"))
dtTestSubjects  <- fread(file.path(projectDataPath, "test" , "subject_test.txt" ))


dtTestMeasures  <- data.table(read.table(file.path(projectDataPath, "test" , "X_test.txt")))


# Order all of the combined data by, subject and activity
setkey(dtSubjectAtvitiesWithMeasures, subject, activityNumber)


# Use grepl to just get features/measures related to mean and std
dtMeanStdMeasures <- dtAllFeatures[grepl("(mean|std)\\(\\)", measureName)]


# dtSubjectActivitiesWithMeasures
columnsToSelect <- c(key(dtSubjectAtvitiesWithMeasures), dtMeanStdMeasures$measureCode)
# Just take the rows with the columns of interest ( std() and mean() )
dtSubjectActivitesWithMeasuresMeanStd <- subset(dtSubjectAtvitiesWithMeasures, 
                                                select = columnsToSelect)

# Reshape the data to get the averages 
measureAvgerages <- dcast(dtSubjectActivitesWithMeasuresMeanStd, 
                          subject + activityName ~ measureName, 
                          mean, 
                          value.var="measureValue")



#MANUAL PLAN ----
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipURL,here("data"))

testx <- read.table(unz("data/fullsets.zip", "UCI HAR Dataset/test/X_test.txt"))

#confirm column names are unique
valid_column_names <- make.names(names=names(FullT), unique=TRUE, allow_ = TRUE)

select(group, subject, activity, contains(".mean."), contains(".std.")) %>% 
#I added the periods in contains() to eliminate the averages of the signals 
#    which are not means of measurements
    


















