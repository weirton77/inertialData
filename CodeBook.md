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
Only those columns containing "mean" or "std" were considered for further analysis
Averages were computed for each of the remaining variables, grouped by subject and activity.
