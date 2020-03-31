==================================================================
Student assignment work for Coursera "Getting and Cleaning Data" course project based on manipulation of on data from:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Mark Brantana "Getting and Cleaning Data" course Project based on manipulation of on data from:
Submitted 03/30/2020
Project based on manipulation of on data from:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For this assignment:

The zip file was downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data was saved locally unpacked and the files reviewed for consistency. Three basic file sets were provided:
1. An overall set containing activity index information and header information common to the other two file sets.
2. A training set consisting of a file containing participating subject information, a corresponding file with training activity training information, and corresponding file with processed training data.
3. A test set consisting of a file containing participating subject information, a corresponding file with training activity training information, and corresponding file with processed training data.
Note: All pertinent data was reviewed, extracted to datafiles for further processing as described below.
Note: Items 2. & 3. further contained "raw" data files which were not used as they were not pertinent to this assignment.

Assignment - Overall tidy dataset.
These data sets were combined and extracted to produce a tidy data set (Set_1) of the overall means and averages as follows:
1. The three files training files were combined column-wise by column to produce a unified file of training data.
2. Likewise, the three test files were combined column-wise in a like order to the training files to produce a unified file of test data.
3. The new training and test files were combined row-wise to produce a single overall dataset.
4. Generic column headings were replaced with descriptive headings using the overall set of header information.
5. Indexed activity data was replaced with descriptive headings using the activity index.
6. The final set (Set_1) was produced by maintaining identifying columns and column headings containing partial strings of either "mean()" or "std()". Care was taken to disclude inconsistent columns containing "meanFrequency()" or similar.

Assignment - tidy subset, from Overall tidy dataset, with subject data row averages and row standard deviations.
Set_1 was utilized to produce this subset (Set_2) as follows:
1. A new file (Set_2) was produced containing only the identifying columns from Set_1.
2. Another file was produced containing only the data columns from Set_1, and from this, row means and row a standard deviations were developed.
3. The final set (Set_2) was produced by adding only the row mean and row a standard deviation columns.

For each record, the original datset provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original dataset included the following files and these are utilized in this class project as described:
=========================================

- 'README.txt' => Modified

- 'features_info.txt': Shows information about the variables used on the feature vector. => Reviewed

- 'features.txt': List of all features. => Utilized

- 'activity_labels.txt': Links the class labels with their activity name. => Utilized

- 'train/X_train.txt': Training set. => Utilized

- 'train/y_train.txt': Training labels. => Utilized

- 'test/X_test.txt': Test set. => Utilized

- 'test/y_test.txt': Test labels. => Utilized

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. => Utilized

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. => Raw data not utilized

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. => Raw data not utilized 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. => Raw data not utilized 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
