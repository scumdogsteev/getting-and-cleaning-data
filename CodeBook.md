#Getting and Cleaning Data Course Project CodeBook

### Data Processing

* The data in "samsung_summary.txt" summarizes the measurements of the "Human
Activity Recognition Using Smartphones Dataset."  Please see "README.txt"
accompanying that dataset's distribution for details regarding the
collection of the data and see this repo's [README](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/README.md) for [references](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/README.md#references) including
the original data set.
* The data was read into R using a script ([run_analysis.R](https://github.com/scumdogsteev/gettingandcleaningdata/blob/master/run_analysis.R))
which transformed the raw data into a wideform, tidy summary data set.
  * The following transformations were perfomed on the original data:
    1. The training and test data sets were merged into a single data frame (named "merged").
	2. The measurements of mean and standard deviation (i.e., those variables
	with the strings "mean" and "std" were extracted.
	3. Variable names were changed to be legal for R (i.e., parentheses, 
	dashes, and commas were removed).
	4. The mean of each variable for each combination of Activity and Subject
	was calculated resulting in 180 observations for each variable
	5. The resulting data set (a data frame named "merged_summary") was
	exported to a text file (samsung_summary.txt) and uploaded to Coursera
	per the assignment
  * For more detail as to how these transformations were performed, please 
  see [README](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/README.md) and [run_analysis.R](https://github.com/scumdogsteev/gettingandcleaningdata/blob/master/run_analysis.R).

### Samsung Activity Summary Data

#### Variable Description

The original data contains many variables that are not part of the summary
data set.  The following description of the variables is based on
"features_info.txt" which accompanies the original data distribution (the
only changes to the below relate to the naming of the variables in the 
summary data set (i.e., the aforementioned removal of the parentheses,
commas, and dashes in the variable names):

> The features selected for this database come from the accelerometer and
> gyroscope 3axial raw signals tAccXYZ and tGyroXYZ. These time domain
> signals (prefix 't' to denote time) were captured at a constant rate of
> 50 Hz. Then they were filtered using a median filter and a 3rd order low
> pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
> Similarly, the acceleration signal was then separated into body and
> gravity acceleration signals (tBodyAccXYZ and tGravityAccXYZ) using
> another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were
> derived in time to obtain Jerk signals (tBodyAccJerkXYZ and 
> tBodyGyroJerkXYZ). Also the magnitude of these threedimensional 
> signals were calculated using the Euclidean norm (tBodyAccMag, 
> tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals
> producing fBodyAccXYZ, fBodyAccJerkXYZ, fBodyGyroXYZ, fBodyAccJerkMag,
> fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
> signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> 'XYZ' is used to denote 3axial signals in the X, Y and Z directions.

#### Variables

Note that "XYZ" indicates that there is a version of the variable for each
axis (X, Y, and Z).

* tBodyAccXYZ
* tGravityAccXYZ
* tBodyAccJerkXYZ
* tBodyGyroXYZ
* tBodyGyroJerkXYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccXYZ
* fBodyAccJerkXYZ
* fBodyGyroXYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The mean (represented in the variable names as "Mean") and standard deviation
(represented in the variable names as "Std") was calculated for each
variable.  These are the majority of the variables selected for the summary.

Additionally, "angle" (the angle between two vectors) was calculated in the
original data.

> Additional vectors [were] obtained by averaging the signals in a signal
> window sample. These are used on the angle variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

#### Variable Detail

| Variable Name                     | Variable Number | Description        | Variable Type | Variable Width | Values                                                                   |
|-----------------------------------|:---------------:|:------------------:|:-------------:|:--------------:|:-------------------------------------------------------------------------|
| Subject                           |               1 | Subject ID         | Factor        |              2 | 1..30                                                                    |
| Activity                          |               2 | Activity performed | Factor        |             18 | LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS |
| tBodyAccMeanX                     |               3 | see above          | Numeric       |             10 | 0.2216..0.3015                                                           |
| tBodyAccMeanY                     |               4 | see above          | Numeric       |             10 | 0.0405..0.0013                                                         |
| tBodyAccMeanZ                     |               5 | see above          | Numeric       |             10 | 0.1525..0.0754                                                         |
| tBodyAccStdX                      |               6 | see above          | Numeric       |             10 | 0.9961..0.6269                                                          |
| tBodyAccStdY                      |               7 | see above          | Numeric       |             10 | 0.9902..0.6169                                                          |
| tBodyAccStdZ                      |               8 | see above          | Numeric       |             10 | 0.9877..0.6090                                                          |
| tGravityAccMeanX                  |               9 | see above          | Numeric       |             10 | 0.6800..0.9745                                                          |
| tGravityAccMeanY                  |              10 | see above          | Numeric       |             10 | 0.4799..0.9566                                                          |
| tGravityAccMeanZ                  |              11 | see above          | Numeric       |             10 | 0.4951..0.9579                                                          |
| tGravityAccStdX                   |              12 | see above          | Numeric       |             10 | 0.9968..0.8296                                                         |
| tGravityAccStdY                   |              13 | see above          | Numeric       |             10 | 0.9942..0.6436                                                         |
| tGravityAccStdZ                   |              14 | see above          | Numeric       |             10 | 0.9910..0.6102                                                         |
| tBodyAccJerkMeanX                 |              15 | see above          | Numeric       |             10 | 0.0427..0.1302                                                           |
| tBodyAccJerkMeanY                 |              16 | see above          | Numeric       |             10 | 0.0387..0.0568                                                          |
| tBodyAccJerkMeanZ                 |              17 | see above          | Numeric       |             10 | 0.0675..0.0381                                                          |
| tBodyAccJerkStdX                  |              18 | see above          | Numeric       |             10 | 0.9946..0.5443                                                          |
| tBodyAccJerkStdY                  |              19 | see above          | Numeric       |             10 | 0.9895..0.3553                                                          |
| tBodyAccJerkStdZ                  |              20 | see above          | Numeric       |             10 | 0.9933..0.0310                                                          |
| tBodyGyroMeanX                    |              21 | see above          | Numeric       |             10 | 0.2059..0.1927                                                          |
| tBodyGyroMeanY                    |              22 | see above          | Numeric       |             10 | 0.2042..0.0275                                                          |
| tBodyGyroMeanZ                    |              23 | see above          | Numeric       |             10 | 0.0725..0.1791                                                          |
| tBodyGyroStdX                     |              24 | see above          | Numeric       |             10 | 0.9943..0.2677                                                          |
| tBodyGyroStdY                     |              25 | see above          | Numeric       |             10 | 0.9942..0.4765                                                          |
| tBodyGyroStdZ                     |              26 | see above          | Numeric       |             10 | 0.9855..0.5649                                                          |
| tBodyGyroJerkMeanX                |              27 | see above          | Numeric       |             10 | 0.1572..0.0221                                                         |
| tBodyGyroJerkMeanY                |              28 | see above          | Numeric       |             10 | 0.0768..0.0132                                                         |
| tBodyGyroJerkMeanZ                |              29 | see above          | Numeric       |             10 | 0.0925..0.0069                                                         |
| tBodyGyroJerkStdX                 |              30 | see above          | Numeric       |             10 | 0.9965..0.1791                                                          |
| tBodyGyroJerkStdY                 |              31 | see above          | Numeric       |             10 | 0.9971..0.2959                                                          |
| tBodyGyroJerkStdZ                 |              32 | see above          | Numeric       |             10 | 0.9954..0.1932                                                          |
| tBodyAccMagMean                   |              33 | see above          | Numeric       |             10 | 0.9865..0.6446                                                          |
| tBodyAccMagStd                    |              34 | see above          | Numeric       |             10 | 0.9865..0.4284                                                          |
| tGravityAccMagMean                |              35 | see above          | Numeric       |             10 | 0.9865..0.6446                                                          |
| tGravityAccMagStd                 |              36 | see above          | Numeric       |             10 | 0.9865..0.4284                                                          |
| tBodyAccJerkMagMean               |              37 | see above          | Numeric       |             10 | 0.9928..0.4345                                                          |
| tBodyAccJerkMagStd                |              38 | see above          | Numeric       |             10 | 0.9946..0.4506                                                          |
| tBodyGyroMagMean                  |              39 | see above          | Numeric       |             10 | 0.9807..0.4180                                                          |
| tBodyGyroMagStd                   |              40 | see above          | Numeric       |             10 | 0.9814..0.3000                                                          |
| tBodyGyroJerkMagMean              |              41 | see above          | Numeric       |             10 | 0.9973..0.0876                                                          |
| tBodyGyroJerkMagStd               |              42 | see above          | Numeric       |             10 | 0.9977..0.2502                                                          |
| fBodyAccMeanX                     |              43 | see above          | Numeric       |             10 | 0.9952..0.5370                                                          |
| fBodyAccMeanY                     |              44 | see above          | Numeric       |             10 | 0.9890..0.5242                                                          |
| fBodyAccMeanZ                     |              45 | see above          | Numeric       |             10 | 0.9895..0.2807                                                          |
| fBodyAccStdX                      |              46 | see above          | Numeric       |             10 | 0.9966..0.6585                                                          |
| fBodyAccStdY                      |              47 | see above          | Numeric       |             10 | 0.9907..0.5602                                                          |
| fBodyAccStdZ                      |              48 | see above          | Numeric       |             10 | 0.9872..0.6871                                                          |
| fBodyAccMeanFreqX                 |              49 | see above          | Numeric       |             10 | 0.6359..0.1591                                                          |
| fBodyAccMeanFreqY                 |              50 | see above          | Numeric       |             10 | 0.3795..0.4665                                                          |
| fBodyAccMeanFreqZ                 |              51 | see above          | Numeric       |             10 | 0.5201..0.4025                                                          |
| fBodyAccJerkMeanX                 |              52 | see above          | Numeric       |             10 | 0.9946..0.4743                                                          |
| fBodyAccJerkMeanY                 |              53 | see above          | Numeric       |             10 | 0.9894..0.2767                                                          |
| fBodyAccJerkMeanZ                 |              54 | see above          | Numeric       |             10 | 0.9920..0.1578                                                          |
| fBodyAccJerkStdX                  |              55 | see above          | Numeric       |             10 | 0.9951..0.4768                                                          |
| fBodyAccJerkStdY                  |              56 | see above          | Numeric       |             10 | 0.9905..0.3498                                                          |
| fBodyAccJerkStdZ                  |              57 | see above          | Numeric       |             10 | 0.9931.0.0062                                                          |
| fBodyAccJerkMeanFreqX             |              58 | see above          | Numeric       |             10 | 0.5760..0.3315                                                          |
| fBodyAccJerkMeanFreqY             |              59 | see above          | Numeric       |             10 | 0.6020..0.1957                                                          |
| fBodyAccJerkMeanFreqZ             |              60 | see above          | Numeric       |             10 | 0.6276..0.2301                                                          |
| fBodyGyroMeanX                    |              61 | see above          | Numeric       |             10 | 0.9931..0.4750                                                          |
| fBodyGyroMeanY                    |              62 | see above          | Numeric       |             10 | 0.9940..0.3288                                                          |
| fBodyGyroMeanZ                    |              63 | see above          | Numeric       |             10 | 0.9860..0.4924                                                          |
| fBodyGyroStdX                     |              64 | see above          | Numeric       |             10 | 0.9947..0.1966                                                          |
| fBodyGyroStdY                     |              65 | see above          | Numeric       |             10 | 0.9944..0.6462                                                          |
| fBodyGyroStdZ                     |              66 | see above          | Numeric       |             10 | 0.9867..0.5225                                                          |
| fBodyGyroMeanFreqX                |              67 | see above          | Numeric       |             10 | 0.3958..0.2492                                                          |
| fBodyGyroMeanFreqY                |              68 | see above          | Numeric       |             10 | 0.6668..0.2731                                                          |
| fBodyGyroMeanFreqZ                |              69 | see above          | Numeric       |             10 | 0.5075..0.3771                                                          |
| fBodyAccMagMean                   |              70 | see above          | Numeric       |             10 | 0.9868..0.5866                                                          |
| fBodyAccMagStd                    |              71 | see above          | Numeric       |             10 | 0.9876..0.1787                                                          |
| fBodyAccMagMeanFreq               |              72 | see above          | Numeric       |             10 | 0.3123..0.4359                                                          |
| fBodyAccJerkMagMean               |              73 | see above          | Numeric       |             10 | 0.9940..0.5384                                                          |
| fBodyAccJerkMagStd                |              74 | see above          | Numeric       |             10 | 0.9944..0.3163                                                          |
| fBodyAccJerkMagMeanFreq           |              75 | see above          | Numeric       |             10 | 0.1252..0.4881                                                          |
| fBodyGyroMagMean                  |              76 | see above          | Numeric       |             10 | 0.9865..0.2040                                                          |
| fBodyGyroMagStd                   |              77 | see above          | Numeric       |             10 | 0.9815..0.2367                                                          |
| fBodyGyroMagMeanFreq              |              78 | see above          | Numeric       |             10 | 0.4566..0.4095                                                          |
| fBodyGyroJerkMagMean              |              79 | see above          | Numeric       |             10 | 0.9976..0.1466                                                          |
| fBodyGyroJerkMagStd               |              80 | see above          | Numeric       |             10 | 0.9976..0.2878                                                          |
| fBodyGyroJerkMagMeanFreq          |              81 | see above          | Numeric       |             10 | 0.1829..0.4263                                                          |
| angletBodyAccMeangravity          |              82 | see above          | Numeric       |             10 | 0.1630..0.1292                                                          |
| angletBodyAccJerkMeangravityMean  |              83 | see above          | Numeric       |             10 | 0.1206..0.2033                                                          |
| angletBodyGyroMeangravityMean     |              84 | see above          | Numeric       |             10 | 0.3893..0.4441                                                          |
| angletBodyGyroJerkMeangravityMean |              85 | see above          | Numeric       |             10 | 0.2237..0.1824                                                          |
| angleXgravityMean                 |              86 | see above          | Numeric       |             10 | 0.9471..0.7378                                                          |
| angleYgravityMean                 |              87 | see above          | Numeric       |             10 | 0.8746..0.4248                                                          |
| angleZgravityMean                 |              88 | see above          | Numeric       |             10 | 0.8736..0.3904                                                          |
