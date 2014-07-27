# Overview of Getting and Cleaning Data - Course Project #
____________________

The purpose of this Project is to obtain a tidy data set from a data set. The data is with credit to
*University of California, Irvine*, under the title "Human Activity Recognition Using Smartphones Dataset". The source is as below

**Human Activity Recognition Using Smartphones Dataset <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>**

The downloaded file will contain the "UCI HAR Dataset" folder, of which the summary details will be provided under "Overview of UCI HAR Dataset".

### Contents of This Folder

This folder contains the following files

- Codebook
- run_analysis.R

The Codebook describes the variables involved in the data analysis.

The R script file generates two arranged data sets; "everest" and "everest_shrunk". "UCI HAR Dataset" is automatically downloaded from the Internet when you run this script, so you do not have to get it from the source.

Refer to the Codebook for further information on datasets "everest" and "everest\_shrunk".

### Overview of UCI HAR Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.