library(dplyr)


# Read all data
features <- read.table("UCIDataset/features.txt",header = FALSE)
activities <- read.table("UCIDataset/activity_labels.txt",header = FALSE)

test_data <- read.table("UCIDataset/test/X_test.txt",header = FALSE)
test_activity <- read.table("UCIDataset/test/Y_test.txt",header = FALSE)
test_subject <- read.table("UCIDataset/test/subject_test.txt",header = FALSE)

train_data <- read.table("UCIDataset/train/X_train.txt",header = FALSE)
train_activity <- read.table("UCIDataset/train/Y_train.txt",header = FALSE)
train_subject <- read.table("UCIDataset/train/subject_train.txt",header = FALSE)  


# 1. Question 4: Appropriately labels the data set with descriptive variable names.
## Rename columns
names(test_data) <- sub("__", "_", sub("___", "_", gsub("[()-]","_", features$V2)))
names(train_data) <- sub("__", "_", sub("___", "_", gsub("[()-]","_", features$V2)))

# Rename colomuns in in Activity / Subject data frames
names(test_activity) <- "Activity"
names(test_subject) <- "Subject"

names(train_activity) <- "Activity"
names(train_subject) <- "Subject"


# 2. Question 1: Merges the training and the test sets to create one data set.
## Build test set
test_data <- bind_cols(test_activity, test_subject, test_data)

## Build train set
train_data <- bind_cols(train_activity, train_subject, train_data)

## Merge sets 
all_data <- bind_rows(test_data, train_data)


# 3. Question 2: Extracts only the measurements on the mean and standard deviation for each measurement.
all_data <- all_data %>% 
            select(Activity, Subject, matches("mean|std", ignore.case = FALSE))


# 4. Question 3: Uses descriptive activity names to name the activities in the data set
all_data <- all_data %>% 
            left_join(activities, by = c("Activity" = "V1")) %>% 
            mutate(Activity = V2) %>% 
            select(-V2)


# 5. QUestion 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average_data <- all_data %>% 
            group_by(Subject, Activity) %>% 
            summarise_all(mean)


## Write result file
write.table(average_data, "AverageData.txt", row.name=FALSE)
