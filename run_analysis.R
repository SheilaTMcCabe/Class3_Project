## Getting and Cleaning Data: Class 3 Project

## This Class Project creates an R script that does the following tasks:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.


## Initial tasks: Add the packages, libraries, and read in the data 

        ##add the packages, libraries (load plyr first then dplyr)
        install.packages("plyr") 
        library(plyr)
        install.packages("dplyr")
        library(dplyr)
        install.packages("data.table")
        library(data.table)

        ##read in the 'Features' data 
        FeaturesTrainData<-read.table("train/X_train.txt") ##properties should include 7352 obs. of 561 variables
        FeaturesTestData<-read.table("test/X_test.txt") ##properties should include 2947 obs. of 561 variables
        
        ##read in the 'Activity' data
        ActivityTrainData<-read.table("train/y_train.txt") ##properties should include 7352 obs. of 1 variable
        ActivityTestData<-read.table("test/y_test.txt") ##properties should include 2947 obs. of 1 variable
        
        ##read in the 'Subject' data
        SubjectTrainData<-read.table("train/subject_train.txt") ##properties should include 7352 obs. of 1 variable
        SubjectTestData<-read.table("test/subject_test.txt") ##properties should include 2947 obs. of 1 variable
        
## Task 1: merge the training and the test sets
        
    ##combine the data
        ##'Features' data
        MergedFeaturesData<-rbind(FeaturesTrainData, FeaturesTestData) ##properties should include 10299 obs. of 561 variables
        
        ##'Activity' data
        MergedActivityData<-rbind(ActivityTrainData, ActivityTestData) ##properties should include 10299 obs. of 1 variable
        
        ##'Subject' data
        MergedSubjectData<-rbind(SubjectTrainData, SubjectTestData) ##properties should include 10299 obs. of 1 variable

    ##set the variable names
        ##'Features' data; read in the variable names from the "features" file to later decipher the mean and std dev measurements
        FeatureNames<-read.table("features.txt", stringsAsFactors=FALSE) ##properties should include 561 obs. of 2 variables
        colnames(MergedFeaturesData)<-FeatureNames$V2
        
        ##'Activity' data
        colnames(MergedActivityData)<-c("Activity")

        ##'Subject' data
        colnames(MergedSubjectData)<-c("Subject")
        
    ##merge the data
        ##first combine the columns of 'Subject' and 'Activity'
        MergeTemp<-cbind(MergedSubjectData, MergedActivityData) ##properties should include 10299 obs. of 2 variables
        
        ##second combine the columns of the 'Features'
        AllMergedData<-cbind(MergedFeaturesData, MergeTemp) ##properties should include 10299 obs. of 563 variables
        
## Task 2: extract only the measurements on the mean and standard deviation for each measurement
        
        ##search in the 'Features' data for the mean and standard deviation measurements
        TempFeatureNames<-FeatureNames$V2[grep("mean|std", FeatureNames$V2)]
        
        ##extract the data
        SubsetNames<-c(as.character(TempFeatureNames), "Subject", "Activity")
        NewAllMergedData<-subset(AllMergedData,select=SubsetNames)
        
