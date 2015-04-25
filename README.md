
The steps followed in completing this assignment were as follows:
1. Download and unzip data from link provided (Note this step was not performed using R code as problems were experienced with download and unzip)
2. Place all .txt files in 'UCI_HAR' subditectory within working directory
3. Clear memory to ensure no previous operations influence running of scripts
4. Set working directory
5. Read Files from ./UCI_HAR/ subdirectory into R as a list containing separate data frames for each file
6. Assign names to files, excluding prefix ./UCI_HAR/ to simplify subsequent operations
7. Create separate data frames for each file
8. Substitute values in test (y_test) and train (y_train) labels files with descriptions from activity_labels file, using lookup function from qdap package
9. Add data from subject_test and subject_train, as well as substituted labels (testlab & trainlab) to train (X_train) and test (X_test) data using cbind
10. Rename columns for train and test data using descriptions provided in features file
11. Combine train and test data using rbind
12. Extract measurements on the mean and standard deviation for each measurement (excluding those for meanFreq by using a regex word boundary (\..\b) for mean)
13. Creates a tidy data set with the average of each variable for each activity and each subject using melt function from reshape2 package
14. Rename variables/ columns for new dataset to indicate the 'average' data contained in the molten data frame
15. Create text file of new dataset for submission
16. Include extract from features file to describe variables used for original dataset for code book
17. Describe new variables used in new dataset for code book
18. Create .md file containing code book, including introductory text extracted from original data descriptions, as well as description of new variables
19. Document steps taken for README, and write to .md file
