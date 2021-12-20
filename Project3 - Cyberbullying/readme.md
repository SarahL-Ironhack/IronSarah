Dataset : Cyberbullying on social media 

Step by step of how we cleaned the dataster

Step 1: Importing necessary libraries and the dataset on Jupyter.

Step 2: Use .describe() to visualize the data set and drop columns with non changing data

Step 3: Find and clean columns that have no values using the isnull sum
5 columns had NA values:
- SenderLocation : decided to drop the column because the information did not seem relevant for our analysis
- IsSelfMentioned : same
- Retweets# : missing values filled with 0
- AvgWordLength : calculated in a function thanks to the Text column 
- SenderFollowers# : filled with mean value of 131 
- Emojis#: filled with mean value

Step 4: search for duplicates - none found

Step 5: clean outliers 

Using IQR to drop outliers :
- We chose to keep the rows that have less than 18 followers in order to have a coherent sample . By doing this, we managed to clear outlier for several columns at a time .
- For senderfollowings, cleaning outliers by dropping rows that have more than 1910 

Using graphs to visualize other outliers and delete them

Step6 : drop columns we are not going to use
'Punctuations#','Letter#', 'Symbols#','UpperCaseLetter#'

Step 7: Encode labels 
Columns IsCyberbullying True/False

Step 8: Export data to CSV

Step 9: connect Python to MySQL and export data directly to mysql using Python 



