Raw Data to Tidy Data Tranformation
===================================
- Sourav B.

## Origin of Raw Data

Raw data are obtained from UCI Machine Learning repository. This project is based on
the *Human Activity Recognition Using Smartphones Data Set*.
The data set was built from experiments carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six activities
(walking, walking upstairs, walking downstairs, sitting, standing, laying)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity
were captured at a constant rate of 50Hz. The experiments have been video-recorded
to label the data manually.

The obtained data set has been randomly partitioned into two sets, where 70% of
the volunteers was selected for generating the training data and 30% the test data.

### Raw Data Extraction

The 3-axial time domain signals from accelerometer and gyroscope
were captured at a constant rate of 50 Hz. Then they were filtered to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals using another filter.
Subsequently, the body linear acceleration and angular velocity were derived in time
to obtain Jerk signals. Also the magnitude of these
three-dimensional signals were calculated. 
Finally a Fast Fourier Transform (FFT) was applied to some of these
time domain signals to obtain frequency domain signals.

The signals were sampled in fixed-width sliding windows of 2.56 sec and 50% 
overlap (128 readings/window at 50 Hz).
From each window, a vector of features was obtained by calculating variables
from the time and frequency domain.
No unit of measures is reported as all features were normalized and bounded
within [-1,1].

## Data Processing

The raw data sets are processed with run_analisys.R script to create a tidy dataset.

### Merging training and test sets

Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt,
subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain
a single data set. Variables are labelled with the names assigned by original
collectors (features.txt).

### Extracting mean and standard deviation variables

From the merged data set is extracted and intermediate data set with only the
values of estimated mean (variables with labels that contain "mean") and standard
deviation (variables with labels that contain "std").

### Using descriptive activity names

A new column is added to intermediate data set with the activity description.
Activity id column is used to look up descriptions in activity_labels.txt.

### Labelling variables appropriately

Labels given from the original collectors were changed so that:
- valid R variable names is obtained without parentheses, dashes and commas
- more descriptive labels are present (e.g. Acceleration in place of Acc)

### Creating a tidy data set

From the intermediate data set is created a final tidy data set where numeric
variables are averaged for each activity and each subject.

The tidy data set contains 180 observations for each 68 variables divided in:

*  an activity label (__Activity__): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
*  an identifier of the subject who carried out the experiment (__Subject__):
   1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
*  a 79-feature vector with time and frequency domain signal variables (numeric)

The following table contains the names of all time and frequency domain variables:

Time domain                                 | Frequency domain
------------------------------------------- | ------------------------------------------------
TimeDomain.BodyAcceleration.Mean.X|FrequencyDomain.BodyAcceleration.Mean.X|
TimeDomain.BodyAcceleration.Mean.Y|FrequencyDomain.BodyAcceleration.Mean.Y|
TimeDomain.BodyAcceleration.Mean.Z|FrequencyDomain.BodyAcceleration.Mean.Z|
TimeDomain.BodyAcceleration.StandardDeviation.X|FrequencyDomain.BodyAcceleration.StandardDeviation.X|
TimeDomain.BodyAcceleration.StandardDeviation.Y|FrequencyDomain.BodyAcceleration.StandardDeviation.Y|
TimeDomain.BodyAcceleration.StandardDeviation.Z|FrequencyDomain.BodyAcceleration.StandardDeviation.Z|
TimeDomain.GravityAcceleration.Mean.X|FrequencyDomain.BodyAccelerationJerk.Mean.X|
TimeDomain.GravityAcceleration.Mean.Y|FrequencyDomain.BodyAccelerationJerk.Mean.Y|
TimeDomain.GravityAcceleration.Mean.Z|FrequencyDomain.BodyAccelerationJerk.Mean.Z|
TimeDomain.GravityAcceleration.StandardDeviation.X|FrequencyDomain.BodyAccelerationJerk.StandardDeviation.X|
TimeDomain.GravityAcceleration.StandardDeviation.Y|FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Y|
TimeDomain.GravityAcceleration.StandardDeviation.Z|FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Z|
TimeDomain.BodyAccelerationJerk.Mean.X|FrequencyDomain.BodyAngularSpeed.Mean.X|
TimeDomain.BodyAccelerationJerk.Mean.Y|FrequencyDomain.BodyAngularSpeed.Mean.Y|
TimeDomain.BodyAccelerationJerk.Mean.Z|FrequencyDomain.BodyAngularSpeed.Mean.Z|
TimeDomain.BodyAccelerationJerk.StandardDeviation.X|FrequencyDomain.BodyAngularSpeed.StandardDeviation.X|
TimeDomain.BodyAccelerationJerk.StandardDeviation.Y|FrequencyDomain.BodyAngularSpeed.StandardDeviation.Y|
TimeDomain.BodyAccelerationJerk.StandardDeviation.Z|FrequencyDomain.BodyAngularSpeed.StandardDeviation.Z|
TimeDomain.BodyAngularSpeed.Mean.X|FrequencyDomain.BodyAccelerationMagnitude.Mean|
TimeDomain.BodyAngularSpeed.Mean.Y|FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation|
TimeDomain.BodyAngularSpeed.Mean.Z|FrequencyDomain.BodyAccelerationJerkMagnitude.Mean|
TimeDomain.BodyAngularSpeed.StandardDeviation.X|FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation|
TimeDomain.BodyAngularSpeed.StandardDeviation.Y|FrequencyDomain.BodyAngularSpeedMagnitude.Mean|
TimeDomain.BodyAngularSpeed.StandardDeviation.Z|FrequencyDomain.BodyAngularSpeedMagnitude.StandardDeviation|
TimeDomain.BodyAngularAcceleration.Mean.X|FrequencyDomain.BodyAngularAccelerationMagnitude.Mean|
TimeDomain.BodyAngularAcceleration.Mean.Y|FrequencyDomain.BodyAngularAccelerationMagnitude.StandardDeviation|
TimeDomain.BodyAngularAcceleration.Mean.Z|
TimeDomain.BodyAngularAcceleration.StandardDeviation.X|
TimeDomain.BodyAngularAcceleration.StandardDeviation.Y|
TimeDomain.BodyAngularAcceleration.StandardDeviation.Z|
TimeDomain.BodyAccelerationMagnitude.Mean|
TimeDomain.BodyAccelerationMagnitude.StandardDeviation|
TimeDomain.GravityAccelerationMagnitude.Mean|
TimeDomain.GravityAccelerationMagnitude.StandardDeviation|
TimeDomain.BodyAccelerationJerkMagnitude.Mean|
TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation|
TimeDomain.BodyAngularSpeedMagnitude.Mean|
TimeDomain.BodyAngularSpeedMagnitude.StandardDeviation|
TimeDomain.BodyAngularAccelerationMagnitude.Mean|
TimeDomain.BodyAngularAccelerationMagnitude.StandardDeviation|


For variables derived from mean and standard deviation estimation, the previous labels
are augmented with the terms "Mean" or "StandardDeviation".

### The data set is written to the file "tidy.txt"
