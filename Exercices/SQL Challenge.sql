CREATE DATABASE SQL_assignment;
USE SQL_assignment;

CREATE TABLE users(Name char(50), date_joined char(50));
CREATE TABLE purchases(Name char(50), date_joined char(50), item char(100), price float);

INSERT INTO sql_assignment.users VALUES ("John", "2011-01-01"), ("Dave", "2009-04-02"), ("Mary", "2008-03-04");
INSERT INTO sql_assignment.purchases VALUES("John", "2011-02-04", "SK2341", 34.54), ("John", "2012-01-04", "LS2414", 94.98);

-- Part 1 --
-- question 1
SELECT uses.name, sum(expes.price) as EXPENCES
FROM sql_assignment.users uses
LEFT JOIN sql_assignment.purchases expes
ON uses.Name = expes.Name
GROUP BY uses.name;


-- question 2
ALTER TABLE sql_assignment.purchases
MODIFY COLUMN date_joined date;
SELECT item, month(date_joined), count(date_joined) FROM sql_assignment.purchases
GROUP BY month(date_joined);

-- Part 2 --
-- question 1

CREATE TABLE employees(employee_id int, manager_id int, emplyoyee_name varchar(100));
INSERT INTO sql_assignment.employees VALUES (1,2, "Jane"), (2,3,"Henry"), (3,null, "Kate"), (4,2,"Moe"),(5,2,"Larry");

SELECT emplyoyee_name, manager_id,
CASE WHEN manager_id = "3" THEN "Kate"
WHEN manager_id = "2" THEN "Henry"
ELSE null
END
FROM sql_assignment.employees;
