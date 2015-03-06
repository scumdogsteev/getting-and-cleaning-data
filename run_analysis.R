## ***************************************************************************
## Getting and Cleaning Data Course Project
## February 2015
## by Steve Myles
##
## GitHub repo:  https://github.com/scumdogsteev/getting-and-cleaning-data
## README:  {repo URL}/blob/master/README.md
## CodeBook:  {repo URL}/blob/master/CodeBook.md
##
## This script (run_analysis.R) produces a wide-form tidy data set by merging 
## the "train" and "test" sets of Samsung data and returning only the
## measurements of mean and standard deviation.  Comments below describe the
## steps.  Comments in ALL CAPS and surrounded by asterisks are the processing
## steps and those in lowercase represent the detail required to complete the
## major steps.
##
## Please also see the accompanying README and CodeBook in the GitHub repo
## above for further detail.
## ***************************************************************************

## ***************************************************************************
## CHECK WHETHER THE UCI HAR DATASET IS AVAILABLE AND DOWNLOAD/UNZIP IT IF
## NOT
## ***************************************************************************

## check if the data directory exists in the working directory
if (!file.exists("./UCI HAR Dataset")) {
     ## if not, check whether the zip file exists in the working directory
     if (!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")) {
          ## if not, try to download it
          download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
          "getdata-projectfiles-UCI HAR Dataset.zip", mode="wb")
     }
     ## unzip the file if the directory doesn't already exist
     unzip("getdata-projectfiles-UCI HAR Dataset.zip")     
     ## if the directory exists and/or if the zip file is downloaded/unzipped
     ## or a previously downloaded version of the zip file is unzipped,
     ## proceed with execution of the script
     } else {

## ***************************************************************************
## TRY TO LOAD THE "plyr," "dplyr," AND "reshape2" PACKAGES IF THEY ARE
## INSTALLED.  IF THEY ARE NOT INSTALLED, INSTALL THEM.
## ***************************************************************************

     ## "pkgInst" is a function that checks whether a set of packages are 
     ## installed and, if not, it installs them
     pkgInst <- function(x) {
     for(i in x) {
          ## "require" returns TRUE invisibly if it was able to load package
          if(!require(i, character.only = TRUE) ){
               ##  If package was not able to be loaded then install it
               install.packages(i, dependencies = TRUE)
               ##  Load package after installing
               require(i, character.only = TRUE)
               }
          }
     }

     ##  run pkgInst for the "plyr," "dplyr," and "reshape2" packages
     pkgInst(c("plyr", "dplyr", "reshape2"))

## ***************************************************************************
## READ THE ACTIVITY LABELS AND FEATURES DATA INTO DATA FRAMES AND LABEL
## THEM CORRECTLY, CHANGING THE FEATURE COLUMN TO CHARACTER TYPE.
## ***************************************************************************

     ## read "activity_labels.txt" into a data frame and change its column 
     ## names to "ActKey" and "Activity"
     activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
     names(activity_labels) <- c("ActKey", "Activity")

     ## read "features.txt" and change its column names to "FeatureKey"
     ## and "Feature"
     features <- read.table("./UCI HAR Dataset/features.txt")
     names(features) <- c("FeatureKey", "Feature")

     ## convert the "Feature" column of the features data frame
     ## (features$Feature) to character
     features$Feature <- as.character(features$Feature)

## ***************************************************************************
## READ THE PARTS OF THE TRAINING DATA SET AND COMBINE THEM INTO A SINGLE
## DATA FRAME
## ***************************************************************************

     ## read the training activities file (y_train.txt) and name the column 
     ## "ActKey"
     train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt",
                                    sep="")
     names(train_activities) <- "ActKey"

     ## read the training data (X_train.txt) and the training subject data
     ## (subject_train.txt) and name the subject column "Subject"
     train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
     subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                                 sep = "")
     names(subject_train) <- "Subject"

     ## merge the three parts of the training data set (subject, activity, 
     ## data) into a new data frame named "train" using cbind
     train <- cbind(subject_train, train_activities, train_data)

