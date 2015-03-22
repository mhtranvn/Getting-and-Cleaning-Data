<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title></title>

<script type="text/javascript">
window.onload = function() {
  var imgs = document.getElementsByTagName('img'), i, img;
  for (i = 0; i < imgs.length; i++) {
    img = imgs[i];
    // center an image if it is the only element of its parent
    if (img.parentElement.childElementCount === 1)
      img.parentElement.style.textAlign = 'center';
  }
};
</script>





<style type="text/css">
body, td {
   font-family: sans-serif;
   background-color: white;
   font-size: 13px;
}

body {
  max-width: 800px;
  margin: auto;
  padding: 1em;
  line-height: 20px;
}

tt, code, pre {
   font-family: 'DejaVu Sans Mono', 'Droid Sans Mono', 'Lucida Console', Consolas, Monaco, monospace;
}

h1 {
   font-size:2.2em;
}

h2 {
   font-size:1.8em;
}

h3 {
   font-size:1.4em;
}

h4 {
   font-size:1.0em;
}

h5 {
   font-size:0.9em;
}

h6 {
   font-size:0.8em;
}

a:visited {
   color: rgb(50%, 0%, 50%);
}

pre, img {
  max-width: 100%;
}
pre {
  overflow-x: auto;
}
pre code {
   display: block; padding: 0.5em;
}

code {
  font-size: 92%;
  border: 1px solid #ccc;
}

code[class] {
  background-color: #F8F8F8;
}

table, td, th {
  border: none;
}

blockquote {
   color:#666666;
   margin:0;
   padding-left: 1em;
   border-left: 0.5em #EEE solid;
}

hr {
   height: 0px;
   border-bottom: none;
   border-top-width: thin;
   border-top-style: dotted;
   border-top-color: #999999;
}

@media print {
   * {
      background: transparent !important;
      color: black !important;
      filter:none !important;
      -ms-filter: none !important;
   }

   body {
      font-size:12pt;
      max-width:100%;
   }

   a, a:visited {
      text-decoration: underline;
   }

   hr {
      visibility: hidden;
      page-break-before: always;
   }

   pre, blockquote {
      padding-right: 1em;
      page-break-inside: avoid;
   }

   tr, img {
      page-break-inside: avoid;
   }

   img {
      max-width: 100% !important;
   }

   @page :left {
      margin: 15mm 20mm 15mm 10mm;
   }

   @page :right {
      margin: 15mm 10mm 15mm 20mm;
   }

   p, h2, h3 {
      orphans: 3; widows: 3;
   }

   h2, h3 {
      page-break-after: avoid;
   }
}
</style>



</head>

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
<li>features descriptive names
For the full data description please refers to <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a> and REAME file included in dataset.</li>
</ul>

<p><strong>Processed data</strong>: it consists of 180 observation for 68 variables. The variables includes subject, activity performed and averages for only  mean and standard deviation features of source data, by subject and activity.</p>

<p>To arrive at the result dataset we first processed test and training data. For each of them we merged the 561-features vector, subject vector and activity vector into one data frame. Then we merged these test and training result data frames by rows to get one big data frame of 10299 by 563. By subsetting we got a new data frame which consists of only subject, activity performed and 66 variables of required mean and standard deviation of measurements. Then we calculated mean for each of 66 variables for each activity and each subject.</p>

<p><strong>DATA DICTIONARY FOR THE RESULT DATASET</strong></p>

<ul>
<li><em>subject</em>: the subject who performed the activity. 
       + Datatype: interger. 
       + Values ranged from 1 to 30</li>
<li><em>activity</em>: activity performed by a subject. 
       + Datatype: factor with 6 levels:WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING</li>
<li><em>66 other variables</em>: average value by subject and activity of mean and standard deviation of measurements. </li>
<li>Each variable is in the partern: 
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
and with or without -mean(), -std() with denote mean and standard deviation of measurements
and with or without X,Y,Z which denote axial direction</li>
<li>Datatype: numeric</li>
<li>Value ranged from [-1,1]</li>
</ul>

</body>

</html>
