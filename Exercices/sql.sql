use employees_mod;
DELIMITER $$
CREATE PROCEDURE emp1()
BEGIN
SELECT * FROM t_employees
LIMIT 1000;
END$$



CALL emp1();
