################################## run_analysis.R ##########################################
## This set of code creates a tidy dataset from the data obtained from UCI Machine 		    ##
## Learing website containing accelerometer and gyroscope reading of Samsung Galaxy smart ##
## phone when 30 people under observation have been wearing it on their waist while in    ##
## different conditions (Walking, sleeping etc.). The output dataset gets written in a    ##
## text file named "tidy.txt".                                                            ##
############################################################################################

## setting to be downloaded and downloaded file name and path
filename <- "ucidataset.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## storing working and downloaded data directory
workdir <- getwd()
datadir <- "UCI HAR Dataset"

## downloading the zip file if it is not already downloaded
if(!file.exists(filename)){
	download.file(fileurl, destfile = filename)
}

## unzipping the downloaded zip file if already not done so
if(!dir.exists(datadir)){
	unzip(filename)
}

## reading in testing and training activity data
activityTest <- read.table(file.path(workdir, datadir, "test", "y_test.txt"), header = FALSE)
activityTrain <- read.table(file.path(workdir, datadir,"train", "y_train.txt"), header = FALSE)
dataActivity <- rbind(activityTest, activityTrain)	## merging testing and training data
rm(activityTest, activityTrain)	## keeping only merged data for memory efficiency

## reading in testing and training subject data
subjectTest <- read.table(file.path(workdir, datadir, "test", "subject_test.txt"), header = FALSE)
subjectTrain <- read.table(file.path(workdir, datadir,"train", "subject_train.txt"), header = FALSE)
dataSubject <- rbind(subjectTest, subjectTrain)	## merging testing and training data
rm(subjectTest, subjectTrain)	## keeping only merged data for memory efficiency

## reading in testing and training features data
featureTest <- read.table(file.path(workdir, datadir, "test", "X_test.txt"), header = FALSE)
featureTrain <- read.table(file.path(workdir, datadir,"train", "X_train.txt"), header = FALSE)
dataFeature <- rbind(featureTest, featureTrain)	## merging testing and training data
rm(featureTest, featureTrain)	## keeping only merged data for memory efficiency

## putting names on single column merged subject and activity data
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
## reading in feature names from features.txt file
dataFeaturesNames <- read.table(file.path(workdir, datadir, "features.txt"), header = FALSE)
## naming features data columns according to 2nd column of table read from features.txt 
names(dataFeature)<- dataFeaturesNames$V2 

#################################### 1. Merge Data #########################################
dataCombine <- cbind(dataSubject, dataActivity)
rm(dataSubject, dataActivity)
## merge activity, subject and features data in single dataset
Data <- cbind(dataFeature, dataCombine) 
rm(dataFeature, dataCombine) ## keeping only merged data for memory efficiency

############# 2. Subsetting only Mean and Standard Deviation measurements ##################
## obtaining the column names that has mean() or std()
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
## subsetting Data based on column names having mean() or std()
selectedNames <- c(as.character(subdataFeaturesNames), "subject", "activity")
Data <- subset(Data,select=selectedNames)

####################### 3. Using Descriptive Names in Activity #############################
## reading activity_labels.txt file containg activity name and corresponding number
activityLabels <- read.table(file.path(workdir, datadir, "activity_labels.txt"),header = FALSE)
## replacing activity numbers with proper activity labels
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])

################# 4. Labelling Dataset With Descriptive Variable Name ######################
## following lines of code replaces various characters in column names of data with
## proper descriptive names. (e.g. - changing 'Acc' with 'Acceleration')
names(Data) <- gsub("Acc","Acceleration",names(Data))
names(Data) <- gsub("GyroJerk","AngularAcceleration",names(Data))
names(Data) <- gsub("Gyro","AngularSpeed",names(Data))
names(Data) <- gsub("Mag","Magnitude",names(Data))
names(Data) <- gsub("^t","TimeDomain.",names(Data))
names(Data) <- gsub("^f","FrequencyDomain.",names(Data))
names(Data) <- gsub("-mean",".Mean",names(Data))
names(Data) <- gsub("-std",".StandardDeviation",names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data) <- gsub("-","\\.", names(Data))
names(Data) <- gsub("\\(|\\)", "", names(Data))

############# 5. Making Dataset With Average of each Activity for each Subject #############
library(plyr); ## loading plyr to use aggregate function
## making the dataset with mean values
DataOut <- aggregate(. ~subject + activity, Data, mean) 
DataOut <- DataOut[order(DataOut$subject, DataOut$activity),]
## writing the tidy dataset to a file named 'tidy.txt'
write.table(DataOut, file = "tidy.txt", row.name=FALSE)

