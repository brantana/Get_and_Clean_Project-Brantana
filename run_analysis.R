library(curl)
#Download data file to local drive.
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "downloaded.zip",method = "curl")
#Extract (unzip) data file.
unzip("downloaded.zip")

#(- PROJECT REQUIREMENT 1 - Merges the training and the test sets to create one data set.)
#PEPARE LOCAL DATA FILES
#List Data Directory Paths
        datasset_overall_00<-"UCI HAR Dataset"
        datasset_train_00<-"UCI HAR Dataset/train"
        datasset_test_00<-"UCI HAR Dataset/test"
        dataset_train_inertial_00<-"UCI HAR Dataset/train/Inertial Signals"
        dataset_test_inertial_00<-"UCI HAR Dataset/test/Inertial Signals"
#List the files to be included.
        #Overall
        activity_labels_01<-"activity_labels.txt"
        features_01<-"features.txt"
        #Train
        subject_train_01<-"subject_train.txt"
        X_train_01<-"X_train.txt"
        y_train_01<-"y_train.txt"
        #Internal Signals (train)
        #-Reserve-
        #Test
        subject_test_01<-"subject_test.txt"
        X_test_01<-"X_test.txt"
        y_test_01<-"y_test.txt"
        #Internal Signals (test)                
        #-Reserve-
#Convert datafiles to Dataframes
        #Overall
        activity_labels<-read.table(file.path(".",datasset_overall_00,activity_labels_01))
        features<-read.table(file.path(".",datasset_overall_00,features_01))
        #Train
        subject_train<-read.table(file.path(".",datasset_train_00,subject_train_01))
        X_train<-read.table(file.path(".",datasset_train_00, X_train_01))
        y_train<-read.table(file.path(".",datasset_train_00,y_train_01))
        #Internal Signals (train)
        #-Reserve-
        #Test
        subject_test<-read.table(file.path(".",datasset_test_00,subject_test_01))
        X_test<-read.table(file.path(".",datasset_test_00, X_test_01))
        y_test<-read.table(file.path(".",datasset_test_00,y_test_01))

#CONSTRUCT TIDY DATASET (Merges the training and the test sets to create one data set.)
        features<-features$V2#Remove redundant column from features.
        features<-as.character(features)
#Merge Train Data
        set<-rep("train",7352) #Add "train" identifier
        train<-cbind(subject_train,set,y_train,X_train)
#Merge Test Data
        set<-rep("test",2947) #Add "test" identifier
        test<-cbind(subject_test,set,y_test,X_test)
#Merge Test & Train Data
        dat<-rbind(train,test)
#(- PROJECT REQUIREMENT 4 - Appropriately labels the data set with descriptive variable names.)
#Provide Descriptively Named Headers
        names(dat)[1] <- "testsubject"
        names(dat)[3] <- "activity"
        for(i in 1:561){names(dat)[i+3]<-features[i]}#Replace Column #'s with descriptions from features.
#(- PROJECT REQUIREMENT 3 - Uses descriptive activity names to name the activities in the data set.)
#Provide Descriptively Named Activities 
        tmp<-as.character(1:10299)
        for(i in 1:10299){tmp[i]<-as.character(activity_labels[activity_labels[,1]==dat[i,3],2])}
        dat[,3]<-tmp[]

#(- PROJECT REQUIREMENT 2 - Extracts only the measurements on the mean and standard deviation for each measurement.)
#EXTRACT MEAN & STD DEV (Extracts only the measurements on the mean and standard deviation for each measurement.)
#*****This first dataset is called Set_1*****
          Set_1<-dat[1:3]
          for(i in 4:564){
                string<-names(dat[i])
                pattern<-"mean\\()|std\\()"#Include only columns with "mean()" or "std()".  Exclude for example,"meanFreq()". 
                tmp<-grepl(pattern,string)
                if(tmp){Set_1<-cbind(Set_1,dat[i])}
          }
          n<-ncol(Set_1)#Gives number of columns remaining in Set_1, which was produced from Dat_1.

#(- PROJECT REQUIREMENT 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.)
#PRODUCE A SECOND SET OF DATA WITH AVERAGES FOR ALL FEATURES.
#*****This second dataset is called Set_2
          m<- n-3
          Set_2<-Set_1[1:3]
          for(i in 4:m){
                  string<-names(Set_1[i])
                  pattern<-"mean\\()"#Include only columns with "mean()". 
                  tmp<-grepl(pattern,string)
                  if(tmp){Set_2<-cbind(Set_2,Set_1[i])}
          }         
          
#~~~~~~~~~~~~~~#
#~~~THE END ~~~#
#~~~~~~~~~~~~~~#
write.table(Set_1,file="Set_1.txt",row.name=FALSE)
write.table(Set_2,file="Set_2.txt",row.name=FALSE)