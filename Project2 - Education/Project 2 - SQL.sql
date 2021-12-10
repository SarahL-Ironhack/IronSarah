CREATE DATABASE education;
USE education;

ALTER TABLE	ageprimary RENAME COLUMN `SE.PRM.AGES` to Age_at_first_year;
ALTER TABLE	compulsory_year RENAME COLUMN `SE.COM.DURS` to Number_of_obligatory_years;
ALTER TABLE	literacy RENAME COLUMN `SE.ADT.1524.LT.ZS` to `Literacy_rate_16-24`;
ALTER TABLE	pop_total RENAME COLUMN `SP.POP.TOTL` to Total_population;
ALTER TABLE	primaryaccess RENAME COLUMN `SE.PRM.NENR` to Primary_enrollment_rate;
ALTER TABLE	secondaryattainment RENAME COLUMN `SE.SEC.CUAT.UP.ZS` to Secondary_completed;
ALTER TABLE	`0_14_on_pop` RENAME COLUMN `SP.POP.0014.TO.ZS` to Population_aged_under_14;

CREATE TABLE Countries2 as
SELECT id,name,capitalCity, Total_population FROM pop_total pop
LEFT JOIN education.country count ON pop.economy = count.id ;

ALTER TABLE Countries2 ADD COLUMN Population_aged_under_14 TINYINT UNSIGNED DEFAULT 0;
UPDATE  Countries2 C1
INNER JOIN `0_14_on_pop` C2 ON C1.id = C2.economy
SET C1.Population_aged_under_14 = C2.Population_aged_under_14 +0;
select * from Countries2;

SELECT * FROM `0_14_on_pop`;
ALTER TABLE 0_14_on_pop
ADD COLUMN `Normalized` char(50) AFTER `Population_aged_under_14`;

delete from secondaryattainment where secondary_completed='';
delete from primaryaccess where Primary_enrollment_rate='';
delete from pop_total where Total_population='';
delete from literacy where `Literacy_rate_16-24`='';
delete from country where region='';
Alter table country
drop column aggregate,
drop column longitude,
drop column latitude,
drop column region,
drop column adminregion,
drop column lendingType,
drop column incomeLevel,
drop column capitalCity;
delete from compulsory_year where Number_of_obligatory_years='';
delete from ageprimary where Age_at_first_year='';
delete from `0_14_on_pop` where Population_aged_under_14='';

--- DATA NORMALIZATION ---
CREATE TEMPORARY TABLE ageprimaryM SELECT min(Age_at_first_year) minAge, max(Age_at_first_year) maxAge FROM ageprimary;
#Add 2 columns on the main table : ageMin and ageMax
ALTER TABLE ageprimary ADD COLUMN ageMin int;
ALTER TABLE ageprimary ADD COLUMN ageMax int;
#update the min and max columns with values stocked in the temp table
UPDATE ageprimary SET ageMin = (SELECT minAge FROM ageprimaryM);
UPDATE ageprimary SET ageMax = (SELECT maxAge FROM ageprimaryM);
#create the Indicator column
ALTER TABLE ageprimary ADD COLUMN Indicator_ageprimary text;
# Normalization calculation
SELECT economy, (Age_at_first_year - ageMin)/(ageMax - ageMin) as Indicator
FROM ageprimary;
Update ageprimary set Indicator_ageprimary = (Age_at_first_year- ageMin)/(ageMax - ageMin);


--- Data Normalization -- -
CREATE TEMPORARY TABLE `0_14_on_popM` 
SELECT min(Population_aged_under_14) minPop, max(Population_aged_under_14) maxPop 
FROM `0_14_on_pop` 
WHERE Population_aged_under_14 != 0;
#Add 2 columns on the main table : ageMin and ageMax
ALTER TABLE `0_14_on_pop` ADD COLUMN popMin char(50);
ALTER TABLE `0_14_on_pop` ADD COLUMN popMax char(50);
#update the min and max columns with values stocked in the temp table
UPDATE `0_14_on_pop` SET popMin = (SELECT minPop FROM `0_14_on_popM`);
UPDATE `0_14_on_pop` SET popMAx = (SELECT maxPop FROM `0_14_on_popM`);
#create the Indicator column
ALTER TABLE `0_14_on_pop` ADD COLUMN Indicator_population text;
# Normalization calculation
SELECT economy, (Population_aged_under_14 - popMin)/(popMax - popMin) as Indicator
FROM 0_14_on_pop;

