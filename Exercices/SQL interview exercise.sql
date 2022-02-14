CREATE DATABASE training;
Use training;
CREATE TABLE Employees (ID int, Name char(40), Performance int, Salary int);
INSERT INTO employees
Values (1021, 'Mary', 12, 5000),
(1023, 'John',14, 5300), 
(1043, 'Rayan', 21, 6000),
(1047, 'Silver', 34, 6200), 
(1054, 'Jerom', 17, 6000),
(1061, 'Tom', 49, 5000);

SELECT Salary FROM employees
ORDER BY Salary DESC
LIMIT 4,1;

SELECT Salary FROM employees
ORDER BY Salary DESC
LIMIT 5,5;

CREATE TABLE db_employee (Id int, First_name varchar(40), Last_name varchar(40), Salary int, Department_id int);
CREATE TABLE db_dept (Id int, Department varchar(40));

Insert into db_employee
values
(1, 'Testa', 'Rossa', 50000, 1),
(2, 'John', 'Doe', 60000, 2);
Insert into db_dept 
values
(1, 'Marketing'),
(2, 'Engineering');


# Write a query that calculates the difference between the highest salaries found in the marketing and 
# engineering departments. Output just the absolute difference in salaries.

DELIMITER $$
CREATE FUNCTION calculate_max(dept_id int)
RETURNS decimal
DETERMINISTIC
BEGIN
	DECLARE max_salary int;
        select max(e.Salary) into max_salary
        from db_employee e
		join db_dept d
		on e.Department_id = d.Id
        where dept_id = d.Id;
RETURN max_salary;
END$$
select abs(calculate_max(1) - calculate_max(2))

 