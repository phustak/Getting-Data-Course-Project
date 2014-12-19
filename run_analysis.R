

### Getting Data Project

#---------------------------------------------------------
# 1. INTRO/BACKGROUD INFORMATION
#---------------------------------------------------------

# The purpose of this project is to demonstrate your ability to collect, work with, 
# and clean a data set. The goal is to prepare tidy data that can be used for later 
# analysis. You will be graded by your peers on a series of yes/no questions related 
# to the project. You will be required to submit: 
#   1) a tidy data set as described below, 
#   2) a link to a Github repository with your script for performing the analysis, and 
#   3) a code book that describes the variables, the data, and any transformations or work 
#      that you performed to clean up the data called CodeBook.md. 
# You should also include a README.md in the repo with your scripts. This repo explains 
# how all of the scripts work and how they are connected. 
 
# One of the most exciting areas in all of data science right now is wearable computing 
# - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing 
# to develop the most advanced algorithms to attract new users. The data linked to from 
# the course website represent data collected from the accelerometers from the Samsung 
# Galaxy S smartphone. A full description is available at the site where the data was obtained: 

# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
# Here are the data for the project: 

# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
#  of each variable for each activity and each subject.

#---------------------------------------------------------
# 2. PREREQUISITES
#---------------------------------------------------------

# This program assumes that the current working directory is in the root of the unpacked Samsung data 
#  as downloaded by the link above. Concretely, the existence of the following text files relative to 
# the working directory is necessary ...
#  activity_labels.txt
#  features.txt
#  train\subject_train.txt
#  train\y_train.txt
#  train\X_train.txt
#  test\subject_test.txt
#  test\y_test.txt
#  test\X_test.txt

#---------------------------------------------------------
# 3. The Data processing steps
#---------------------------------------------------------


### 1.Merge the training and the test sets to create one data set.

# Load activity and feature reference files
activity <- read.table("activity_labels.txt",col.names=c("activity_id","activity_desc"))
feature <- read.table("features.txt",col.names=c("feature_id","feature_desc"))

# Load aggregated train data and subject/activity info
subject_train <- read.table("train\\subject_train.txt",col.names="subject_id")
activity_train <- read.table("train\\y_train.txt",col.names="activity_id")
data_train <- read.table("train\\X_train.txt",col.names=feature$feature_desc)

# Load aggregated test data and subject/activity info
subject_test <- read.table("test\\subject_test.txt",col.names="subject_id")
activity_test <- read.table("test\\y_test.txt",col.names="activity_id")
data_test <- read.table("test\\X_test.txt",col.names=feature$feature_desc)

# Join all data
train <- cbind(train=1,subject_train,activity_train,data_train)# train data, add flag train=1
test <- cbind(train=0, subject_test,activity_test,data_test)   # train data, add flag train=0
all_data_1 <- rbind(train,test)

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# Identify variables with mean and standard deviation values
#    utilize the feature data frame read-in above
#    look up indexes of all variables that contain the string "mean()" or "std()"
meanAndStdVars <- c(grep("mean\\(\\)",feature$feature_desc),
                    grep("std\\(\\)",feature$feature_desc))
					
# Create data with all non-mean and non-std measurement variables removed
#   - keep the first three reference variables
#   - add 3 to the indexes of measurement variables to reflects their real 
#         position within the data frame (not only among themselves)
#   - use sort to keep the measurement variables in the original order
all_data_2 <- all_data_1[,c(1,2,3,3 + sort(meanAndStdVars))]

### 3. Use descriptive activity names to name the activities in the data set
# create factor version of the activity_id column of the data
#  utilize the activity data frame that was read above
activity_desc <- factor(all_data_2$activity_id,levels=activity$activity_id,labels=activity$activity_desc)
# Add the factor version of activity to the data frame, remove original numeric version of activity
all_data_3 <- cbind(activity_desc,all_data_2 [,-3]) 

### 4.Appropriately labels the data set with descriptive variable names
# Variables were already labelled properly above, here I will just 
#   clean up the names where they contain multiple dots 
all_data_4 <- all_data_3
colnames(all_data_4) <- gsub("\\.\\.", "", colnames(all_data_4))

### 5.From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject

# Use the aggregate function. 
#   For the input data take all columns from #4 onwards (measurements)
#   For the split data, take columns activity_desc and subject_id
aggregated_data <- aggregate( all_data_4[,4:dim(all_data_4)[2]], all_data_4[,c("activity_desc","subject_id")],mean)

### Create a text file 
write.table(aggregated_data,file="sensor_data_aggregated.txt", row.name=FALSE )

