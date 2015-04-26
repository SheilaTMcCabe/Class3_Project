#Background: 
A full background description of the data set is available at the site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Description of Data: 
The data source includes the following files:
 + features_info.txt - shows information about the variable 'Features'
 + features.txt - list of all 'Features'
 + activity_labels.txt - links the class labels with their 'Activity' name
 + train/X_train.txt - training data, includes values of variable 'Features'
 + test/X_test.txt - test data, includes values of variable 'Features'
 + train/y_train.txt - training labels, includes values of variable 'Activity'
 + test/y_test.txt - test data, includes values of variable 'Activity'

## Initial tasks: Add the packages, libraries, and read in the data 
read in the 'Features' data
+ train/X_train.txt
+ test/X_test.txt
        
read in the 'Activity' data
+ train/y_train.txt
+ test/y_test.txt
        
read in the 'Subject' data
train/subject_train.txt
test/subject_test.txt
        
## Task 1: merge the training and the test sets by combining the data and setting the variable names 
 + combine the 'Features', 'Activity', and 'Subject' data
 + set the variable names
 
## Task 2: extract only the measurements on the mean and standard deviation for each measurement
 + search in the 'Features' data for the mean and standard deviation measurements and subset data
 + use the grep function
        
## Task 3: use descriptive activity names to make the data set more readable
 + read in the data from the "activity labels" file
 + rename the 'Activity' data to make it more descriptive
 + rename Subject to make it more descriptive
       
## Task 4: appropriately label the data set with descriptive variable names
 + use the gsub function

## Task 5: create a second, independent tidy data set with the average of each variable for each activity and each subject
 + use the aggregate and order functions
 + use the write.table function with parameter row.name=FALSE
