USE employees_mod;

DELIMITER $$
CREATE PROCEDURE gender_avg(IN param_1 float, in param_2 float)
BEGIN 
SELECT dept_name, gender, avg(salary) as average_salary FROM t_salaries
JOIN t_employees empl
on empl.emp_no = t_salaries.emp_no
JOIN t_dept_emp dept
on empl.emp_no = dept.emp_no
JOIN t_departments departments
on dept.dept_no = departments.dept_no
WHERE salary BETWEEN param_1 AND param_2
GROUP BY dept_name, gender;
END $$ 

DELIMITER ;

call gender_avg(50000, 600000);

DROP PROCEDURE gender_avg;