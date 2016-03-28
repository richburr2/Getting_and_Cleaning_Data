# Getting_and_Cleaning_Data

This repo contains a file run_analysis.R that will analyze the data found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The script assumes that you have downloaded and unzipped this file in your working directory.

When run, it will read in the various files, nad combine header information to them.  It will then filter out any columns other than mean, std, subject, and activity names.  Finally, it creates a new dataframe that calculates the mean for each variable, per Subject and activity.
