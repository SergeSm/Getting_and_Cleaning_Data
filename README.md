# Getting_and_Cleaning_Data

##Files in this repo

* README.md - this file
* CodeBook.md - codebook describing variables, the data and transformations
* run_analysis.R -- R script preforming data cleaning

##Description of the DATA

Sourse data is collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##run_analysis.R

Code uses R package "dplyr" - package for data manipulation, written and maintained by Hadley Wickham. It provides some great, easy-to-use functions that are very handy when performing exploratory data analysis and manipulation.

* Step 1 - string manipulation functions is used to create more clear and readable column labels.
* Step 2 - functions bind_cols and bind_rows to merge all training and test data in one dataset.
* Step 3 - Dplyr select function is used to extract only Mean and Standard Deviation (Std) columns.
* Step 4 - Dplyr functions left_join and mutate used to join data to Activity dataset to get ddiscriptive activity names.
* Step 5 - Dplyr group_by and summarise used to build separate dataset containing average of each variable for each activity and each subject.

Resulting dataset has been written itno file AverageData.txt.

