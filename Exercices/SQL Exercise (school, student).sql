CREATE DATABASE sql_activity;
USE sql_activity;

CREATE TABLE school 
(school_id int, 
school_name char(50), 
city char(40));

INSERT INTO school (school_id, school_name, city)
VALUES 
(1, 'Stanford', 'Stanford'),
(2, 'University of Cali', 'San Francisco'),
(3, 'Harvard University', 'New York'),      
(4, 'MIT', 'Boston'),       
(5, 'Yale', 'New Haven');    

CREATE TABLE student 
(student_id int, student_name char(40), city char(40), school_id int);

INSERT INTO student (student_id, student_name, city, school_id)
VALUES
(1001, 'Peter Brebec', 'New York', 1),
(1002, 'John Goorgy', 'San Francisco', 2),
(2003, 'Brad Smith', 'New York', 3),
(1004, 'Fabian Johns', 'Boston', 5),
(1005, 'Brad Cameron', 'Stanford', 1),
(1006, 'Geoff Firby', 'Boston', 5),
(1007, 'Johnny Blue', 'New Haven',2),
(1008, 'Johse Brook', 'Miami', 2);

-- Write an SQL statement that lists school names, student names, and their cities
-- only if the school and the student are in the same city and the student is 
-- not from New York.

SELECT school_name, student_name, student.city FROM student
LEFT JOIN school as school
on student.school_id = school.school_id 
WHERE school.city = student.city
HAVING  student.city != 'New York'; 