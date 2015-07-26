#Code Book for Getting and Cleaning Data Course Project
by Steve Silvius

## Subject and Activity

The subject and activity variables are used to identify the individual participants and what they were doing when the 
measurements were taken.

* Subject: integer from 1:30 identifying the individual participant in the experiment
* Activity: character/factor indetifying which activity was taking place when measurements were collected. Either
	+ walking
	+ walking up stairs
	+ walking down stairs
	+ sitting
	+ standing
	+ laying
all participants performed all six activities. For more information on how the measurements were recorded during these
activities, please read the file "README.txt" included in the raw data.

## Means of Measurements

### Notes

* For the "tidy_data" data set, we are using a subset of the variables from the raw data. In particular, we are only
interested in measurements ("features") that represent a mean (denoted with "mean()" in variable name)
or a standard deviation (denoted with "std()" in variable name)

* All columns aside from "subject" and "activty" in the dataset "tidy_data" produced by this script take the
original measurement observations in the raw data that have the same name, group them by subject, and then by
activity, and provide _the mean_ of all observations of that variable for given subject and activity. 

* To better understand the original measurements from which these means are obtained, read the documentation in the raw 
data. To understand my choices for naming conventions and which variables to include or exclude, see "README.md" in
this repo. Key information is provided below:
	+ the leading character "t" tells us this is a _time domain_ measurement
	+ the leading character "f" tells us this is a _frequency_ measurement
	+ "ACC" in variable name tells us the measurement comes from the accelerometer
	+ "Gyro" in variable name tells us the measurement comes from the Gyroscope
	+ Both the accelerometer and the gyroscope produce "Body" and "Gravity" measurements, which are so denoted in the 
	variable names
	+ In most cases, the measurement is given along all three axes, X,Y, and Z. The specific axis for a variable is
	denoted by the last character in the variable name

###List of measurement variable names:
+ tBodyAcc-mean()-XYZ
+ tBodyAcc-std()-XYZ
+ tGravityAcc-mean()-XYZ
+ tGravityAcc-std()-XYZ
+ tBodyAccJerk-mean()-XYZ
+ tBodyAccJerk-std()-XYZ
+ tBodyGyro-mean()-XYZ
+ tBodyGyro-std()-XYZ
+ tBodyGyroJerk-mean()XYZ
+ tBodyGyroJerk-std()XYZ
+ tBodyAccMag-mean()
+ tBodyAccMag-std()
+ tGravityAccMag-mean()
+ tGravityAccMag-std()
+ tBodyAccJerkMag-mean()
+ tBodyAccJerkMag-std()
+ tBodyGyroMag-mean()
+ tBodyGyroMag-std()
+ tBodyGyroJerkMag-mean()
+ tBodyGyroJerkMag-std()
+ fBodyAcc-mean()-XYZ
+ fBodyAcc-std()-XYZ
+ fBodyAccJerk-mean()XYZ
+ fBodyAccJerk-std()XYZ
+ fBodyGyro-mean()-XYZ
+ fBodyGyro-std()-XYZ
+ fBodyAccMag-mean()
+ fBodyAccMag-std()
+ fBodyAccJerkMag-mean()
+ fBodyAccJerkMag-std()
+ fBodyGyroMag-mean()
+ fBodyGyroMag-std()
+ fBodyGyroJerkMag-mean()
+ fBodyGyroJerkMag-std()