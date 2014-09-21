## README

See codebook.md to find out what variables the tidy data set contains.

The script uses dplyr package. If it's not installed on the computer, the script downloads and installs it.

The script can be run as long as the Samsung data is in your working directory. So you should download the zip file (from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), save it in your working directory and unzip it.

### The stages of run_analysis.R script (also see comments included in the script):

1. Installing dplyr library (if it hasn't been already installed).
2. Reading training data set (X_train.txt), subjects id (subject_train.txt) and activity labels (y_train.txt) and merging all the columns.
3. Reading test data set (X_test.txt), subjects id (subject_test.txt) and activity labels (y_test.txt) and merging all the columns.
4. Merging training and test sets in one data set.
5. Labeling the data set with descriptive variable names (from features.txt file).
6. Extracting only the measurements on the mean and standard deviation for each measurement (only these columns which names contain "mean()" or "std()").
7. Naming activities in the data set with descriptive activity names (from activity_labels.txt file).
7. Grouping the data set by subject id and activity label.
8. Summarising (calculating average values) all the measurements (features) for each activity and each subject.
9. Saving data set in tidy_data_set.txt in working directory.