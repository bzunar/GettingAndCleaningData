# CODEBOOK.md

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. This description of the data set is based on a more detiled description of the original data set available from: 
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Prefix **'time'** denotes time domain signals captured at a constant rate of 50 Hz. They were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals:
  * timeBodyAcceleration-XYZ and 
  * timeGravityAcceleration-XYZ) 
  
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals:
  * timeBodyAccelerationJerk-XYZ and 
  * timeBodyGyroscopeJerk-XYZ.

The **magnitude** of these three-dimensional signals were calculated using the Euclidean norm:
  * timeBodyAccelerationMagnitude, 
  * timeGravityAccelerationMagnitude, 
  * timeBodyAccelerationJerkMagnitude, 
  * timeBodyGyroscopeMagnitude, 
  * timeBodyGyroscopeJerkMagnitude. 

Finally, a **Fast Fourier Transform (FFT)** was applied to some of these signals producing: 
  * frequencyBodyAcceleration-XYZ, 
  * frequencyBodyAccelerationJerk-XYZ, 
  * frequencyBodyGyroscope-XYZ, 
  * frequencyBodyAccelerationJerkMagnitude, 
  * frequencyBodyGyroscopeMagnitude, 
  * frequencyBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

From these signals were estimated: 
  * mean value (**mean**) and 
  * standard deviation (**std**).

**activity** specifies which activity person performed while wearing a smartphone.

**subject** specifies which person performed the activity.

**Values in each row of the tidy data set 'final' correspond to the average of each variable for each activity and each subject.**

