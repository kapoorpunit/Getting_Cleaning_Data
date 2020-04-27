Code Book by Punit Kapoor

Step #0 : Reading all the data files

* subject_test : subject IDs for test

* subject_train : subject IDs for train

* X_test : values of variables in test

* X_train : values of variables in train

* y_test : activity ID in test

* y_train : activity ID in train

* activity_labels : Description of activity IDs in y_test and y_train

* features : description(label) of each variables in X_test and X_train

Step #1 : Merging the training and the test sets to create one data set

* dataSet : bind of X_train and X_test

Step #2 : Extracting only the measurements on the mean and standard deviation for each measurement - mean() and std()
* Mean_SD_Only: a vector of only mean and std labels extracted from 2nd column of features
* dataSet : at the end of this step, dataSet will only contain mean and std variables

Step #3 : Appropriately labeling the data set with descriptive activity names

Creating a vector of "clean" feature names by getting rid of "()" at the end. Then applying that to the dataSet to rename column labels.

* DescActivityNames: a vector of "clean" feature names
* subject : bind of subject_train and subject_test
* activity : bind of y_train and y_test

Step #4 : Using descriptive activity names to name the activities in the data set

Grouping the activity column of dataSet as "act_group", then rename each levels with 2nd column of activity_levels. Finally applying the renamed "act_group" to dataSet's activity column.

* act_group : factored activity column of dataSet

Step #5 : From the data set in step 4, creating a second, independent tidy data set

Melted to dataset to create tidy data. It will also add [mean of] to each column labels for better description. Finally outputing the data as "tidy_data.txt"

* baseData : melted tall and skinny dataSet
* secondDataSet : create baseData which has means of each variables
