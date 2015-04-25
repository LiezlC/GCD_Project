Code Book:
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

For this assignment a new dataset was created obtaining the average of each variable for each activity and each subject to derive the following variables:


* Subject

Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* Activity

Each row identifies the activity performed. Levels are: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING

* Ave_tBodyAcc.mean...X

Average of time domain Body, Acceleration, Mean X-axial

* Ave_tBodyAcc.mean...Y

Average of time domain Body, Acceleration, Mean Y-axial

* Ave_tBodyAcc.mean...Z

Average of time domain Body, Acceleration, Mean Z-axial

* Ave_tGravityAcc.mean...X

Average of time domain Gravity, Acceleration, Mean X-axial

* Ave_tGravityAcc.mean...Y

Average of time domain Gravity, Acceleration, Mean Y-axial

* Ave_tGravityAcc.mean...Z

Average of time domain Gravity, Acceleration, Mean Z-axial

* Ave_tBodyAccJerk.mean...X

Average of time domain Body, Acceleration, Jerk, Mean X-axial

* Ave_tBodyAccJerk.mean...Y

Average of time domain Body, Acceleration, Jerk, Mean Y-axial

* Ave_tBodyAccJerk.mean...Z

Average of time domain Body, Acceleration, Jerk, Mean Z-axial

* Ave_tBodyGyro.mean...X

Average of time domain Body, Orientation, Mean X-axial

* Ave_tBodyGyro.mean...Y

Average of time domain Body, Orientation, Mean Y-axial

* Ave_tBodyGyro.mean...Z

Average of time domain Body, Orientation, Mean Z-axial

* Ave_tBodyGyroJerk.mean...X

Average of time domain Body, Orientation, Jerk, Mean X-axial

* Ave_tBodyGyroJerk.mean...Y

Average of time domain Body, Orientation, Jerk, Mean Y-axial

* Ave_tBodyGyroJerk.mean...Z

Average of time domain Body, Orientation, Jerk, Mean Z-axial

* Ave_tBodyAccMag.mean..

Average of time domain Body, Acceleration, Magnitude, Mean ..

* Ave_tGravityAccMag.mean..

Average of time domain Gravity, Acceleration, Magnitude, Mean ..

* Ave_tBodyAccJerkMag.mean..

Average of time domain Body, Acceleration, Jerk, Magnitude, Mean ..

* Ave_tBodyGyroMag.mean..

Average of time domain Body, Orientation, Magnitude, Mean ..

* Ave_tBodyGyroJerkMag.mean..

Average of time domain Body, Orientation, Jerk, Magnitude, Mean ..

* Ave_fBodyAcc.mean...X

Average of frequency domain Body, Acceleration, Mean X-axial

* Ave_fBodyAcc.mean...Y

Average of frequency domain Body, Acceleration, Mean Y-axial

* Ave_fBodyAcc.mean...Z

Average of frequency domain Body, Acceleration, Mean Z-axial

* Ave_fBodyAccJerk.mean...X

Average of frequency domain Body, Acceleration, Jerk, Mean X-axial

* Ave_fBodyAccJerk.mean...Y

Average of frequency domain Body, Acceleration, Jerk, Mean Y-axial

* Ave_fBodyAccJerk.mean...Z

Average of frequency domain Body, Acceleration, Jerk, Mean Z-axial

* Ave_fBodyGyro.mean...X

Average of frequency domain Body, Orientation, Mean X-axial

* Ave_fBodyGyro.mean...Y

Average of frequency domain Body, Orientation, Mean Y-axial

* Ave_fBodyGyro.mean...Z

Average of frequency domain Body, Orientation, Mean Z-axial

* Ave_fBodyAccMag.mean..

Average of frequency domain Body, Acceleration, Magnitude, Mean ..

* Ave_fBodyBodyAccJerkMag.mean..

Average of frequency domain Body, BodyAcceleration, Jerk, Magnitude, Mean ..

* Ave_fBodyBodyGyroMag.mean..

Average of frequency domain Body, Body Orientation,  Magnitude, Mean ..

* Ave_fBodyBodyGyroJerkMag.mean..

Average of frequency domain Body, Body Orientation,  Jerk, Magnitude, Mean ..

