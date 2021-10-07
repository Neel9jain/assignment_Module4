

## Reading the Test Data
X_test  <- read.table("UCI\ HAR\ Dataset/test/X_test.txt",header =FALSE)

colname <- read.table("UCI\ HAR\ Dataset/features.txt",header = FALSE)
names(X_test) <- colname[,2]

Y_test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt",header =FALSE)
names(Y_test) <- "Activity"

subject_test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt",header =FALSE)
names(subject_test) <- "Subject_Id"

Test_data <- cbind(subject_test,Y_test,X_test)

# Reading the Training Data
X_train <- read.table("UCI\ HAR\ Dataset/train/X_train.txt",header =FALSE)
names(X_train) <- colname[,2]

Y_train <- read.table("UCI\ HAR\ Dataset/train/y_train.txt",header =FALSE)
names(Y_train) <- "Activity"

subject_train <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt",header =FALSE)
names(subject_train) <- "Subject_Id"

Train_data <- cbind(subject_train,Y_train,X_train)


# 1 . Merges the training and the test sets to create one data set. 
Full_Data <- rbind(Test_data,Train_data)

## write.csv(Full_Data,"Full_Data.csv") ## Extracting the Data in CSV for Checking 



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

list_names <- names(Full_Data)
filtered_names <- list_names[grep(pattern = 'Subject_Id|Activity|mean|std', x = list_names)]

## New Filtered Data based on mean and std 

Filtered_Data <- Full_Data[,filtered_names]


## 3.Uses descriptive activity names to name the activities in the data set
Activity_names <- read.table("UCIHARDataset/activity_labels.txt",header =FALSE)
Filtered_Data$Activity <- Activity_names$V2[match(Filtered_Data$Activity, Activity_names$V1)]

## write.csv(Filtered_Data,"Filtered_Data.csv") ## Extracting the Data in CSV for Checking 


## 4.Appropriately labels the data set with descriptive variable names.
## This Point is already covered while reading the data all the variable names were 
## extracted and data sets were labelled (see variable: colname)


## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

library(dplyr)
options(dplyr.summarise.inform = FALSE)   ## to suppress annoying dplyr info's 

filtered_vars <- list_names[grep(pattern = 'mean|std', x = list_names)]

tidy_data <- Filtered_Data %>%
  group_by(Subject_Id,Activity) %>%
  summarise(across(filtered_vars, mean, na.rm = TRUE))

write.csv(tidy_data,"tidy_data.csv")  ## Extracting the Data in CSV for Checking

write.table(tidy_data,"tidy_data.txt",row.name=FALSE)



