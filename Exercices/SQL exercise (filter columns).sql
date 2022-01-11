CREATE DATABASE employees;
USE employees; 

CREATE TABLE employees.employees (`ID` int, `Name` char(50), `Role` char(50), `Salary` char(50));
INSERT INTO employees(`ID`, `Name`, `Role`, `Salary`) 
VALUES 
(2343, 'Alex', 'Manager',65000),
(2344, 'Sandra', 'IT Specialist',72000),
(2345, 'Sven','HR',44000),
(2346, 'Boris','Economist',47000);

SELECT * from employees
WHERE Salary >= 50000 and Salary <= 100000;

SELECT * from employees
WHERE Name LIKE 'S%';