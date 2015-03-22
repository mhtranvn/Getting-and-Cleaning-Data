## STEP 1.Merges the training and the test sets to create one data set.

## Reading in data from the working directory

features <- read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)
activities <- read.table("activity_labels.txt", header=FALSE)

## reading test data
data_test <- read.table("./test/X_test.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt",header=FALSE)
activity_test <- read.table("./test/y_test.txt", header=FALSE)
test<-cbind(subject_test, activity_test, data_test)
rm(data_test, subject_test, activity_test)

#reading training data
data_train <- read.table("./train/X_train.txt", header=FALSE)
subject_train <- read.table("./train/subject_train.txt",header=FALSE)
activity_train <- read.table("./train/y_train.txt", header=FALSE)
train<-cbind(subject_train, activity_train, data_train)
rm(data_train, subject_train, activity_train)

# merge test and train data into one data frame
merged_data <- rbind(test, train)
rm (test,train)

# give columns descriptive name from features file
colnames(merged_data)<-c("subject","activity",features$V2)


## STEP 2.Extracts only the measurements on the mean and standard deviation for each measurement

## introducing selected_cols give us the freedom to modify the selection set for columns
## credit Marco Melnykovych on data.frame[,grep(pattern,names(data.frame))]

selected_cols <- c("subject","activity",features$V2[grep("mean\\(\\)|std\\(\\)",features$V2, ignore.case=FALSE)])
selected_data <- merged_data[,selected_cols]

## STEP 3. Uses descriptive activity names to name the activities in the data set

selected_data$activity <- factor(selected_data$activity)
## change activity factor levels to a more descriptive names 
levels(selected_data$activity) <- gsub("_"," ",activities$V2)

## STEP 4. Appropriately labels the data set with descriptive variable names
## modify variable names vector by removing "(" and ")" to make names more compatible with variable naming standard
selected_cols <- gsub("\\(\\)","",selected_cols)
colnames(selected_data) <- selected_cols

## STEP 5. Create independent tidy data set with the average of each variable for each activity and each subject

## credit Darragh McConville for advice on summarise_each
library(dplyr)
selected_tbl<-tbl_df(selected_data)
tidy_data<-summarise_each(group_by(selected_tbl,subject,activity),funs(mean))

# write data to a text file as required
write.table(tidy_data,file="average_data.txt",row.names=FALSE)
