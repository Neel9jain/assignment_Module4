## This project is meant to tidy the data of the UCIHARDataset 
## The files their descriptions is as follows

This Analysis is for the group of 30 participants who have each performed a group of activity,and some measurements have been taken for eachh participants.

The following files are present in the RAW dataset with the explaination of each file

activity_lables.txt -> Each participant has given the measurements while performing 6 activities with id 1 to 6 , this file contains the names of those lables.

features.txt -> There are 561 observations  for which measurements have been taken for each participanta and each activity, this file contains the names of these observations 

features_info.txt -> This file gives a breif description about the features file.

x_test.txt -> all 561 measurements of each participant

y_test.txt -> Name of the activity (1 to 6) 

subject_test.txt -> identifier for the person who performed the activity (1 to 30)

x_train.txt  -> all 561 measurements of each participant

y_train.txt -> Name of the activity (1 to 6) 

subject_train.txt -> identifier for the person who performed the activity (1 to 30)


Now since 70% of the participants have generated the training data i.e unique participants for the tarining data would be 21 
30% percent have generated the test data the test data should be for 9 participants

The script run_analysis.R combines all the RAW data from different participants and generates a tidy data set and csv file.

The codebook describes each of the variables used in the run_analysis.R


