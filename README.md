# Getting and Cleaning Data Course Project
##### by Steve Myles, February 2015

### Assignment:
> You should create one R script called [run_analysis.R](https://github.com/scumdogsteev/datasciencecoursera/blob/master/getting-and-cleaning-data/run_analysis.R) that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Files:

1. README.md (this file)
2. [run_analysis.R](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/run_analysis.R) (the R script that does the merging and transformations)
3. [CodeBook.md](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/CodeBook.md) (describes the variables, the data, the transformations, and the work that is performed to clean up the data)

### Script ([run_analysis.R](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/run_analysis.R))

#### Assumptions

1. The Samsung data is available in the working directory and/or the user is connected to the Internet.  The script checks:
  1. If an unzipped folder named "UCI HAR Dataset" with the directory structure underneath that left intact from the original zip file (e.g., there are subdirectories called "test" and "train" in "UCI HAR Dataset") is available.  If so, the script continues.
  2. If the "UCI HAR Dataset" folder is not available, the script checks whether the original zip file is available.  If so, it is unzipped and the script continues.
  3. If the original zip file is not available, the script downloads the file from the Internet, unzips it, and continues the script.
2. The user has either previously installed the [plyr](http://cran.r-project.org/web/packages/plyr/index.html),  [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html), and [reshape2](http://cran.r-project.org/web/packages/reshape2/index.html) packages or is connected to the Internet so the script can install them.

#### Process

[run_analysis.R](https://github.com/scumdogsteev/getting-and-cleaning-data/blob/master/run_analysis.R) goes through the following process to meet the requirements.  Please see the script for details about how each step is performed.

1.  Check whether the UCI HAR Dataset is available in the working directory.  If not, the script checks for the zip file, unzips it, and continues.  If that is also unavailable, the script downloads the zip file, unzips it, and continues.
2. **Merge the training and the test sets to create one data set (requirement #1)**
  1. Load the "plyr," "dplyr," and "reshape2" packages as they are necessary for the data manipulation that follows.  If they have not been previously installed, the script installs them.
  2. Read the "Activity Labels" and "Features" data into data frames, labeling the columns and changing the Feature data to character type.
  3. Read the separate parts of the training data set (training activities, "y_train.txt;" training data, "X_train.txt;" and training subject, "subject_train.txt") and combine them into a single data frame using cbind.
  4. Read the separate parts of the test data set (test activities, "y_test.txt;" test data, "X_test.txt;" and test subject, "subject_test.txt") and combine them into a single data frame using cbind.
  5. Merge the training and test data sets into a single data frame using rbind.
  6. Add activity labels from the "Activity Labels" data frame (**Uses descriptive activity names to name the activities in the data set (requirement #3)**)
  7. Name the columns based on the "Features" data (**Appropriately labels the data set with descriptive variable names (requirement #4)**)
3. **Extract only the measurements on the mean and standard deviation for each measurement (requirement #2)**
  1. Subset the merged data frame to the columns representing mean and standard deviation
  2. I have chosen to do this by searching for all variable names containing the strings "Mean," "mean," and "std."
4. **Create a second, independent tidy data set with the average of each variable for each activity and each subject (requirement #5)**
  1. Make all column names legal for R by removing all parentheses and dashes.
  2. Change variable names to Camel Case (i.e., capitalize "Mean" and "Std" regardless of where in the column name they appear) to increase readability.
  3. Change the "Subject" column to a factor for easier manipulation.
  4. Sort the merged data frame by "Subject" and "Activity"
  5. Calculate the average (mean) of each numeric column and return a data frame ("merged_summary" in the script) with the average for each subject/activity combination.
  6. As instructed, write this data frame to a text file called "samsung_summary.txt" using "row.names = FALSE."

### References

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. [Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
2. David Hood.  [David's Course Project FAQ](https://class.coursera.org/getdata-011/forum/thread?thread_id=69).  Getting and Cleaning Data Discussion Forum.  Coursera.  Feb 2015.
3. Davod Hood.  [Response to "Final Step"](https://class.coursera.org/getdata-011/forum/thread?thread_id=169#post-807).  Response on Getting and Cleaning Data Discussion Forum.  Coursera.  Feb 2015.
4. Simon Hanlon. [Response to "Elegant way to check for missing packages and install them?"](http://stackoverflow.com/a/19870272). Stack Overflow. Nov 2013.
5. Sean C. Anderson. [An Introduction to reshape2](http://seananderson.ca/2013/10/19/reshape.html).  Blog post on http://seananderson.ca/. Oct 2013.