## ***************************************************************************
## READ THE PARTS OF THE TEST DATA SET AND COMBINE THEM INTO A SINGLE
## DATA FRAME
## ***************************************************************************

     ## read the test activities file (y_test.txt) and name the column
     ## "ActKey"
     test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt",
                                   sep="")
     names(test_activities) <- "ActKey"

     ## read the test data (X_test.txt) and the test subject data
     ## (subject_test.txt) and name the subject column "Subject"
     test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
     subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                                sep = "")
     names(subject_test) <- "Subject"     

     ## merge the three parts of the test data set (subject, activity, data)
     ## into a new data frame named "test" using cbind
     test <- cbind(subject_test, test_activities, test_data)

## ***************************************************************************
## MERGE THE TRAINING AND TEST DATA SETS, ADD THE ACTIVITY LABELS, AND NAME
## THE COLUMNS BASED ON FEATURE
## ***************************************************************************

     ## merge the "train" and "test" data frames using rbind
     merged <- rbind(train, test)

     ## add the activity labels by performing a left join (using the 
     ## "left_join" function from the dplyr package)
     merged <- left_join(activity_labels, merged, by = "ActKey")

     ## change the names of the columns in the "data" data frame to "ActKey," 
     ## "Activity," and "Subject" for the first three columns and the values 
     ## in the "Feature" column of the features data frame for the remaining 
     ## columns
     names(merged) <- c(names(activity_labels), "Subject", features$Feature)

## ***************************************************************************
## SUBSET THE MERGED DATA FRAME TO THE COLUMNS REPRESENTING MEAN AND STANDARD
## DEVIATION
## ***************************************************************************

     ## subset the merged data frame to only the relevant columns ("Subject," 
     ## "Activity," and any of the remaining columns with "Mean," "mean," or 
     ## "std" in their name
     merged <- merged[,grepl("Activity|Subject|[Mm]ean|std",names(merged))]

## ***************************************************************************
## MAKE ALL COLUMN NAMES LEGAL FOR R, CHANGE THE SUBJECT COLUMN TO A FACTOR,
## AND SORT THE MERGED DATA FRAME
## ***************************************************************************

     ## remove the parentheses, dashes, and commas  from the column names to 
     ## make them legal for R by substituting a blank ("") for all instances
     ## of "(", ")", and "-" (using escape characters for the parentheses). 
     ## "\\(|\\)|-," is a regular expression meaning "open parentheses OR
     ## close parentheses OR dash OR comma."  
     names(merged) <- gsub("\\(|\\)|-|,", "", names(merged))
     ## replace all lowercase instances of "mean" and "std" with "Mean" and
     ## "Std" to create Camel Case variable names to increase readability.
     names(merged) <- gsub("mean", "Mean", names(merged))
     names(merged) <- gsub("std", "Std", names(merged))
     ## rename the misnamed variables from the original data set by changing
     ## "BodyBody" to "Body"
     names(merged) <- gsub("BodyBody", "Body", names(merged))

     ## convert the "Subject" column to factor (rather than numeric)
     merged$Subject <- as.factor(merged$Subject)

     ## sort the merged data frame by Subject then Activity using the
     ## "arrange" function from the plyr package
     merged <- arrange(merged, Subject, Activity)

## ***************************************************************************
## CALCULATE THE MEAN FOR EACH MEASUREMENT VARIABLE AND ADD TO A NEW, TIDY
## DATA FRAME
## ***************************************************************************

     ## using the "melt" function from the reshape2 package, melt the merged
     ## data frame to create a long-form version of the data set
     merged_melt <- melt(merged, id.vars=c("Subject","Activity"),
                    variable.name = "Measurement", value.name = "Value")

     ## create a summary data frame with the average (mean) of each variable
     ## for each Subject/Activity combination using the dcast function from
     ## the "reshape2" package.  this is a wide-form tidy data frame.
     merged_summary <- dcast(merged_melt, Subject + Activity~Measurement,
                             mean, value.var = "Value")

## ***************************************************************************
## WRITE THE SUMMARY DATA FRAME TO A TEXT FILE PER THE ASSIGNMENT
## ***************************************************************************

     ## write the merged_summary data frame to a text file in the working
     ## directory called "samsung_summary.txt" using the argument 
     ## (row.names = FALSE) from the assignment
     write.table(merged_summary, "samsung_summary.txt", row.names = FALSE)

## close the "else" from the start of the script
}
