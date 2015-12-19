# Getting and Cleaning Data


### Coursera Class - Johns Hopkins Bloomberg School of Public Health

#### Course Project - Data Scrubbing
---
#### Code Book
---

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

---

- Transformations:
 - Feature/Variable #2, Activity was normalized from numerical descriptor to verbal descriptor.
 - Additionally, each feature was averaged grouped by Subject and Activity

The data in the data.table, `RClass03_Project.table` contains the following layout:

 - SubjectID: Participants numbered 1-30
 - Activity: Activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
 - tBodyAcc-mean()-X: mean() grouped by SubjectID and Activity
 - tBodyAcc-mean()-Y: mean() grouped by SubjectID and Activity
 - tBodyAcc-mean()-Z: mean() grouped by SubjectID and Activity
 - tBodyAcc-std()-X: mean() grouped by SubjectID and Activity
 - tBodyAcc-std()-Y: mean() grouped by SubjectID and Activity
 - tBodyAcc-std()-Z: mean() grouped by SubjectID and Activity
 - tGravityAcc-mean()-X: mean() grouped by SubjectID and Activity
 - tGravityAcc-mean()-Y: mean() grouped by SubjectID and Activity
 - tGravityAcc-mean()-Z: mean() grouped by SubjectID and Activity
 - tGravityAcc-std()-X: mean() grouped by SubjectID and Activity
 - tGravityAcc-std()-Y: mean() grouped by SubjectID and Activity
 - tGravityAcc-std()-Z: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-mean()-X: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-mean()-Y: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-mean()-Z: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-std()-X: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-std()-Y: mean() grouped by SubjectID and Activity
 - tBodyAccJerk-std()-Z: mean() grouped by SubjectID and Activity
 - tBodyGyro-mean()-X: mean() grouped by SubjectID and Activity
 - tBodyGyro-mean()-Y: mean() grouped by SubjectID and Activity
 - tBodyGyro-mean()-Z: mean() grouped by SubjectID and Activity
 - tBodyGyro-std()-X: mean() grouped by SubjectID and Activity
 - tBodyGyro-std()-Y: mean() grouped by SubjectID and Activity
 - tBodyGyro-std()-Z: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-mean()-X: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-mean()-Y: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-mean()-Z: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-std()-X: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-std()-Y: mean() grouped by SubjectID and Activity
 - tBodyGyroJerk-std()-Z: mean() grouped by SubjectID and Activity
 - tBodyAccMag-mean(): mean() grouped by SubjectID and Activity
 - tBodyAccMag-std(): mean() grouped by SubjectID and Activity
 - tBodyAccJerkMag-mean(): mean() grouped by SubjectID and Activity
 - tBodyAccJerkMag-std(): mean() grouped by SubjectID and Activity
 - tBodyGyroMag-mean(): mean() grouped by SubjectID and Activity
 - tBodyGyroMag-std(): mean() grouped by SubjectID and Activity
 - tBodyGyroJerkMag-mean(): mean() grouped by SubjectID and Activity
 - tBodyGyroJerkMag-std(): mean() grouped by SubjectID and Activity
 - fBodyAcc-mean()-X: mean() grouped by SubjectID and Activity
 - fBodyAcc-mean()-Y: mean() grouped by SubjectID and Activity
 - fBodyAcc-mean()-Z: mean() grouped by SubjectID and Activity
 - fBodyAcc-std()-X: mean() grouped by SubjectID and Activity
 - fBodyAcc-std()-Y: mean() grouped by SubjectID and Activity
 - fBodyAcc-std()-Z: mean() grouped by SubjectID and Activity
 - fBodyAcc-meanFreq()-X: mean() grouped by SubjectID and Activity
 - fBodyAcc-meanFreq()-Y: mean() grouped by SubjectID and Activity
 - fBodyAcc-meanFreq()-Z: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-mean()-X: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-mean()-Y: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-mean()-Z: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-std()-X: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-std()-Y: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-std()-Z: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-meanFreq()-X: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-meanFreq()-Y: mean() grouped by SubjectID and Activity
 - fBodyAccJerk-meanFreq()-Z: mean() grouped by SubjectID and Activity
 - fBodyGyro-mean()-X: mean() grouped by SubjectID and Activity
 - fBodyGyro-mean()-Y: mean() grouped by SubjectID and Activity
 - fBodyGyro-mean()-Z: mean() grouped by SubjectID and Activity
 - fBodyGyro-std()-X: mean() grouped by SubjectID and Activity
 - fBodyGyro-std()-Y: mean() grouped by SubjectID and Activity
 - fBodyGyro-std()-Z: mean() grouped by SubjectID and Activity
 - fBodyGyro-meanFreq()-X: mean() grouped by SubjectID and Activity
 - fBodyGyro-meanFreq()-Y: mean() grouped by SubjectID and Activity
 - fBodyGyro-meanFreq()-Z: mean() grouped by SubjectID and Activity
 - fBodyAccMag-mean(): mean() grouped by SubjectID and Activity
 - fBodyAccMag-std(): mean() grouped by SubjectID and Activity
 - fBodyAccMag-meanFreq(): mean() grouped by SubjectID and Activity
 - fBodyBodyAccJerkMag-mean(): mean() grouped by SubjectID and Activity
 - fBodyBodyAccJerkMag-std(): mean() grouped by SubjectID and Activity
 - fBodyBodyAccJerkMag-meanFreq(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroMag-mean(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroMag-std(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroMag-meanFreq(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroJerkMag-mean(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroJerkMag-std(): mean() grouped by SubjectID and Activity
 - fBodyBodyGyroJerkMag-meanFreq(): mean() grouped by SubjectID and Activity
 - angle(tBodyAccMean,gravity): mean() grouped by SubjectID and Activity
 - angle(tBodyAccJerkMean),gravityMean): mean() grouped by SubjectID and Activity
 - angle(tBodyGyroMean,gravityMean): mean() grouped by SubjectID and Activity
 - angle(tBodyGyroJerkMean,gravityMean): mean() grouped by SubjectID and Activity
 - angle(X,gravityMean): mean() grouped by SubjectID and Activity
 - angle(Y,gravityMean): mean() grouped by SubjectID and Activity
 - angle(Z,gravityMean): mean() grouped by SubjectID and Activity
