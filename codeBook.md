##Data:

###File "AverageData.txt"
contains tidy data set with the average of each variable for each activity and each subject.

####Subject 
group of 30 volunteers who carried out the experiment.
<br>Values: 1 to 30

####Activity 
six activities that each person performed.
<br>Values: 
* LAYING
* STANDING
* SITTING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

####Variables
79 variables containing average of each Mean or Std variable in sourse datasets, groupped by activity and subject.



##Code:

###File "run_analysis.R"

* Preparation step: Read all data files
* 1. Appropriately labels the data set with descriptive variable names (# 4 from assignment).
* 2. Merges the training and the test sets to create one data set (# 1 from assignment)).
* 3. Extracts only the measurements on the mean and standard deviation for each measurement (# 2 from assignment)).
* 4. Uses descriptive activity names to name the activities in the data set (#3 from assignment)).
* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject (# 5 from assignment).
