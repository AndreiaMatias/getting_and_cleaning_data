#Final Project

library(plyr)
library(dplyr)
#importing data into R

x_training_data <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/train/X_train.txt")
y_training_data <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/train/subject_train.txt")
x_testing_data <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/test/X_test.txt")
y_testing_data <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/features.txt")
activity_labels <- read.table("C:/Users/deiam/Documents/R/UCI HAR Dataset/activity_labels.txt")


#Verifying datasets
head(x_training_data)
head(x_testing_data)
head(y_training_data)
head(x_testing_data)
head(subject_train)
head(subject_test)
head(features)
head(activity_labels)
dim(training_data)
dim(testing_data)
dim(subject_test)
dim(subject_train)
names(x_training_data)
names(x_testing_data)
names(subject_train)
names(subject_test)
names(features)

#merging training and testing data

x_data <- rbind(x_training_data, x_testing_data)
dim(x_data)

y_data <- rbind(y_training_data, y_testing_data)
dim(y_data)
head(y_data)
subject_data <- rbind(subject_train,subject_test)
dim(subject_data)

#replacing indexes

y_data$V1 <- factor(y_data$V1,activity_labels[,1],activity_labels[,2])
dim(y_data)
head(y_data)

#Renaming variables

names_var <- features[,2]
names_var
names(x_data) <- names_var
head(x_data)
names(y_data) <- "Activity"
head(y_data)
names(subject_data) <- "Subject"

#joining activity and subject to the dataset

data <- cbind(x_data,y_data,subject_data)
head(data)
dim(data)
str(data)

#Extracting measurements on the mean and standard deviation for each measurement

mean_data <- data[,grep("mean",names(data),value=TRUE)]
std_data <- data[,grep("std" ,names(data),value=TRUE)]
mean_std <- cbind(mean_data,std_data)
head(mean_std)

#new data set with the average of each activity and each subject

new_dataset <- aggregate(.~ Subject+Activity,data, "mean")
View(new_dataset)