SELECT min(Population_aged_under_14) FROM 0_14_on_pop;


--- Data Normalization ---
CREATE TEMPORARY TABLE AccessM SELECT min(Primary_enrollment_rate) minAccess, max(Primary_enrollment_rate) maxAccess FROM primaryaccess;
ALTER TABLE primaryaccess ADD COLUMN accessMin varchar(50);
ALTER TABLE primaryaccess ADD COLUMN accessMax varchar(50);
UPDATE primaryaccess SET accessMin = (SELECT minAccess FROM AccessM);
UPDATE primaryaccess SET accessMax = (SELECT maxAccess FROM AccessM);
ALTER TABLE primaryaccess ADD COLUMN Indicator_access text;
SELECT economy, (Primary_enrollment_rate - accessMin)/(accessMax - accessMin) as Indicator FROM primaryaccess ;
Update primaryaccess set Indicator_access = (Primary_enrollment_rate- accessMin)/(accessMax - accessMin);

DROP TABLE compulsory_yearM;
--- Data Normalization ---
CREATE TEMPORARY TABLE compulsory_yearM SELECT min(Number_of_obligatory_years) minNum, max(Number_of_obligatory_years) maxNum FROM compulsory_year;
#Add 2 columns on the main table : ageMin and ageMax
ALTER TABLE compulsory_year ADD COLUMN numMin char(50);
ALTER TABLE compulsory_year ADD COLUMN numMax char(50);
#update the min and max columns with values stocked in the temp table
UPDATE compulsory_year SET numMin = (SELECT minNum FROM compulsory_yearM);
UPDATE compulsory_year SET numMAx = (SELECT maxNum FROM compulsory_yearM);
#create the Indicator column
ALTER TABLE compulsory_year ADD COLUMN Indicator_year text;
# Normalization calculation
SELECT economy, (Number_of_obligatory_years - numMin)/(numMax - numMin) as Indicator
FROM compulsory_year;
Update compulsory_year set Indicator_year = (Number_of_obligatory_years- numMin)/(numMax - numMin);


SELECT * FROM compulsory_year;

--- DATA NORMALIZATION ---
CREATE TEMPORARY TABLE literacyM SELECT min(`Literacy_rate_16-24`) minLiteracy, max(`Literacy_rate_16-24`) maxLiteracy FROM literacy;
ALTER TABLE literacy ADD COLUMN literacyMin char(50);
ALTER TABLE literacy ADD COLUMN literacyMax char(50);
UPDATE literacy SET literacyMin = (SELECT minLiteracy FROM literacyM);
UPDATE literacy SET literacyMax = (SELECT maxLiteracy FROM literacyM);
ALTER TABLE literacy ADD COLUMN Indicator_literacy text;
SELECT economy, (`Literacy_rate_16-24`- literacyMin)/(literacyMax - literacyMin) as Indicator
FROM literacy;
Update literacy set Indicator_literacy = (`Literacy_rate_16-24`- literacyMin)/(literacyMax - literacyMin);

--- JOINING TABLES ---
select countries2.name, countries2.Total_population, ROUND(2* primaryaccess.Indicator_access + 3* literacy.Indicator_literacy + ageprimary.Indicator_ageprimary + 2* compulsory_year.Indicator_year,2) as PEAI, Round(Indicator_access,2) as Indicator_access, Indicator_ageprimary, Round(Indicator_literacy,2) as Indicator_literacy, Round(Indicator_year,2) as Indicator_year
from compulsory_year
inner join primaryaccess on compulsory_year.economy = primaryaccess.economy
inner join literacy on compulsory_year.economy = literacy.economy
inner join ageprimary on compulsory_year.economy = ageprimary.economy
left join countries2 on compulsory_year.economy = countries2.id
ORDER BY 3 DESC;


