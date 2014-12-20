The genesis of the data is described at the following site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data is a set of inertial signals taken at regular time intervals for 30 test subjects, performing six simple activities.  The measurements were recorded on a specific smartphone.

From the raw data, a vector of features was obtained by calculating variables from the time and frequency domain. The raw data, feature vectors, and various identifiers were randomly partitioned into 2 groups: train and test, and available in a zipfile: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
This zipfile was downloaded and unwrapped on the desktop.  The raw data was not used here.

As documented in the R-script, the "tidy data" was constructed as follows:
The feature vectors (561 in length) were read into a dataframe.
Column vectors were added to specify subject [1:30], and activity  (sitting, walking, etc)
A names vector was added (subject,activity,[features])
Only those columns containing "mean" or "std" were considered for further analysis.
Averages were computed for each of the remaining variables, grouped by subject and activity.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value         (33)
std(): Standard deviation  (33)
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  (13)

Additional 7 vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  XYZ
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

for a total of 86 vectors, averaged over 30 subjects

and contained in the actions2 txt file
