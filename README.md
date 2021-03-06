# GettingAndCleaningData
Getting and Cleaning Data Course Project: Peer Graded Assignment from Week 4

In addition to 'README.md' file, this repository contains:

* tidy data set (.txt file),
* 'run_analysis.R' (R script) which transforms raw data collected from the Samsung Galaxy S smartphone accelerometers to the tidy data set, and
* 'codebook.md' (Markdown file) which describes variables contained in the data set.

The raw data have been recorded in a study in which 30 volunteers performed six activities (walking, walking upstrains, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. A more detiled description of the data set is available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The tidy data set contains the average of each variable for each activity and each subject.

The run_analysis.R script transforms the raw data set into a tidy data set through the following steps:
* it downloads the original data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip),
* reads into R files containing:
  * training and test sets,
  * sets' labels,
  * variable names, and
  * files that connect activities to individual subjects,
* appends to the training and test sets the activity and subject data,
* merges appended training and test sets into a new data set ('merged'),
* extracts the measurements on the mean and standard deviation for each measurement into a new data set ('mean_std'),
* revises 'mean_std' to use descriptive activity and descriptive variable names, and
* creates independent tidy data set with the average of each variable for each activity and each subject ('final').

Script 'run_analysis.R' requires 'dplyr' and 'reshape2' packages which are freely available from 'The Comprehensive R Archive Network (CRAN)' (https://cran.r-project.org/). 


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
