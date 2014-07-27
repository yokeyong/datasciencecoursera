## Download data set directly from the internet. Files
## are downloaded to temp directory of R.

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
td = tempdir()
tf = tempfile(tmpdir=td, fileext=".zip")

## Method is set to "auto" under Windows. Data folder is
## created under the working directory to allow easy access.

download.file(fileUrl, tf, method="auto")
unzip(tf, exdir=".", overwrite=TRUE)

## Deletes the temporary files inside R.

unlink(td)
unlink(tf)

## Import the data from the folder, into R.

## Features for the processed data are provided in the
## "features.txt" file. They represent the coumn names
## for the processed data.

features = read.table("./UCI HAR Dataset/features.txt")

## We will deal with the test programme first. 30% of the
## volunteers are involved in the testing. Read in the
## test labels, the identifiers for the test subjects
## and the dataset.

labels_test = read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
test_dat = read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(test_dat) = features$V2
colnames(labels_test) = factor("Activity")
colnames(subject_test) = factor("Volunteer")
programme = data.frame(rep("Test", times=nrow(test_dat)))
colnames(programme) = "Programme"
merged_test = cbind(subject_test, programme, labels_test, test_dat)

## Removes the column names and individual datasets that
## are not in use.

rm(test_dat, labels_test, subject_test, programme)

## We will deal with the training programme next. 70% of the
## volunteers are involved in the training. Read in the
## training labels, the identifiers for the training subjects
## and the dataset.

labels_train = read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
train_dat = read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(train_dat) = features$V2
colnames(labels_train) = factor("Activity")
colnames(subject_train) = factor("Volunteer")
programme = data.frame(rep("Train", times=nrow(train_dat)))
colnames(programme) = "Programme"
merged_train = cbind(subject_train, programme, labels_train, train_dat)

## Housekeeping.

rm(train_dat, labels_train, subject_train, programme, features)

## Creates One Mountain of Data

everest = rbind(merged_test,merged_train)

## Three Additional Variables to the original data; "Volunteers",
## whom are the participants, "Activity, in code numbers to refer
## to the specific activity, and "Programme", which I am unsure
## whether this will have an actual impact on the original users'
## analysis, so I added in 2 Programmes, test and train.

## Now, I shall subset the data set. This data set will contain
## readings of only 30 volunteers, of each individual activity.

## The reason is that, for example, readings for accelerometers on 
## phone kept changing every milliseconds, and it is pretty hard
## to get one single reading. You may check your phone on
## any software that measures accelerometer readings; the readings
## kept jumping. My guess is that they took a lot of readings
## per activity to get a better measurement of the readings
## they want. Hence, I will average the readings per activity.

## Tidy, merged dataset will consider 180 observations, of
## 6 activities per volunteer. Variables will still be 564 for
## now.

arranged = data.frame()
arranged_w_names = data.frame()
everest_part_tidy = data.frame()

for (i in 1:30) {
    
    perv = subset(everest, everest["Volunteer"]==i)
    
    for (j in 1:6) {
      
        perva = subset(perv, perv["Activity"]==j)
        temp = colMeans(perva[,4:564])
        names = perva[1,1:3]
        temp2 = rbind(temp)
        arranged = cbind(names, temp2)
        arranged_w_names = rbind(arranged_w_names, arranged)
        
    }
    
    everest_part_tidy = arranged_w_names
    everest_part_tidy
    
}

## Housekeeping.

rm(arranged, arranged_w_names, perv, perva, temp, names, 
   temp2)

##  Next, we have to subset according to mean and standard
## deviation observations.

## For the subset, I will strictly only take the "-mean()"
## and "-std()" subset. There exists "-meanFreq()" in the
## data, but I take the instruction as not talking about
## the frequency mean, since it may only talk specifically
## about mean, and standard deviation.

## Casting to the long format first. For this, I use the
## "melt" function, in "reshape2" package.

library(reshape2)
melt = melt(everest_part_tidy, c("Volunteer", "Programme", "Activity"))
subset = subset(melt, grepl("mean\\()|std\\()", melt[,4]))
nearly_done = dcast(subset, Volunteer + Programme + Activity ~ variable)

## Descriptive activity names must be used. Hence, I will
## replace the activity numbers with their respective names.

activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")
nearly_done[3] = activity_labels[2]
everest_shrunk = nearly_done

## Housekeeping.

rm(everest_part_tidy, merged_test, merged_train, activity_labels, 
   nearly_done, melt, subset, i, j)

## Final dataset, everest_shrunk will have dimemsions of 180 x 69, with 66
## observed values and 3 extra columns of "Volunteers", "Programme",
## and "Activity" to add readability.

## Everest represents the original dataset.