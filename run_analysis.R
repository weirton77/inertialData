# class project

# test set
setwd("C:/Users/steve/Desktop/getting data/PROJECT/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")
datatest=read.table("X_test.txt")  # noticeable time lag
actest=read.table("y_test.txt")
subtest=read.table("subject_test.txt")
test=cbind(subtest,actest,datatest)

# train set
setwd("C:/Users/steve/Desktop/getting data/PROJECT/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")
datatrain=read.table("X_train.txt")  # noticeable time lag
actrain=read.table("y_train.txt")
subtrain=read.table("subject_train.txt")
train=cbind(subtrain,actrain,datatrain)

# merging the test & train sets (#1)
total = rbind(test,train)  # 10299 obs of 561 features, plus subject & activity

#now add variable names (#4)

setwd("C:/Users/steve/Desktop/getting data/PROJECT/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
features=read.table("features.txt")
feat=as.character(features$V2)
setwd("C:/Users/steve/Desktop/getting data/PROJECT/")
labels=read.table("activityLabels.txt")

sum(labels[,2]==features[,2])  # sum = 561 so either can be used for variable names

names(total)=c("subject","activity",feat)   
tnames= names(total)
# now excerpt mean(), std(), and meanfreq  (#2)
redtot = total[,c(1,2,grep("mean\\()",tnames),grep("std\\()",tnames),grep("meanFre",tnames) )]
#we see from the environment panel of RStudio that these dfs have the correct number of rows and columns, and can check a few columns with eg redtot[1:4,1:4]
#note that the columns are reshuffled so that the means and stds are in blocks

#to substitute descriptive names for the activity codes:  (#3)
acts = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

redtot[,2]=acts[redtot[,2]]

#now aggregate  (#5)
actions =aggregate(redtot[3:81],by=list(redtot$subject, redtot$activity),FUN=mean)

#reset the first 2 column names
names(actions)[1:2]=c("subject","activity")

#check a couple samples
actions[1:4,1:4]
actions[1:4,79:81]

# por fin
write.table(actions, file = "actions.txt", row.name = FALSE)

#recheck
active =read.table("actions.txt", header = TRUE)
active[1:4,1:4]
active[1:4,79:81]
