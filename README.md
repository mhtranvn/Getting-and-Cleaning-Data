### Getting-and-Cleaning-Data REAME
This is a README file for the Getting and Cleaning Data Course Project.   
According to Jeff Leek, >"the purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."   
   
**The source data**   
The source data represent data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description is available at [the site] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the dataset REAME file. Actual data was downloaded from [this site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
   
**The result tidy dataset**   
The result is a *independent tidy data set* with the average of each variable for each activity and each subject. Full description of data structure and values of this dataset, as well as transformations done to the source data to get the resulting dataset is described in accompanying *CodeBook.md* file.   
The result dataset is given in form of text file *average_data.txt*. It can be read into R with command   
```
data <- read.table("average_data.txt", header = TRUE)
```
providing the file is in R working directory (credit to David Hood)   
   
**Script for performing the analysis**
The script for performing the analysis is named *run_analysis.R*.    
After downloading source data from above link, the data will be in the file named *getdata-projectfiles-UCI HAR Dataset.zip*. Unzip this file and we will get a directory named *UCI HAR Dataset*. Set this directory as your R' session working directory and copy the file *run_analysis.R* into this directory. You should not modify the directory structure as well as files inside it. Source the file *run_analysis.R* and we will get output file *average_data.txt* in the working directory.   
The script *run_analysis.R* does following:   
* Reading in the source data using command read.table() for both test and training dataset from respective *test* and *train* directory. For each of the set it will read in 561-features vector, it's corresponding subject and activity vectors. Then we perform merging them into one data frame using cbind() for each test and training data. After that we removed temporary data frames to free up memory      
```
data_test <- read.table("./test/X_test.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt",header=FALSE)
activity_test <- read.table("./test/y_test.txt", header=FALSE)
test<-cbind(subject_test, activity_test, data_test)
rm(data_test, subject_test, activity_test)
```
