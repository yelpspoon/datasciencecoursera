# Getting and Cleaning Data
## Coursera Class - Johns Hopkins
### Bloomberg School of Public Health
#### Course Project - Data Scrubbing
---


The purpose of this project is to collect, work with, and clean a data set. The final goal is to prepare a tidy dataset that can be used for later analysis.
The data for this execise is from the University of California at Irvine's Donald Bren School of Information & Computer Science.  The data project, "Human Activity Recognition Using Smartphones Dataset (Version 1)", was authored by: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Università degli Studi di Genova.

[The data link for the UCI data file:](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
From this dataset, the data files used for _this_ analysis were the following:
- features.txt
- activity_labels.txt
- subject_train.txt
- y_train.txt
- X_train.txt
- subject_test.txt
- y_test.txt
- X_test.txt

Note *none* of the detail files in "Inertial Signals/" were used.

---

The following requirements are needed in order to run the R processing script, `run_analysis.R`
 - R Programming Language
 - R Package data.tables
 - GNU `paste` command (available in *nix Operating Systems including OSX)

The Class Project Requirements are as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with: 
   - the average of each variable for each activity and each subject.
---

The following _steps_ are performed within `run_analytics.R`
- Housekeeping
 -- The data.table package is loaded _or_ installed if not found.
 -- A `R/` directory is created in the users home directory (`~/`), if none exists.
 -- The R working directory is then set to `~/R/`.
 -- The zipped data file is download if none exists in `~/R/`.
 -- The zipped data file is unziped if `~/R/UCI HAR Dataset/` is not found.
 -- The R working directory is then set to `~/R/UCI HAR Dataset/`.
 -- The data files are setup as R variables.









