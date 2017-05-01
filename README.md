# Getting and Cleaning Data Project
- Sourav B

This repository is for the submission of the course project for the Coursera Getting and Cleaning Data course.

### Overview
This project demonstrates the gathering and cleaning data to make a tidy dataset that can be used for subsequent
analysis. Full description of the data used in this project is present at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data for this project can be found[ here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data analysis
The data is obtained and unzipped to get the data source files. Modifications to obtain tidy data from raw data is scripted in run_analysis.R file.

### Project Summary
The R script, `run_analysis.R`, does the following:

```sh
1. Downloads the datapack if it does not already exist in the working directory
2. Loads the activity and feature data
3. Loads both the training and testing data for subject, activity and features
4. Subsets only those columns which has reflect a mean or standard deviation data
5. Merges the subject, activity and features datasets
6. Converts the `activity` column elements to descriptive names
7. Changes the variable names of the dataset to descriptive names
8. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.
```

#### The end result is written in the file `tidy.txt`.
