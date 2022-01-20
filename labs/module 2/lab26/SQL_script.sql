USE employees_mod;

#2. Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE PROCEDURE avg_sal()
BEGIN
SELECT avg(salary) as average_salary FROM t_salaries
LIMIT 1000;
END$$

DELIMITER ;

CALL avg_sal();

DROP Procedure emp_info;
# 3. Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info (in frst varchar(14), in lst varchar(16))
BEGIN
SELECT first_name, last_name,emp_no FROM t_employees
WHERE first_name = frst AND last_name = lst;

END $$

DELIMITER ;
#4. Call the procedures

CALL emp_info('Mary','Sluis');

# 5. Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
# and returns the salary from the newest contract of that employee. 
# Hint: In the BEGIN-END block of this program, you need to declare and use two variables – 
# v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

DROP FUNCTION emp_info;
DELIMITER $$ 
CREATE FUNCTION emp_info (frst varchar(14), lst varchar(16) ) 
RETURNS int  DETERMINISTIC 
BEGIN 
	DECLARE v_max_from_date date;
    DECLARE v_salary DECIMAL(10,2);


	SELECT max(from_date) INTO v_max_from_date from t_employees employees
    JOIN t_salaries salary
    ON employees.emp_no = salary.emp_no
	WHERE last_name = lst AND first_name = frst;
    
    SELECT salary INTO v_salary FROM t_employees employees
    JOIN t_salaries salary ON employees.emp_no = salary.emp_no
	WHERE employees.first_name = frst
    AND employees.last_name = lst
    AND salary.from_date = v_max_from_date;
	
        
	RETURN v_salary ;
END$$ 
DELIMITER ; 

SELECT emp_info('Saniya','Kalloufi');

# 6.Create a trigger that checks if the hire date of an employee is higher than the current date. 
# If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

DELIMITER $$

CREATE TRIGGER hire_date
BEFORE INSERT ON t_salaries
FOR EACH ROW
BEGIN 
	IF NEW.from_date > CURRENT_DATE() THEN 
		SET NEW.from_date = CURRENT_DATE; 
	END IF; 
END $$

DELIMITER ;

# testing trigger 
INSERT INTO t_salaries 
VALUES (999999, 123555, '22-02-20', '23-02-20');
SELECT * FROM t_salaries
WHERE emp_no = 999999;

# 7. Drop the ‘i_hire_date’ index. (but create it before!)
CREATE INDEX i_hire_date on t_departments (dept_no);
DROP INDEX i_hire_date on t_departments;

#8. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum. 
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of 
# the same SELECT statement.

SELECT * FROM t_salaries
WHERE salary > 89000 ;
CREATE INDEX sal_over_89 on t_salaries (salary);

#9. Use  CASE statement and obtain a result set containing the employee number, first name, and last name 
#of all employees with a number higher than 109990. Create a fourth column in the query, indicating 
# whether this employee is also a manager, according to the data provided in the dept_manager table, 
# or a regular employee.

SELECT empl.emp_no, first_name, last_name, 
CASE WHEN dept_no IS NULL THEN 'This person is not a manager'
WHEN dept_no IS NOT NULL THEN 'This person is a manager'
ELSE 'Something went wrong'
END AS Manager
FROM t_employees empl
LEFT JOIN t_dept_manager manager
ON empl.emp_no = manager.emp_no
WHERE empl.emp_no > 109990;

#10. Extract a dataset containing the following information about the managers: employee number, 
# first name, and last name. Add two columns at the end – one showing the difference between the maximum 
# and minimum salary of that employee, and another one saying whether this salary raise was higher than 
# $30,000 or NOT.

SELECT manager.emp_no, first_name, last_name, 
CASE WHEN manager.emp_no is not null THEN  max(salary)-min(salary)
ELSE 'Something went wrong'
END AS Salary_difference,
CASE WHEN max(salary)-min(salary) > 30000 THEN 'Raise higher than $30,000'
ELSE 'No raise higher than $30,000'
END AS Raise
FROM t_dept_manager manager
LEFT JOIN t_employees empl on manager.emp_no = empl.emp_no
LEFT JOIN t_salaries salaries on salaries.emp_no = manager.emp_no
GROUP BY emp_no;

SELECT * FROM t_dept_manager;

# 11. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth 
#column, called “current_employee” saying “Is still employed” if the employee is still working in the 
# company, or “Not an employee anymore” if they aren’t. Hint: You’ll need to use data from both the 
# ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT employees.emp_no, first_name, last_name,
CASE WHEN to_date = '9999-01-01' THEN 'Is still employed'
ELSE 'Not an employee anymore'
END AS 'Current employee' 
FROM t_employees employees
JOIN t_dept_emp dept ON employees.emp_no = dept.emp_no
ORDER BY emp_no
LIMIT 100;

SELECT * FROM t_dept_emp;