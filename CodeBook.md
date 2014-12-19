 
#Code Book for sensor_data_aggregated.txt 
----------------------------------------------------------------

## File Format
 - File format: Text data, columns separated by space
 - Header row: Included
 - Total data rows: 180
 - Total columns: 68

## Source Data 
 The dataset is based on the data collected and provided through the Human 
 Activity Recognition Using Smartphones project ...
 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
 The actual dataset and documentation that was analyzed is here...
 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
 Please see the text files distributed with this project to see the complete
 description of the experiments, the raw data collected, the calculated features
 and the units for both the raw data and the features. All this information is 
 included in the source_docs folder...
 - README.txt 
 - features.txt 
 - features_info.txt 

## Data Processing  
This document describes how the source data was transformed and the structure of the final dataset. 
  
 The data available through the project was processed using the following steps ...
<br>1. The information related to subjects, activities and feature measurements that was provided in separate text files was joined together to form one dataset for test and one dataset for train data
<br>2. Train and test data were appended together to form a single dataset
<br>3. Out of the 561 features provided with the data, only the 66 that represent a mean or a standard deviation were retained 
<br>4. The activity id was replaced by activity description provided with the project (activity_labels.txt )
<br>5. Columns were labeled based on the provided information (features.txt)
<br>6. The data was aggregated on the activity and subject_id level. The data includes 6 different activity data for 30 different subjects, which gives a total of 180 rows in the aggregated dataset. All the included feature variables were averaged within each of the groups.
	 
## Included Variable Reference
----------------------------
``` 
[1] activity_desc - text description of the activity. 
  - Possible values are 
	  "WALKING", 
	  "WALKING_UPSTAIRS"
	  "WALKING_DOWNSTAIRS"
	  "SITTING"
	  "STANDING"
	  "LAYING"

[2] subject_id - Sequential ID number of the subject of the experiment. 
                 Values are integers between 1 and 30

[3] tBodyAcc.mean.X  - mean of the provided feature variable. 
                     Please see the Feature Selection section below 
					 for description of all features as provided with the source data.
[4] tBodyAcc.mean.Y  -- || --
[5] tBodyAcc.mean.Z  -- || -- 
[6] tBodyAcc.std.X   -- || --
[7] tBodyAcc.std.Y   ...
[8] tBodyAcc.std.Z   ... 
[9] tGravityAcc.mean.X   ... 
[10] tGravityAcc.mean.Y
[11] tGravityAcc.mean.Z
[12] tGravityAcc.std.X
[13] tGravityAcc.std.Y
[14] tGravityAcc.std.Z
[15] tBodyAccJerk.mean.X
[16] tBodyAccJerk.mean.Y
[17] tBodyAccJerk.mean.Z
[18] tBodyAccJerk.std.X
[19] tBodyAccJerk.std.Y
[20] tBodyAccJerk.std.Z
[21] tBodyGyro.mean.X
[22] tBodyGyro.mean.Y
[23] tBodyGyro.mean.Z
[24] tBodyGyro.std.X
[25] tBodyGyro.std.Y
[26] tBodyGyro.std.Z
[27] tBodyGyroJerk.mean.X
[28] tBodyGyroJerk.mean.Y
[29] tBodyGyroJerk.mean.Z
[30] tBodyGyroJerk.std.X
[31] tBodyGyroJerk.std.Y
[32] tBodyGyroJerk.std.Z
[33] tBodyAccMag.mean
[34] tBodyAccMag.std
[35] tGravityAccMag.mean
[36] tGravityAccMag.std
[37] tBodyAccJerkMag.mean
[38] tBodyAccJerkMag.std
[39] tBodyGyroMag.mean
[40] tBodyGyroMag.std
[41] tBodyGyroJerkMag.mean
[42] tBodyGyroJerkMag.std
[43] fBodyAcc.mean.X
[44] fBodyAcc.mean.Y
[45] fBodyAcc.mean.Z
[46] fBodyAcc.std.X
[47] fBodyAcc.std.Y
[48] fBodyAcc.std.Z
[49] fBodyAccJerk.mean.X
[50] fBodyAccJerk.mean.Y
[51] fBodyAccJerk.mean.Z
[52] fBodyAccJerk.std.X
[53] fBodyAccJerk.std.Y
[54] fBodyAccJerk.std.Z
[55] fBodyGyro.mean.X
[56] fBodyGyro.mean.Y
[57] fBodyGyro.mean.Z
[58] fBodyGyro.std.X
[59] fBodyGyro.std.Y
[60] fBodyGyro.std.Z
[61] fBodyAccMag.mean
[62] fBodyAccMag.std
[63] fBodyBodyAccJerkMag.mean
[64] fBodyBodyAccJerkMag.std
[65] fBodyBodyGyroMag.mean
[66] fBodyBodyGyroMag.std
[67] fBodyBodyGyroJerkMag.mean
[68] fBodyBodyGyroJerkMag.std
```

##Feature Selection 
----------------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
```
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
```
The set of variables that were estimated from these signals are: 

 - mean(): Mean value
 - std(): Standard deviation
