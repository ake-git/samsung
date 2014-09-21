if (!"dplyr" %in% installed.packages()) install.packages("dplyr")	#installing dplyr package
library(dplyr)

train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_act <- read.table("./UCI HAR Dataset/train/y_train.txt")

train <- cbind(train_sub, train_act, train_set)	#merging subjects labels and activity labels with train set

test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_act <- read.table("./UCI HAR Dataset/test/y_test.txt")

test <- cbind(test_sub, test_act, test_set)	#merging subjects labels and activity labels with test set

merged <- rbind(train, test)	#merging train and test sets in one data set

features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")

names <- features$V2

colnames(merged) <- c("subject", "activity", names)	#labeling the data set with descriptive variable names

extr <- select(merged, subject, activity, contains("mean\\(\\)"), contains("std\\(\\)"))	#extracting only the measurements on the mean and standard deviation for each measurement

extr$activity[extr$activity == 1] <- "WALKING"
extr$activity[extr$activity == 2] <- "WALKING_UPSTAIRS"
extr$activity[extr$activity == 3] <- "WALKING_DOWNSTAIRS"
extr$activity[extr$activity == 4] <- "SITTING"
extr$activity[extr$activity == 5] <- "STANDING"
extr$activity[extr$activity == 6] <- "LAYING"	#using descriptive activity names to name the activities in the data set

group <- group_by(extr, subject, activity)

tidy <- summarise_each(group, funs(mean))	#calculating mean of each variable for each activity and each subject

write.table(tidy, file="./tidy_data_set.txt", row.names=FALSE)	#saving data set in the file

message("Output saved in the file tidy_data_set.txt in your working directory.")