* Ave_tBodyAcc.std...X

Average of time domain Body, Acceleration, Standard Deviation X-axial

* Ave_tBodyAcc.std...Y

Average of time domain Body, Acceleration, Standard Deviation Y-axial

* Ave_tBodyAcc.std...Z

Average of time domain Body, Acceleration, Standard Deviation Z-axial

* Ave_tGravityAcc.std...X

Average of time domain Gravity, Acceleration, Standard Deviation X-axial

* Ave_tGravityAcc.std...Y

Average of time domain Gravity, Acceleration, Standard Deviation Y-axial

* Ave_tGravityAcc.std...Z

Average of time domain Gravity, Acceleration, Standard Deviation Z-axial

* Ave_tBodyAccJerk.std...X

Average of time domain Body, Acceleration, Jerk, Standard Deviation X-axial

* Ave_tBodyAccJerk.std...Y

Average of time domain Body, Acceleration, Jerk, Standard Deviation Y-axial

* Ave_tBodyAccJerk.std...Z

Average of time domain Body, Acceleration, Jerk, Standard Deviation Z-axial

* Ave_tBodyGyro.std...X

Average of time domain Body, Orientation, Standard Deviation X-axial

* Ave_tBodyGyro.std...Y

Average of time domain Body, Orientation, Standard Deviation Y-axial

* Ave_tBodyGyro.std...Z

Average of time domain Body, Orientation, Standard Deviation Z-axial

* Ave_tBodyGyroJerk.std...X

Average of time domain Body, Orientation, Jerk, Standard Deviation X-axial

* Ave_tBodyGyroJerk.std...Y

Average of time domain Body, Orientation, Jerk, Standard Deviation Y-axial

* Ave_tBodyGyroJerk.std...Z

Average of time domain Body, Orientation, Jerk, Standard Deviation Z-axial

* Ave_tBodyAccMag.std..

Average of time domain Body, Acceleration, Magnitude, Standard Deviation ..

* Ave_tGravityAccMag.std..

Average of time domain Gravity, Acceleration, Magnitude, Standard Deviation ..

* Ave_tBodyAccJerkMag.std..

Average of time domain Body, Acceleration, Jerk, Magnitude, Standard Deviation ..

* Ave_tBodyGyroMag.std..

Average of time domain Body, Orientation, Magnitude, Standard Deviation ..

* Ave_tBodyGyroJerkMag.std..

Average of time domain Body, Orientation, Jerk, Magnitude, Standard Deviation ..

* Ave_fBodyAcc.std...X

Average of frequency domain Body, Acceleration, Standard Deviation X-axial

* Ave_fBodyAcc.std...Y

Average of frequency domain Body, Acceleration, Standard Deviation Y-axial

* Ave_fBodyAcc.std...Z

Average of frequency domain Body, Acceleration, Standard Deviation Z-axial

* Ave_fBodyAccJerk.std...X

Average of frequency domain Body, Acceleration, Jerk, Standard Deviation X-axial

* Ave_fBodyAccJerk.std...Y

Average of frequency domain Body, Acceleration, Jerk, Standard Deviation Y-axial

* Ave_fBodyAccJerk.std...Z

Average of frequency domain Body, Acceleration, Jerk, Standard Deviation Z-axial

* Ave_fBodyGyro.std...X

Average of frequency domain Body, Orientation, Standard Deviation X-axial

* Ave_fBodyGyro.std...Y

Average of frequency domain Body, Orientation, Standard Deviation Y-axial

* Ave_fBodyGyro.std...Z

Average of frequency domain Body, Orientation, Standard Deviation Z-axial

* Ave_fBodyAccMag.std..

Average of frequency domain Body, Acceleration, Magnitude, Standard Deviation ..

* Ave_fBodyBodyAccJerkMag.std..

Average of frequency domain Body, BodyAcceleration, Jerk, Magnitude, Standard Deviation ..

* Ave_fBodyBodyGyroMag.std..

Average of frequency domain Body, Body Orientation,  Magnitude, Standard Deviation ..

* Ave_fBodyBodyGyroJerkMag.std..

Average of frequency domain Body, Body Orientation,  Jerk, Magnitude, Standard Deviation ..

