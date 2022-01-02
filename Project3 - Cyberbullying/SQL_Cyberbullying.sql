CREATE DATABASE project3;
USE project3;
SELECT * from project3.project_dataframe;

-- Table 1: identify accounts that have several tweets referenced as Cyberbullying
SELECT count(IsCyberbullying_encode) from project_dataframe
WHERE IsCyberbullying_encode = 1;
SELECT Id, count(IsCyberbullying_encode) as number_cyberbullying from project_dataframe
group by ID
order by number_cyberbullying DESC;

-- Table 2: count number or tweets that are Cyberbullying, and group them in the seniority of the account
SELECT Id,SenderAccountYears,count(IsCyberbullying_encode) as number_cyberbullying from project_dataframe
WHERE IsCyberbullying_encode = 1
group by SenderAccountYears
order by 
	SenderAccountYears ASC,
    number_cyberbullying DESC;

-- Table3: Identifying the average word length in Tweets referenced as Cyberbullying 
SELECT avg(AvgWordLength) from project_dataframe
WHERE IsCyberbullying_encode = 1;
