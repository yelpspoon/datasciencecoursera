#-------------------------------------------------------------------------------------------#
# run_analysis.R
# R script used to manipulate the UCI HAR Dataset for the Cousera R Class:
# "Getting and Cleaning Data" - Johns Hopkins' Bloomberg School of Public Health.
#
# This R script will attemp to minimize the use of external functions or wrapper
# scripts (bash).  There are some non-base R requirements and one external commnad:
# 
# REQUIREMENTS:
#  - table.data package OR an internet connecto to get the table.data package
#  - GNU paste command; any *nix OS will have a usage "paste" command (OSX included)
#
# Script Goals (per Class Project):
# 1) Merge the training and the test sets to create one data set.
# 2) Extract only the measurements on the mean and standard deviation for each measurement. 
# 3) Use descriptive Activity names to name the activities in the data set.
# 4) Appropriately label the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#
# D.Colon 2015.12.17
#-------------------------------------------------------------------------------------------#

# load the awesome data.table package
if (!is.element('data.table', installed.packages()[,1]))
  install.packages('data.table', dep = TRUE)
require(data.table) 

# Create/set initial Working Directory
dir.create('~/R/', showWarnings = FALSE)
setwd('~/R/')

# Get the data if not gotten
dataURL='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
dataFile='UCI%20HAR%20Dataset.zip'
if (!file.exists(dataFile)){  download.file(dataURL, destfile = dataFile)  }

# Update working directory based on UCI HAR Dataset download and expansion (unzip)
zipDir='UCI HAR Dataset'
if (!file.exists(zipDir)){ unzip(dataFile)} 
setwd(zipDir) 

## Data layout; SPACE DELIMITED files
features_file<-'features.txt'           # => table of 561 feature/variable names
activity_file<-'activity_labels.txt'    # => (lookup) table of (6) Activities
tr_X<- './train/X_train.txt'            # => training observation file of 561 features
tr_y<- './train/y_train.txt'            # => training Activity lables
tr_smpl <- './train/subject_train.txt'  # => training sample subjects
## ./train/Inertial Signals             # => phone data detail (not used in this data scrub)
t_X<- './test/X_test.txt'               # => test observation file of 561 features
t_y<- './test/y_test.txt'               # => test Activity lables
t_smpl<- './test/subject_test.txt'      # => test sample subjects
## ./test/Inertial Signals              # => phone data detail (not used in this data scrub)

## Create Activity DT for de-normalizing main data.tables
DT_act<-fread(activity_file, 
              colClasses=c("character","character"), 
              col.names=c('key','Activity')
              )
setkey(DT_act, key)                             ## Setkey for later data.table join

## Create Column Header for Interim Table(s) column renaming
DT_feat<-fread(features_file)
col_hdr<-c("SubjectID","Activity")              ## Start Header Names vector
col_hdr<-append(col_hdr, DT_feat[,V2])          ## Append Feature Names to vector

## Create numeric vector subset of headers containing:
## Subject, Activity, Mean & Std Dev. columns for later grepping
grep_columns<-c(1,2,grep("std|mean", col_hdr, ignore.case = TRUE)) 


#----------------------------- Load Interim data.tables -------------------------------------#
## TEST Data; GNU paste into data.table: subject, activity and observation files vi OS ##
inFile<- paste("paste -d' '", t_smpl, t_y, t_X, sep = " ")
DT_test_raw<-fread(inFile,  sep = " ", header = FALSE )
setnames(DT_test_raw, col_hdr)                               ## Change Column Names

## De-normalize Activity column; 
## update Activity number with verbiage from Activity_labels file
DT_test_raw<- DT_test_raw[, Activity:=as.character(Activity)]
setkey(DT_test_raw, Activity)                   ## Setkey for join
DT_test_raw<-DT_test_raw[DT_act, Activity := i.Activity]     ## Update on join

## Grep for mean/std and move to tidier data.table
DT_test<-DT_test_raw[, grep_columns, with=FALSE]


## TRAINing Data; GNU paste into data.table: subject, activity and observation files vi OS ##
inFile<- paste("paste -d' '", tr_smpl, tr_y, tr_X, sep = " ")
DT_train_raw<-fread(inFile,  sep = " ", header = FALSE )
setnames(DT_train_raw, col_hdr)                               ## Change Column Names

## De-normalize Activity column; 
## update Activity number with verbiage from Activity_labels file
DT_train_raw<- DT_train_raw[, Activity:=as.character(Activity)]
setkey(DT_train_raw, Activity)                                ## Setkey for join
DT_train_raw<-DT_train_raw[DT_act, Activity := i.Activity]    ## Update on join

## Grep for mean/std and move to tidier data.table
DT_train<-DT_train_raw[, grep_columns, with=FALSE]

## Merge traiing & test data into composite dataset
DT_Final<-rbind(DT_test, DT_train)

## Create Tidy Dataset of mean() grouped by Subject & Activity
DT_FinalTidy<-DT_Final[, lapply(.SD, mean), by=list(SubjectID,Activity)]

## Write to file for export
write.table(DT_FinalTidy, file = "RClass03_Project.table", row.names = FALSE)
