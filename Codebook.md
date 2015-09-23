<h3> Overview </h3>

This codebook is for the Coursera course 'Getting and Cleaning Data' which uses the ['Human Activity Recognition using Smartphone Dataset'](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone (Samsung Galaxy S II) on the waist.

The dataset has a training and test dataset for the activities performed.

<h3> Datasets </h3>

<b> activity_labels.txt </b> </br>
Gives the name of the activities. i.e Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying </br>
<b> features.txt </b> </br>
Gives the names of the 561 features </br>
<b> X_train.txt </b> </br>
Contains 7352 observations of 561 features for the activities</br>
<b> Y_train.txt </b> </br>
Contains the 2947 activity numbers for the observation in X_train.txt</br>
<b> X_test.txt </b> </br>
Contains 7352 observations of 561 features for the activities</br>
<b> Y_test.txt </b> </br>
Contains the 2947 activity numbers for the observation in X_train.txt</br>
<b> subject_train.txt </b> </br>
Contains 7352 observations of the subject variable</br>
<b> subject_test.txt </b> </br>
Contains 2947 observations of the subject variable</br>

<h3> Processing </h3>

1) All the above datasets were read into R and cleaned accordingly.</br>
2) A few of the column were removed which didnot conatain 'mean' or 'std'. This was one of the functions to be performed for the project.</br>
3) The activity column was renamed according to the actvity names and was converted to factor form.</br>
4) The final tidy dataset was creted with 10299 observations and 68 variables.</br>
5) The tidy dataset was saved as a .txt file named 'tidy_dataset.txt'.</br>
