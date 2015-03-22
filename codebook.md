## CODEBOOK FOR TIDY DATASET
<body>
<p>This sample is based on dataset <strong>Human Activity Recognition Using Smartphones Dataset</strong> by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from
Smartlab - Non Linear Complex Systems Laboratory (see <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>)</p>

<p>According to the authors: &ldquo;The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz&rdquo;. Then data were pre-processed by applying applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). From each window, a vector of features was obtained by calculating variables such as   mean, max, standard deviation, signal entropy&hellip; from the time and frequency domain.</p>

<p><strong>Source data</strong> used in this exercise includes 2 sets of data: training and test data. We used only part of these datasets provided, which consists of:</p>

<ul>
<li>A 561-feature vector with time and frequency domain of normalized and bounded within [-1,1] variables.</li>
<li>a subject vector which identifies the subject who performed the activity for each window sample. Values ranged from 1 to 30.</li>
<li>a activity vector which identifies activity performed by a subject in each window sample. Values ranged from 1 to 6
For both sets there are vectors for: </li>
<li>activity labels.</li>
<li>features descriptive names</li>
</ul>

For the full data description please refers to <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a> and REAME file included in dataset.

<p><strong>Processed data</strong>: it consists of 180 observation for 68 variables. The variables includes subject, activity performed and averages for only  mean and standard deviation features of source data, by subject and activity.</p>

<p>To arrive at the result dataset we first processed test and training data. For each of them we merged the 561-features vector, subject vector and activity vector into one data frame. Then we merged these test and training result data frames by rows to get one big data frame of 10299 by 563. By subsetting we got a new data frame which consists of only subject, activity performed and 66 variables of required mean and standard deviation of measurements. We change levels of activity variable to be more descriptive. Then we calculated mean for each of 66 variables for each activity and each subject.</p>

<p><strong>DATA DICTIONARY FOR THE RESULT DATASET</strong></p>

<ul>
<li><em>subject</em>: the subject who performed the activity.
       <ul>
       <li> Datatype: interger.</li> 
       <li> Values ranged from 1 to 30</li>
       </ul>
</li>
<li><em>activity</em>: activity performed by a subject.
       <ul>
       <li> Datatype: factor with 6 levels:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING</li>
       </ul>
</li>
<li><em>66 other variables</em>: average value by subject and activity of mean and standard deviation of featured measurements. <br>
Each variable is in the partern with 3 components: <br> 
1) tBodyAcc-XYZ,
tGravityAcc-XYZ,
tBodyAccJerk-XYZ,
tBodyGyro-XYZ,
tBodyGyroJerk-XYZ,
tBodyAccMag,
tGravityAccMag,
tBodyAccJerkMag,
tBodyGyroMag,
tBodyGyroJerkMag,
fBodyAcc-XYZ,
fBodyAccJerk-XYZ,
fBodyGyro-XYZ,
fBodyAccMag,
fBodyAccJerkMag,
fBodyGyroMag,
fBodyGyroJerkMag <br>
2) and with or without -mean(), -std() with denote mean and standard deviation of measurements<br>
3) and with or without X,Y,Z which denote axial direction<br>
<ul>
<li>Datatype: numeric</li>
<li>Value ranged from [-1,1]</li>
</ul>
</li>
</ul>

</body>

</html>
