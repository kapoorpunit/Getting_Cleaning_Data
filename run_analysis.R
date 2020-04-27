# Assignment for Getting and Cleaning Data Course Project
# by Punit Kapoor

# Reading all the data files
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

# Step 1 : Merging the training and the test sets to create one data set
dataSet <- rbind(X_train,X_test)

# Step 2 : Extracting only the measurements on the mean and standard deviation for each measurement
Mean_SD_Only <- grep("mean()|std()", features[, 2]) 
dataSet <- dataSet[,Mean_SD_Only]

# Step 4 : Appropriately labeling the data set with descriptive activity names.
# Getting rid of ()
DescActivityNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})

# Applying to the dataSet to rename labels
names(dataSet) <- DescActivityNames[Mean_SD_Only]

# Combining test and train of subject data and activity data and giving descriptive lables
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'

# Now combining subject, activity, and mean and std only data set to create final data se
dataSet <- cbind(subject,activity, dataSet)

# Step 3 : Using descriptive activity names to name the activities in the data set
# grouping the activity columns
act_group <- factor(dataSet$activity)

# re-naming levels
levels(act_group) <- activity_labels[,2]

#applying it to dataSet
dataSet$activity <- act_group

# Step 5 : From the data set in step 4, creating a second, independent tidy data set 
# with the average of each variable for each activity and each subject

# setting the reshape2 package library
library("reshape2")

# melting data to tall skinny data and cast means
baseData <- melt(dataSet,(id.vars=c("subject","activity")))
secondDataSet <- dcast(baseData, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean of]" , names(secondDataSet)[-c(1:2)] )

#Finally writing the tidy data to the working directory as "tidy_data.txt"
write.table(secondDataSet, "tidy_data.txt", sep = ",")
