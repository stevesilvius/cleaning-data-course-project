# Getting and Cleaning Data Course Project README 
by Steve Silvius

## The Raw Data

The raw data for this project can be found at, 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Included in this zip file is a README and two files, "features_info.txt" and "features.txt". 
Together, those files provide important background information for understanding the raw data and so I would urge the 
reader to peruse those files as well.

Finally, a full description of the study that produced that data, and the way that data was organized can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This information is also helpful in understanding the raw data for this project (which of course serves as a starting
point for understanding the tidy data that I have produced)

## Files in this repo

* 'README.md'

* 'CodeBook.md': Explains all of the variables in the tidy data set

* 'run_analysis.R': script used to produce the tidy data which can be used for replicating this work

## Understanding the project

### The Approach
1. This script assumes you have downloaded and unzipped the raw data into your working directory (as was stipulated we 
might assume in the assignment instructions)
2. The script begins by loading the librarirs "plyr" and "dplyr" which are used and must be installed in order for the
script to work properly
3. The script next creates a function "makeTidy" taking no parameters and returning the tidy data set
4. Finally the script creates a data frame "tidy_data" from the result of the makeTidy function

###steps in the makeTidy Function
1. Read all the relevant raw data into R (this does not include the inertial data as this was deemed irrelevant)
2. Add column names.
	+ for columns arising from "train/subject_train.txt" and "test/subject_test.txt" I chose the obvious column name,
	"subject"
	+ for columns arising from "train/y_train.txt" and "test/y_test.txy", I chose the name "activity"
	+ for columns arising from the "test/X_test.txt" and "train/Y_train.txt" files, I chose to use the original names 
	obtained from the "features.txt" file because I judged those names to be most descriptive and functional and felt
	that stripping any info such as "t", "f", etc would lead to less clarity and that replacing abbreviations with full
	words would make the names so long as to be less useful. Note: this approach has the added advantage that full
	explanation for of each variable by name can be found in the "features.info.txt" file in the raw data.
3. From the measurement columns, extract those that are the mean or standard deviation of a measurement.
	+ I chose not to use questionable variables such as "angle(tbodyAccMean, gravity)" as these did not seem to be
	+ means of measurements but rather new measurements computed using means.
4. Merge the data frames, including subject and activity and test and train sets using cbind and rbind respectively
5. Use aggregate and arrange to take mean of all observations for each subject by each activity, producing tidy data

# Notes

* Raw data originally downloaded on Tuesday, July 20, 2015

* This data and script are not intended for publication or use beyond the course project for the C
  Coursera Data Science Course titled "Getting and cleaning Data".

* Having said that, the author acknowledges the following publication [1] in accdordance with the license agreement
contained in the original raw data set

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
