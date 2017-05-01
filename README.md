# Getting and Cleaning Data Project
- Sourav B

This is the course project for the Getting and Cleaning Data Coursera course.
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

####The end result is written in the file `tidy.txt`.