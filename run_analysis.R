### merge the training and test data set to create one data set
X_test  <- read.table("UCIHARDataset/test/X_test.txt",header =FALSE)
colname <- read.table("UCIHARDataset/features.txt",header = FALSE)
names(X_test) <- colname[,2]

Y_test <- read.table("UCIHARDataset/test/y_test.txt",header =FALSE)
names(Y_test) <- "Activity"

subject_test <- read.table("UCIHARDataset/test/subject_test.txt",header =FALSE)
names(subject_test) <- "Participant_Id"

Test_data <- cbind(subject_test,Y_test,X_test)

X_train <- read.table("UCIHARDataset/train/X_train.txt",header =FALSE)
names(X_train) <- colname[,2]

Y_train <- read.table("UCIHARDataset/train/y_train.txt",header =FALSE)
names(Y_train) <- "Activity"

subject_train <- read.table("UCIHARDataset/train/subject_train.txt",header =FALSE)
names(subject_train) <- "Participant_Id"

Train_data <- cbind(subject_train,Y_train,X_train)

Activity_names <- read.table("UCIHARDataset/activity_labels.txt",header =FALSE)

Full_Data <- rbind(Test_data,Train_data)




Full_Data$Activity <- Activity_names$V2[match(Full_Data$Activity, Activity_names$V1)]


write.csv(Full_Data,"Full_Data.csv")



