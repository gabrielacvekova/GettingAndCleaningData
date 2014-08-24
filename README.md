GettingAndCleaningData
======================

## My project

Created R script contains following recipe:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How can I wonk on the project :

1. Download source and you will ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in folder of ```UCI HAR Dataset```, check your working directory and then change with function ```setwd()``` 
3. Run ```source("run_analysis.R")```, then generate ```clean.txt``` in your working directory.