## Task 3: use descriptive activity names to make the data set more readable
        
        ##read in the data from the "activity labels" file
        ActivityLabels<-read.table("activity_labels.txt", stringsAsFactors=FALSE)
        
        ##rename the column names
        colnames(ActivityLabels)<-c("Activity_ID", "Activity_Name")
        
        ##rename Activity to make it more descriptive
        NewAllMergedData$Activity<-as.character(NewAllMergedData$Activity)
        NewAllMergedData$Activity[NewAllMergedData$Activity==1]<-"Walking"
        NewAllMergedData$Activity[NewAllMergedData$Activity==2]<-"Walking_Upstairs"
        NewAllMergedData$Activity[NewAllMergedData$Activity==3]<-"Walking_Downstairs"
        NewAllMergedData$Activity[NewAllMergedData$Activity==4]<-"Sitting"
        NewAllMergedData$Activity[NewAllMergedData$Activity==5]<-"Standing"
        NewAllMergedData$Activity[NewAllMergedData$Activity==6]<-"Laying"
        
        ##Note: you can also use this factor function to rename but it does not include all the merged data
        NewAllMergedData2<-factor(NewAllMergedData$Activity,
                                  levels=c(1,2,3,4,5,6), 
                                  labels=c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

        ##rename Subject to make it more descriptive
        NewAllMergedData$Subject<-as.character(NewAllMergedData$Subject)
        NewAllMergedData$Subject[NewAllMergedData$Subject==1]<-"Subject 1"
        NewAllMergedData$Subject[NewAllMergedData$Subject==2]<-"Subject 2"
        NewAllMergedData$Subject[NewAllMergedData$Subject==3]<-"Subject 3"
        NewAllMergedData$Subject[NewAllMergedData$Subject==4]<-"Subject 4"
        NewAllMergedData$Subject[NewAllMergedData$Subject==5]<-"Subject 5"
        NewAllMergedData$Subject[NewAllMergedData$Subject==6]<-"Subject 6"
        NewAllMergedData$Subject[NewAllMergedData$Subject==7]<-"Subject 7"
        NewAllMergedData$Subject[NewAllMergedData$Subject==8]<-"Subject 8"
        NewAllMergedData$Subject[NewAllMergedData$Subject==9]<-"Subject 9"
        NewAllMergedData$Subject[NewAllMergedData$Subject==10]<-"Subject 10"
        NewAllMergedData$Subject[NewAllMergedData$Subject==11]<-"Subject 11"
        NewAllMergedData$Subject[NewAllMergedData$Subject==12]<-"Subject 12"
        NewAllMergedData$Subject[NewAllMergedData$Subject==13]<-"Subject 13"
        NewAllMergedData$Subject[NewAllMergedData$Subject==14]<-"Subject 14"
        NewAllMergedData$Subject[NewAllMergedData$Subject==15]<-"Subject 15"
        NewAllMergedData$Subject[NewAllMergedData$Subject==16]<-"Subject 16"
        NewAllMergedData$Subject[NewAllMergedData$Subject==17]<-"Subject 17"
        NewAllMergedData$Subject[NewAllMergedData$Subject==18]<-"Subject 18"
        NewAllMergedData$Subject[NewAllMergedData$Subject==19]<-"Subject 19"
        NewAllMergedData$Subject[NewAllMergedData$Subject==20]<-"Subject 20"
        NewAllMergedData$Subject[NewAllMergedData$Subject==21]<-"Subject 21"
        NewAllMergedData$Subject[NewAllMergedData$Subject==22]<-"Subject 22"
        NewAllMergedData$Subject[NewAllMergedData$Subject==23]<-"Subject 23"
        NewAllMergedData$Subject[NewAllMergedData$Subject==24]<-"Subject 24"
        NewAllMergedData$Subject[NewAllMergedData$Subject==25]<-"Subject 25"
        NewAllMergedData$Subject[NewAllMergedData$Subject==26]<-"Subject 26"
        NewAllMergedData$Subject[NewAllMergedData$Subject==27]<-"Subject 27"
        NewAllMergedData$Subject[NewAllMergedData$Subject==28]<-"Subject 28"
        NewAllMergedData$Subject[NewAllMergedData$Subject==29]<-"Subject 29"
        NewAllMergedData$Subject[NewAllMergedData$Subject==30]<-"Subject 30"
        
## Task 4: appropriately label the data set with descriptive variable names
        colnames(NewAllMergedData)<-gsub("^t", "time", colnames(NewAllMergedData))
        colnames(NewAllMergedData)<-gsub("^f", "frequency", colnames(NewAllMergedData))
        colnames(NewAllMergedData)<-gsub("Acc", "Accelerometer", colnames(NewAllMergedData))
        colnames(NewAllMergedData)<-gsub("Gyro", "Gyroscope", colnames(NewAllMergedData))
        colnames(NewAllMergedData)<-gsub("Mag", "Magnitude", colnames(NewAllMergedData))
        colnames(NewAllMergedData)<-gsub("BodyBody", "Body", colnames(NewAllMergedData))
   
## Task 5: create a second, independent tidy data set with the average of each variable
## for each activity and each subject
        SecondDataSet<-aggregate(.~Activity + Subject, NewAllMergedData,mean)
        SecondDataSet<-SecondDataSet[order(SecondDataSet$Activity,SecondDataSet$Subject),]
        write.table(SecondDataSet,file="Tidy_Data_Set.txt", row.name=FALSE)
