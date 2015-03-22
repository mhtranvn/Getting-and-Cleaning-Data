### Getting-and-Cleaning-Data REAME
This is a README file for the Getting and Cleaning Data Course Project.   
According to Jeff Leek, "the purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."   
   
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
After downloading source data from above link, the data will be in the file named *getdata-projectfiles-UCI HAR Dataset.zip*. Unzip this file and we will get a directory named *UCI HAR Dataset*. Set this directory as your R' session working directory and copy the file *run_analysis.R* into this directory. You should not modify the directory structure as well as files inside it. Source the file *run_analysis.R* and we will get an output file *average_data.txt* in the working directory.   
The script *run_analysis.R* does following:       
* Reading in activity and features labels from working directory into data frames *features* and *activities*
* Reading in the source data using command read.table() for both test and training dataset from respective *test* and *train* directory. For each of the set it will read in 561-features vector, it's corresponding subject and activity vectors. Then we perform merging them into one data frame using cbind() for each test and training data. After that we removed temporary data frames to free up memory      
```
data_test <- read.table("./test/X_test.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt",header=FALSE)
activity_test <- read.table("./test/y_test.txt", header=FALSE)
test<-cbind(subject_test, activity_test, data_test)
rm(data_test, subject_test, activity_test)
```
* Using row binding to merge *test* and *train* data frames together. As a result we will get a big data frame *merged_data* size of 10299 and 563 (including subject variable, activity variable and 561 variables for 561 features).   
* We constructed a vector of descriptive variable names from *"subject"*, *"activity"* and *features* vector and assign it to column names of *merged_data* to give it more descriptive variable names   
```
colnames(merged_data)<-c("subject","activity",features$V2)
```
* Based on course project requirements of "only the measurements on the mean and standard deviation for each measurement" we constructed a character vector *selected_cols* of selected variable names which we are going to select into our new data frame. Using *grep* command we select only variable names which consist of *mean()* and *std()* words from *features* data frame. By introducing *selected_cols* we will have a freedom to choose a set of variables which we need for our new data frame only by modifying this vector. Then we use subsetting to get our *selected_data* frame with only means and standard deviations   
```
selected_cols <- c("subject","activity",features$V2[grep("mean\\(\\)|std\\(\\)",features$V2, ignore.case=FALSE)])
selected_data <- merged_data[,selected_cols]
```
* Convert *activity* column to factor, then use *activities* vector of activity label to change factor labels to the more descriptive ones   
```
selected_data$activity <- factor(selected_data$activity)
## change activity factor levels to a more descriptive names 
levels(selected_data$activity) <- activities$V2
```
* Remove "(" and ")" from *selected_data* vector of variable names to make them more compatible with R variable naming standard. Since we do not have more descriptive information in the source's *features_info.txt* so it is quite hard to give columns more descriptive names not running into the risk that it may incorrectly reflect the nature of data in the column. Here we only show that technically we can change variable names to something more descriptive by just modifying the names vector
```
selected_cols <- gsub("\\(\\)","",selected_cols)
colnames(selected_data) <- selected_cols
```
* Convert the *selected_data* to *selected_tbl* type of tbl to use with *dplyr* package. 
* Group this *selected_tbl* by subject and activity, then use *summarise_each()* to calculate means for each remaning featured variable by subject and activity.   
```
tidy_data<-summarise_each(group_by(selected_tbl,subject,activity),funs(mean))
```
* Last step is to write this tidy data frame to the file *average_data.txt*
