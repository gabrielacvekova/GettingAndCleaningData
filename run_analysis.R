getwd()
 setwd("C:/Users/XXX/Desktop/DS/Getting and Cleaning data/getdata-projectfiles-UCI HAR Dataset")
 
 if (!require("data.table")) {
   install.packages("data.table")
 }
 if (!require("reshape2")) {
   install.packages("reshape2")
 }
 
 require("data.table")
 require("reshape2")
 
 actlab <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
feat <- read.table("./UCI HAR Dataset/features.txt")[,2]
 extrafeat <- grepl("mean|std", feat)
 XT <- read.table("./UCI HAR Dataset/test/X_test.txt")
 yt <- read.table("./UCI HAR Dataset/test/y_test.txt")
 subt <- read.table("./UCI HAR Dataset/test/subject_test.txt")
 
 names(XT) = feat
 XT = XT[,extrafeat]
 yt[,2] = actlab[yt[,1]]
 names(yt) = c("Activity_ID", "Activity_Label")
 names(subt) = "subject"
 td <- cbind(as.data.table(subt),yt, XT)
 
 XTR <- read.table("./UCI HAR Dataset/train/X_train.txt")
 ytr <- read.table("./UCI HAR Dataset/train/y_train.txt") 
 subtr <- read.table("./UCI HAR Dataset/train/subject_train.txt")
 names(XTR) = feat
 XTR = XTR[,extrafeat]
 ytr[,2] = actlab[ytr[,1]]
 names(ytr) = c("Activity_ID", "Activity_Label")
 names(subtr) = "subject"
 

trd <- cbind(as.data.table(subtr), ytr, XTR)
data = rbind(td, trd)

idlab= c("subject", "Activity_ID", "Activity_Label")
dlab = setdiff(colnames(data), idlab)
 md = melt(data, id = idlab, measure.vars = dlab)
clean= dcast(md, subject + Activity_Label ~ variable, mean)

write.table(clean, file = "./clean.txt",row.name=FALSE)
 
