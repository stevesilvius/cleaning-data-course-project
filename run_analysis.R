#load libraries we will be using
library("plyr")
library("dplyr")

# The following function takes no arguments, it gathers the raw data for this
# project (assuming that data is in your working directory)
# manipulates that data by merging data sets, adding names, 
# and extracting certain variables, and returns a tidy data set with means for 
# those variables

makeTidy <- function() {

	# Read in training data
	train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
	train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
	train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")

	# Read in test data
	test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
	test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
	test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

	# Read in the names of the features and create a vector of those names
	features <- read.table ("./UCI HAR Dataset/features.txt")
	column_names <- features[, 2]

	# Set column names for training set and test set data, activities and 
	# subjects
	colnames(train_data) <- column_names
	colnames(test_data) <- column_names
	colnames(train_subjects) <- c("subject")
	colnames(train_activities) <- c("activity")
	colnames(test_subjects) <- c("subject")
	colnames(test_activities) <- c("activity")

	# Rename activities in training and test data sets to make names descriptive
	train_activities <- train_activities$activity
	test_activities <- test_activities$activity
	train_activities <- factor(train_activities)
	test_activities <- factor(test_activities)
	train_activities <- revalue(train_activities, 
		c("1" = "walking", "2" = "walking up stairs", 
			"3" = "walking down stairs", 
			"4" = "sitting", "5" = "standing", "6" = "laying"))
	test_activities <- revalue(test_activities, 
		c("1" = "walking", "2" = "walking up stairs", 
			"3" = "walking down stairs", 
			"4" = "sitting", "5" = "standing", "6" = "laying"))

	# Reform test and train activities as data frames with correct colnames
	train_activities <- data.frame(train_activities)
	test_activities <- data.frame(test_activities)
	colnames(train_activities) <- c("activity")
	colnames(test_activities) <- c("activity")

	# Subset training data and test data to include only means and 
	# standard deviations for each measurement
	key_vars <- v <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:206, 240:241, 
		253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

	new_train_data <- train_data[, key_vars]
	new_test_data <- test_data[, key_vars]

	# Add subject and activities to train data frame
	merged_train_data <- cbind(train_subjects, train_activities, new_train_data)
	merged_test_data <- cbind(test_subjects,test_activities, new_test_data)

	# Merge train and test data frames
	data <- rbind(merged_train_data, merged_test_data)

	# Collapse the data to provide the mean for each measurement grouped by 
	# subject and activity

	tidy_data <- aggregate(. ~subject + activity, data, mean)

	#arrange the data by subject and activity
	tidy_data <- arrange(tidy_data, subject, activity)

	return(tidy_data)
}

tidy_data <- makeTidy()


