#Codebook #

This Codebook is split into 5 parts:

- Construction of original dataset, "everest"
- Construction of tidy dataset, "everest\_shrunk"
- Study Design
- Files involved in the R Script, 'run\_analysis.R'
- Variables Involved

This Codebook applies to both the "everest" and "everest_shrunk" datasets generated from the R script, "run\_analysis.R", where "everest\_shrunk is the tidy data set I have decided upon.

"run\_analysis.R" is the R script involved in providing you with the tidy dataset I have in mind.

### Construction of original dataset, "everest"

"everest" contains 564 variables, of 10299 observations. 

Three additional variables are added to the original data; "Volunteers", whom are the participants, "Activity, in code numbers to refer to the specific activity, and "Programme", which I am unsure whether this will have an actual impact on the original users' analysis, so I added in 2 Programmes, test and train.

"everest" is a merged dataset from the observations in 'test/X\_test.txt', of 2947 observations from Volunteers involved in the "Test" programme, and 'train/X\_train.txt',  of 7352 observations from Volunteers involved in the "Train" programme. Together, they form 10299 observations.

### Construction of tidy dataset, "everest\_shrunk"

"everest\_shrunk" contains 69 variables, of 180 observations, a subset of "everest".

This data set will contain readings of only 30 volunteers, of each individual activity.

The reason is that, for example, readings for accelerometers on phone kept changing every milliseconds, and it is pretty hard to get one single reading. You may check your phone on any software that measures accelerometer readings; the readings kept jumping. My guess is that they took a lot of readings per activity to get a better measurement of the readings they want. Hence, I will average the readings per activity. This is also in line with the Assignment objectives.

Hence, this dataset will consider 180 observations, of
6 activities per volunteer.

As per the Assignment objectives, I will strictly only take the "-mean()" and "-std()" subset. There exists "-meanFreq()" in the data, but I take the instruction as not talking about the frequency mean, since it may only talk specifically about mean, and standard deviation. Further subset will only be done upon the user's request. This explains the 66 measurements variables that contributes to the 69 variables in the dataset.

### Study Design 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

### Files involved in the R Script, 'run\_analysis.R'

All files are located in the "UCI HAR Dataset" folder.

- 'features.txt': Descriptions of all measurement variables involved.
- 'activity_labels.txt': 6 Activity names, respective to the 6 Activity Identifiers.
- 'subject_train.txt': Identifiers for Volunteers involved in the Training set
- 'train/X_train.txt': Training set, of 7352 observations.
- 'train/y_train.txt': 6 Activity Identifiers undertaken by Test Volunteers.
- 'subject_test.txt': Identifiers for Volunteers involved in the Test set.
- 'test/X_test.txt': Test set, of 2947 observations.
- 'test/y_test.txt': 6 Activity Identifiers undertaken by Train Volunteers

### Variables Involved

Three Categorical Variables are used

- Volunteers: 30 participants altogether. 70% is involved in the "train" programme. 30% is involved in the "test" programme.
- Programme: 2 categories, "Test" and "Train"
- Activity: 6 activities are involved (all in Capital Letters); WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING

These measurement signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt' in the "UCI HAR Dataset" folder.