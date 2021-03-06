##--------------------------------------------------------------------------------
##setting working directory-------------------------------------------------------
##--------------------------------------------------------------------------------

setwd("E:/shiva/Course Project1/UCI HAR Dataset")

##--------------------------------------------------------------------------------
##reading the test and training datasets------------------------------------------
##--------------------------------------------------------------------------------

x.test<-read.table("test/X_test.txt",header=FALSE)
y.test<-read.table("test/y_test.txt",header=FALSE)
x.train<-read.table("train/X_train.txt",header=FALSE)
y.train<-read.table("train/y_train.txt",header=FALSE)
sub.train<-read.table("train/subject_train.txt",header=FALSE)
sub.test<-read.table("test/subject_test.txt",header=FALSE)

##--------------------------------------------------------------------------------
##reading the features data to know which column corresponds to which data-------
##--------------------------------------------------------------------------------
features<-read.table("features.txt",header=FALSE,stringsAsFactors=FALSE)

##--------------------------------------------------------------------------------
##merging test and training datasets into one set--------------------------
##--------------------------------------------------------------------------------
test<-cbind(x.test,y.test,sub.test) ##including activity & subject index
train<-cbind(x.train,y.train,sub.train) ##including activity & subject index
test.and.train<-rbind(test,train)

##naming the last 2 column as activity & subject index
colnames(test.and.train)[562:563]<-c("activityIndex","subjectIndex") 

##--------------------------------------------------------------------------------
##extracting only columns with mean and standard deviation-----------------
##--------------------------------------------------------------------------------

##--------------------------------------------------------------------------------
##identifying the column indices which have mean and standard deviation-----------
##--------------------------------------------------------------------------------

##splitting the name column in the feature vector
features.name.split<-strsplit((features$V2),"-")
features.name.split.cleaned <- array(dim=c(length(features.name.split),3))

for(i in 1:length(features.name.split)) {
  for(ii in 1:3) {features.name.split.cleaned[i,ii] = features.name.split[[i]][ii]}
}

colnames(features.name.split.cleaned)<-c("metricMeasured","measurementMade","measuredRange")

features.name.split.cleaned<-as.data.frame(features.name.split.cleaned)

features.index<-which(features.name.split.cleaned$measurementMade %in% c("mean()","std()"))

##extracting the necessary columns using features.index
test.and.train.tidy.v1<-test.and.train[,c(features.index,562,563)]

##--------------------------------------------------------------------------------
##getting the descriptive activity names-----------------------------------
##--------------------------------------------------------------------------------
descriptive.Activity.Names<-read.table("activity_labels.txt",header=FALSE,col.names=c("activityIndex","activityName"))

test.and.train.tidy.v2<-merge(x=test.and.train.tidy.v1,y=descriptive.Activity.Names,
                              by.x="activityIndex",by.y="activityIndex",all.x=TRUE)

##--------------------------------------------------------------------------------
##giving the column names for tidy data set--------------------------------
##--------------------------------------------------------------------------------

name.part1<-features.name.split.cleaned$metricMeasured[features.index]
name.part2<-unlist(strsplit(as.character(features.name.split.cleaned$measurementMade[features.index]),"\\()"))
name.part3<-features.name.split.cleaned$measuredRange[features.index]

feature.names<-ifelse(is.na(name.part3)==FALSE,
                      paste(name.part1,name.part3,name.part2,sep=""),
                      paste(name.part1,name.part2,sep=""))

##removing the word "Body" when it appears twi
feature.names.v1<-gsub("([Bb][Oo][Dd][Yy])\\1","Body",feature.names)

##changing t to timedomain; f to frequencydomain;
feature.names.v2<-gsub("^t","timeDomain",feature.names.v1) 
feature.names.v3<-gsub("^f","frequencyDomain",feature.names.v2) 

##cleaning for acc, gyro, axis in variable names
feature.names.v4<-gsub("Acc","Accelerometer",feature.names.v3) 
feature.names.v5<-gsub("Gyro","Gyroscope",feature.names.v4) 
feature.names.v6<-gsub("[X]","Xaxis",feature.names.v5) 
feature.names.v7<-gsub("[Y]","Yaxis",feature.names.v6) 
feature.names.v8<-gsub("[Z]","Zaxis",feature.names.v7) 
feature.names.v9<-gsub("mean","Mean",feature.names.v8)
feature.names.v10<-gsub("std","StandardDeviation",feature.names.v9)
feature.names.v11<-gsub("Mag","Magnitude",feature.names.v10) 
feature.names.v12<-gsub("BodyAccelerometerJerk","BodyLinearAcceleration",feature.names.v11)
feature.names.v13<-gsub("BodyGyroscopeJerk","BodyAngularVelocity",feature.names.v12)

##assigning the above vector the colnames of tidy data
colnames(test.and.train.tidy.v2)[2:(length(feature.names.v13)+1)]<-feature.names.v13

##--------------------------------------------------------------------------------
##creating a second tidy data set with average of each measurement for each
##--------variable and each subject-----------------------------------------------
##--------------------------------------------------------------------------------

tidy.data2<-as.data.frame(
  lapply(
    split(test.and.train.tidy.v2,
    list(test.and.train.tidy.v2$activityName,test.and.train.tidy.v2$subjectIndex)), 
               function(x) colMeans(x[,2:67])))

## the result obtained in previous step has subject & activity in columns and hence doing a transpose
tidy.data2.v1<-as.data.frame(t(tidy.data2)) 

##updating the colnames to reflect they have the mean for each subject and activity
colnames(tidy.data2.v1)<-paste0("average",colnames(tidy.data2.v1),sep="")

##creating new column from the rownames
tidy.data2.v1$activityName<-unlist(strsplit(rownames(tidy.data2.v1),"\\."))[seq(from=1,to=length(rownames(tidy.data2.v1))*2,by=2)]
tidy.data2.v1$SubjectIndex<-unlist(strsplit(rownames(tidy.data2.v1),"\\."))[seq(from=2,to=length(rownames(tidy.data2.v1))*2,by=2)]

##reordering columns
tidy.data2.v2<-tidy.data2.v1[,c(67,68,1:66)]

##exporting the final tidy data set
write.table(tidy.data2.v2,"tidy_data_set2.txt",row.names=FALSE)
