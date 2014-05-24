## Explanation of run_analysis.R script
============================================================================================

The R script can be split into 6 parts based on the activity being done:

1. Setting Working directory and reading the required files
2. Merging the test and train data sets
3. Extracting only measurements of mean and standard deviation
4. Naming the activities descriptively
5. Naming the variables of dataset descriptively
6. Creating a final dataset with average of all variables for each subject and each activity

###### Explanations tie back to the code with the line number mentioned

--------------------------------------------------------------------------------------------
#### Part 1: Setting Working directory and reading the required files


##### Line No: 5 
Sets the working directory to the location with data to be worked on

##### Line NO: 11 to 16
Reads the test and training data from the text files

Datasets with prefix "x" read the actual measured values from files prefixed with "x" without headers

Datasets with prefix "y" read the activity index from files prefixed with "y" without headers

Datasets with prefix "sub" read the subject index from files prefixed with "sub" without headers


##### Line No: 21
Reads the sifferent features measured from features.txt without headers as the data starts from 1st row

--------------------------------------------------------------------------------------------
#### Part 2: Merging the test and train data sets

##### Line No: 26 to 28
Column wise Appends the activity index, subject index (datasets with prefix y, sub) to the measurement data (dataset with prefix x) to create complete test and train datasets

Then row wise appends the test and train datasets

Appending is preferred to merging as test and train datasets will not have common subjects


##### Line No: 31
Naming the columns taken from y.test/y.train to activityIndex and the columns from sub.test/sub.train to subjectIndex

--------------------------------------------------------------------------------------------
#### Part 3: Extracting only measurements of mean and standard deviation

##### Line No: 42 to 51
Splits the name of different measurements in features dataset to identify all mean and std columns

The result is fed into an array and then converted to a dataframe and assigned proper column names

##### Line No: 53 to 56
Identifies the indices correspoding to the column names having the word mean or std in them

Subsets the appended test.and.train dataset for these indices

--------------------------------------------------------------------------------------------
#### Part 4: Naming the activities descriptively


##### Line No: 61 to 64
Reads the activity names from activity_labels.txt file

Left Joins the appended test.and.train dataset with the activity dataset to get the activityName column to create test.and.train.tidy.v2

--------------------------------------------------------------------------------------------
#### Part 5: Naming the variables of dataset descriptively

##### Line No: 70 to 79
Creates a character vector with new names formed by concatenating the measurement name, axis and summary function (mean/std)

Some names had the word "body" twice in them. hence cleaning is done to remove it once

##### Line No: 82 to 98
Following substituions are done in the character vector one after the other sequentially:

Metadata	 	|	Replacement
------------------------|:-------------------
^t		 	| timeDomain
^f		 	| frequencyDomain
Acc		 	| Accelerometer
Gyro		 	| Gyroscope
[X]		 	| XAxis
[Y]		 	| YAxis
[Z]		 	| ZAxis
mean		 	| Mean
std		 	| StandardDeviation
mag		 	| Magnitude
BodyAccelerometerJerk	| BodyLinearAcceleration
BodyGyroscopeJerk	| BodyAngularVelocity

Assigns the character vector to the respective column names of test.and.train.tidy.v2 dataset

--------------------------------------------------------------------------------------------
#### Part 6: Creating a final dataset with average of all variables for each subject and each activity

##### Line No: 105 to 125
Computes the average of all measurements in test.and.train.tidy.v2 for each subjectIndex and activityName

Transposes the result of lapply, as column and row names were in transpose form of what we need

Adds the word "average" as prefix to all the column names to amke it more descriptive

Creates 2 new variables activityName and subjectIndex which have become rownames in the tidy data set created after lapply & tranpose

Orders the dataset columns with the activityName and subjectIndex in the beginning followed by averages of the mesurements

Exports the final data set tidy.data2.v2