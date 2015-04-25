# Clear memory to ensure no previous operations influence running of scripts:
rm(list=ls())

# Set working directory:
setwd('C:/Users/user/Documents/Courses/Current/Getting&CleaningData/WD')

# Read Files from "./UCI_HAR/" subdirectory into R as a list containing separate data frames for each file:
datafiles<-c("./UCI_HAR/X_test.txt","./UCI_HAR/X_train.txt","./UCI_HAR/y_test.txt","./UCI_HAR/y_train.txt","./UCI_HAR/activity_labels.txt","./UCI_HAR/subject_test.txt","./UCI_HAR/subject_train.txt","./UCI_HAR/features.txt")
data<-lapply(datafiles, read.table)

# Assign names to files, excluding prefix "./UCI_HAR/" to simplify subsequent operations:
names(data)<-sub("./UCI_HAR/","",datafiles)

# Create separate data frames for each file:
labels<-data$activity_labels
ytest<-data$y_test
features<-data$features
ytrain<-data$y_train
Xtrain<-data$X_train
Xtest<-data$X_test
stest<-data$subject_test
strain<-data$subject_train

# Substitute values in test (y_test) and train (y_train) labels files with descriptions from activity_labels file, using lookup function from qdap package:
library(qdap)
testlab<-data.frame(lookup(data$y_test, labels))
trainlab<-data.frame(lookup(data$y_train, labels))

# Add data from subject_test and subject_train, as well as substituted labels (testlab & trainlab) to train (X_train) and test (X_test) data using cbind:
traind<-cbind(strain,trainlab,Xtrain)
testd<-cbind(stest,testlab,Xtest)

# Rename columns for train and test data using descriptions provided in features file:
var<-features$V2
names(traind)=names(testd)=c("Subject","Activity",as.character(var))

# Combine train and test data using rbind:
data1<-data.frame(rbind(traind,testd))

# Extract measurements on the mean and standard deviation for each measurement (excluding those for meanFreq by using a regex word boundary (\\..\\b) for mean): 
subdf <- subset(data1, select= grepl("Subject",names(data1)))
actdf <- subset(data1, select= grepl("Activity",names(data1)))
meandf <- subset(data1, select= grepl("\\mean\\b",names(data1)))
stddf <- subset(data1, select= grepl(".std.",names(data1)))
pd<-data.frame(cbind(subdf,actdf,meandf,stddf))

#  Creates a tidy data set with the average of each variable for each activity and each subject using melt function from reshape2 package:
require(reshape2)
pd_melt <- melt(pd, id = c("Subject", "Activity"))
avepd<-dcast(pd_melt, Subject + Activity ~ variable, mean)
#names(avepd)

# Rename variables/ columns for new dataset to indicate the 'average' data contained in the molten data frame:
names(avepd[3:68])<-paste("Ave",names(avepd[3:68]),sep = "_")
names(avepd)<-c(names(avepd[1]),names(avepd[2]),paste("Ave",names(avepd[3:68]),sep = "_"))

# Create text file of new dataset for submission:
write.table(avepd,"tidy_avs.txt",row.name=FALSE)

# Include extract from features file to describe variables used for original dataset for code book:
IntroText<-"Code Book:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals and used for this project are: 
mean(): Mean value
std(): Standard deviation

For this assignment a new dataset was created obtaining the average of each variable for each activity and each subject to derive the following variables:"

# Describe new variables used in new dataset for code book:
listOnames <- c(names(avepd))
description <- listOnames
description <- gsub("Subject", "Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.", description)
description <- gsub("Activity","Each row identifies the activity performed. Levels are: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING", description)
description <- gsub("Ave_", "Average of ", description)
description <- gsub("Ave_", "Average of ", description)
description <- gsub("tBody", "time domain Body, ", description)
description <- gsub("fBody", "frequency domain Body, ", description)
description <- gsub("tGravity", "time domain Gravity, ", description)
description <- gsub("fGravity", "frequency domain Gravity, ", description)
description <- gsub("Acc", "Acceleration, ", description)
description <- gsub("Gyro", "Orientation, ", description)
description <- gsub("BodyAccelleration,", "Body Accelleration, ", description)
description <- gsub("BodyOrientation,", "Body Orientation, ", description)
description <- gsub("Mag", "Magnitude, ", description)
description <- gsub("Jerk", "Jerk, ", description)
description <- gsub(".mean", "Mean ", description)
description <- gsub(".std", "Standard Deviation ", description)
description <- gsub("...X", "X-axial", description)
description <- gsub("\\...Y\\b", "Y-axial", description)
description <- gsub("...Z", "Z-axial", description)
outputStrings <- paste("* ", listOnames, "\n\n", description,"\n", sep="")
outputStrings1<-c(IntroText, "\n",outputStrings)

# Create .md file containing code book, including introductory text extracted from original data descriptions, as well as description of new variables:
write.table(outputStrings1, "CodeBook.md", quote=FALSE, row.names = FALSE, col.names=FALSE)

# Document steps taken for README, and write to .md file:
readme<-"
The steps followed in completing this assignment were as follows:
1. Download and unzip data from link provided (Note this step was not performed using R code as problems were experienced with download and unzip)
2. Place all .txt files in 'UCI_HAR' subditectory within working directory
3. Clear memory to ensure no previous operations influence running of scripts
4. Set working directory
5. Read Files from ./UCI_HAR/ subdirectory into R as a list containing separate data frames for each file
6. Assign names to files, excluding prefix ./UCI_HAR/ to simplify subsequent operations
7. Create separate data frames for each file
8. Substitute values in test (y_test) and train (y_train) labels files with descriptions from activity_labels file, using lookup function from qdap package
9. Add data from subject_test and subject_train, as well as substituted labels (testlab & trainlab) to train (X_train) and test (X_test) data using cbind
10. Rename columns for train and test data using descriptions provided in features file
11. Combine train and test data using rbind
12. Extract measurements on the mean and standard deviation for each measurement (excluding those for meanFreq by using a regex word boundary (\\..\\b) for mean)
13. Creates a tidy data set with the average of each variable for each activity and each subject using melt function from reshape2 package
14. Rename variables/ columns for new dataset to indicate the 'average' data contained in the molten data frame
15. Create text file of new dataset for submission
16. Include extract from features file to describe variables used for original dataset for code book
17. Describe new variables used in new dataset for code book
18. Create .md file containing code book, including introductory text extracted from original data descriptions, as well as description of new variables
19. Document steps taken for README, and write to .md file"

write.table(readme, "README.md", quote=FALSE, row.names = FALSE, col.names=FALSE)
