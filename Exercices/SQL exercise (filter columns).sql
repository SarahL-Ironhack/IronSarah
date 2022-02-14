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

CREATE TABLE employees.customers (CustomerID int, CustomerName char(40), Age int, City char(40), Country char(40));
INSERT INTO customers (CustomerID, CustomerName, Age, City, Country)
VALUES
(1, 'Christina' ,40, 'London', 'United Kingdom'),
(2, 'Maria Anders', 56, 'Berlin', 'Germany'),
(3, 'Matthew', 34, 'Luleå', 'Sweden'),
(4, 'Alen',51, 'Berlin', 'Germany'),
(5, 'Jacob', 28, 'México D.F', 'Mexico'),
(6, 'Aastha', 26, 'Chandigarh', 'India'),
(7, 'Joshua', 21, 'México D.F', 'Mexico');

SELECT country, COUNT(*) as No_cust
FROM customers
GROUP BY country
HAVING No_cust > 1;


CREATE TABLE emp2 (Employee_id int, First_name char(40), Last_name char(40), Salary int, Joining_date date, Departement char(40));
INSERT INTO emp2 (Employee_id, First_name, Last_name, Salary, Joining_date, Departement)
VALUES (1, 'Bob', 'Kinto', 1000000, '2019-01-20', 'Finance'),
(2, 'Jerry', 'Kansxo', 6000000, '2019-01-15', 'IT'),
(3, 'Philip','Jose', 8900000, '2019-02-05', 'Banking'),
(4, 'John', 'Abraham', 2000000, '2019-02-25','Insurance'),
(5, 'Michael', 'Mathew', 2200000, '2019-02-28', 'Finance'),
(6, 'Alex', 'chreketo', 4000000, '2019-05-1', 'IT'),
(7, 'Yohan', 'Soso' , 1230000, '2019-06-20', 'Banking');

SELECT count(departement) as depcount, Departement FROM emp2
GROUP BY Departement
HAVING depcount = 1;

ALTER TABLE emp2
ADD COLUMN email char(50);
update emp2 set email=CONCAT(Left(First_name,1),'.',Last_name,'@company.com')
where email IS NULL;

SELECT POSITION('l' IN First_name) AS position_l
FROM emp2;

CREATE TABLE recap (EmpId int, FullName char(40), ManagerId int, DateOfJoining date, City char(40));
INSERT INTO recap (EmpId, FullName, ManagerId, DateOfJoining, City)
VALUES
(121, 'John Snow', 321, '2014-01-31', 'Toronto'),
(321, 'Walter White', 986, '2015-01-30', 'California'),
(421, 'Kuldeep Rana', 876, '2016-11-27', 'New Delhi');

SELECT * FROM (
SELECT *, ROW_NUMBER() OVER () as row_num FROM recap) t
WHERE t.row_num %2 =1 ;