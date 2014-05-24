## Data Source
==================================================================

Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

-------------------------------------------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

--------------------------------------------------------------------

## Getting and Cleaning Data

The input datasets had normalised summary values like mean, std, min, max for each measurement for each activity and subject varying from [-1,1]. The mesurements with mean and standard deviation for test and training data have been identified and a clean data set with average of all those measurements for each activity and each subject has been created. The clean data has column names which are descriptive and explanantion of the same is given under the section Data Dictionary.The final data set has 180 observations of 68 variables.


Kindly refer README.md in this repo for details <https://github.com/shivananth/CourseProject/blob/master/README.md>


--------------------------------------------------------------------


## Data Dictionary
 
1. activityName - Tells the activity measured (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
2. subjectIndex - An identifier to know the subject whose activty was measured
3. averagetimeDomainBodyAccelerometerXAxisMean - Average of the mean value of the X axis measurement of the acclerometer in time domain pertaining to body of subject
4. averagetimeDomainBodyAccelerometerXAxisStandardDeviation - Average of the standard deviation value of the X axis measurement of the accelerometer in time domain pertaining to body of subject 
5. averagetimeDomainGravityAccelerometerXAxisMean - Average of the mean value of the X axis measurement of the acclerometer in time domain pertaining to earth
6. averagetimeDomainGravityAccelerometerXAxisStandardDeviation - Average of the standard deviation value of the X axis measurement of the accelerometer in time domain pertaining to earth 
7. averagetimeDomainBodyLinearAccelerationXaxisMean - Average of the mean value of the X axis linear acceleration in time domain of the subject's body
8. averagetimeDomainBodyLinearAccelerationXaxisStandardDeviation - Average of the standard deviation value of X axis linear acceleration in time domain of the subject's body
9. averagetimeDomainBodyGyroscopeXaxisMean - Average of the mean value of X axis measurement of the gyroscope in time domain pertaining to the subject's body
10. averagetimeDomainBodyGyroscopeXaxisStandardDeviation - Average of the standard deviation value of X axis measurement of the gyroscope in time domain pertaining to the subject's body
11. averagetimeDomainBodyAngularVelocityXaxisMean - Average of the mean value of X axis angular velocity in time domain of the subject's body
12. averagetimeDomainBodyAngularVelocityXaxisStandardDeviation - Average of the standard deviation value of X axis angular velocity in time domain of the subject's body
13. averagetimeDomainBodyAccelerometerMagnitudeMean - Average of the mean of magnitude of accelerometer reading in time domain pertaining to subject's body
14. averagetimeDomainBodyAccelerometerMagnitudeStandardDeviation - Average of the standard deviation of magnitude of accelerometer reading in time domain pertaining to subject's body
15. averagetimeDomainGravityAccelerometerMagnitudeMean - Average of the mean of magnitude of accelerometer reading in time domain pertaining to earth
16. averagetimeDomainGravityAccelerometerMagnitudeStandardDeviation - Average of the standard deviation of magnitude of accelerometer reading in time domain pertaining to earth
17. averagetimeDomainBodyLinearAccelerationMagnitudeMean - Average of the mean of magnitude of linear acceleration in time domain of subject's body
18. averagetimeDomainBodyLinearAccelerationMagnitudeStandardDeviation - Average of the standard deviation of magnitude of linear acceleration in time domain of subject's body
19. averagetimeDomainBodyGyroscopeMagnitudeMean - Average of the mean of magnitude of gyroscope reading in time domain pertaining to subject's body
20. averagetimeDomainBodyGyroscopeMagnitudeStandardDeviation - Average of the standard deviation of magnitude of gyroscope reading in time domain pertaining to subject's body
21. averagetimeDomainBodyAngularVelocityMagnitudeMean - Average of the mean of magnitude of angualr velocity in time domain of subject's body
22. averagetimeDomainBodyAngularVelocityMagnitudeStandardDeviation - Average of the standard deviation of magnitude of ngular velocity in time domain of subject's body


##### Replications of measurements:

1. All the variables from 3,4,7 to 12 are also measured for Y and Z axes. Their names differ in the axis measured-(XAxis/YAxis/ZAxis)
2. All the variables from 13,14,17 to 22 are also measured on the frequency domain. Their names differ in the domain name-(timeDomain/frequencyDomain)
3. All the variables from 3,4,7 to 10 and their Y/Z axes replica are measured on the frequency domain as well. Their names differ in domain name and axis measured

22 Variables listed above with 16 from replica 1, 8 from replica 2 and 12 from replica 3 comprise of 68 variables in the final dataset.
