Composite indicator methodology

1/ Indicator definition
We decided to create : Primary Education Access Indicator to assess countries' situation on this domain in the world.
2/ Selection of Criterion
We selected 3 criteria for the PEAI calculation :

- School enrollment, primary (% net)
The net enrollment rate is the ratio between all students in the theoretical age group for primary education enrolled in that level and the total population in that age.

- Literacy rate, youth total (% of people ages 15-24)

- Primary school starting age (years)

- Compulsory year

3/ Standardization
We standardized on SQL the 3 criteria indicators according to this formula :
(Xi -Xmin) / (Xmax - Xmin)

Standardization methodology on mysql : 

1/ Create temporary table to stock min et max value of indicator

2/ Add 2 columns on the main table : valueMin and valueMax

3/ Update the min and max columns with values stocked in the temporary table

4/ Create the criteria_normalized_indicator column

5/ Update the criteria_normalized_indicator column with the following calculation :
(value - valueMin) / (valueMax - valueMin)

4/ Ponderation
We need to choose a ponderation for each criteria_normalized_indicator for the calculation of the Indicator.

- School enrollment, primary (% net) : ponderation = 2
- Literacy rate, youth total (% of people ages 15-24) :  ponderation = 3
- Primary school starting age (years) : ponderation = 1
- Compulsory year : Compulsory year = 2


5/ PEAI Calculation
Criteria1 * 2 + Criteria2 * 3 + Criteria3 + Criteria4 * 2

