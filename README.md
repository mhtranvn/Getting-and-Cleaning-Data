### Getting-and-Cleaning-Data REAME
This is a README file for the Getting and Cleaning Data Course Project.   
According to Jeff Leek, >"the purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."   
**The source data**   
The source data represent data collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description is available at [the site] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the dataset REAME file. Actual data was downloaded from [this site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
**The result tidy dataset**   
The result is a *independent tidy data set* with the average of each variable for each activity and each subject. Full description of data structure and values of this dataset, as well as transformations done to the source data to get the resulting dataset is described in accompanying *CodeBook.md* file.   
The result dataset is given in form of text file *average_data.txt*. It can be read into R with command   
```
data <- read.table("average_data", header = TRUE)
```
providing the file is in R working directory. (credit to David Hood)      
**Script for performing the analysis**

