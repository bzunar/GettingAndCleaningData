# GettingAndCleaningData
Getting and Cleaning Data Course Project: Peer Graded Assignment from Week 4

This repository contains:

* tidy data set (.txt file),
* run_analysis.R (R script) which transforms raw data collected from the Samsung Galaxy S smartphone accelerometers to the tidy data set, and
* Codebook.md (Markdown file) which describes variables contained in the data set.

The raw data have been recorded in a study in which 30 volunteers performed six activities (walking, walking upstrains, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. A more detiled description of the data set is available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The tidy data set contains the average of each variable for each activity and each subject.

The run_analysis.R script transforms the raw data set into a tidy data set by executing the following steps:
* it downloads the original data set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the working directory,
* it reads into R:
  * training and test sets,
  * sets' labels,
  * variable names,
  * files that connect activities to individual subjects.
* it appends activity and subject data to the training and test sets
* it merges appended training and test sets into a new data set ('merged')
* it extracts into a new data set ('mean_std') only the measurements on the mean and standard deviation for each measurement
* it revises 'mean_std' to use descriptive activity and descriptive variable names
* it creates independent tidy data set ('final') with the average of each variable for each activity and each subject.

Script 'run_analysis.R' requires 'dplyr' and 'reshape2' packages which are freely available from 'The Comprehensive R Archive Network (CRAN)' (https://cran.r-project.org/). 
