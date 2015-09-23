library(dplyr)
library(reshape2)

## 1) Load and Merge the datasets
# The below commands are to load the appropriate datasets

x_test <- read.table("X_test.txt")
x_train <- read.table("X_train.txt")
y_test <- read.table("Y_test.txt")
y_train <- read.table("Y_train.txt")
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")

# Extracting names from the Features list and updating them to the 
# X-Train and X-Test files

features_list <- read.table("features.txt")
names(x_test) <- features_list$V2
names(x_train) <- features_list$V2

# Updating the column names in the subject train and test dataset
# to "subject"

names(subject_test) <- "subject"
names(subject_train) <- "subject"

# Updating the column names in the y train and test dataset
# to "activity"

names(y_train) <- "activity"
names(y_test) <- "activity"

# Combine the datasets together

train <- cbind(subject_train,y_train,x_train)
test <- cbind(subject_test, y_test,x_test)
final_df <- rbind(train,test)


## 2) Extracting only the measurments on Mean and Standard Deviation

mean_std <- grepl("mean\\(\\)", names(final_df)) |
  grepl("std\\(\\)", names(final_df))

# Keeping the "subject" and "activity" columns

mean_std[1:2] <- TRUE

# The final dataframe which contains the mean and std only

final_df <- final_df[,mean_std]

## 3) Change the activity names to their appropriate values

final_df$activity <- factor(final_df$activity, labels = c("Walking","Walking Upstairs","Walking Downstairs"
                           ,"Sitting","Standing","Laying"))

## 4) Use the reshape2 package to melt the dataset for furhter
##    analysis 

melt_value <- melt(final_df, id = c("activity","subject"))

# Using the dcast function to get the mean

dcast_value <- dcast(melt_value, subject+activity ~ variable,mean)

## 5) Save the tidy dataset as a table

write.table(dcast_value, "tidy_dataset.txt", row.names = FALSE)
