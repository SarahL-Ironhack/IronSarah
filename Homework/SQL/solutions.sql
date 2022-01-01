CREATE database cancellation_rate;
USE cancellation_rate;

create TABLE users (user_id int, action char(50), date date); 
INSERT INTO users (user_id, action, date) VALUES (1, 'start', '2020-01-01');
INSERT INTO users (user_id, action, date) VALUES (1, 'cancel', '2020-02-01');
INSERT INTO users (user_id, action, date) VALUES (2, 'start', '2020-03-01');
INSERT INTO users (user_id, action, date) VALUES (2, 'publish', '2020-04-01');
INSERT INTO users (user_id, action, date) VALUES (2, 'cancel', '2020-05-01');
INSERT INTO users (user_id, action, date) VALUES (3, 'start', '2020-06-01');
INSERT INTO users (user_id, action, date) VALUES (3, 'cancel', '2020-07-01');
INSERT INTO users (user_id, action, date) VALUES (4, 'start', '2020-08-01');

-- 1. From the following table of user IDs, actions, and dates, write a query to return the publication and cancellation rate for each user.
SELECT * FROM users;
SELECT user_id, (sum( action = 'publish')/sum(action = 'start')) as publish_rate, (sum(action = 'cancel')/sum(action = 'start')) as cancel_rate from users
group by user_id;

-- 2. Time difference between latest actions
CREATE TABLE time_diff (user_id int, action char(20), action_date date);
INSERT INTO time_diff (user_id, action, action_date)
VALUES  (1, 'start', '2020-02-12'),
 (1, 'cancel', '2020-02-13'),
 (2, 'start', '2020-02-11'),
 (2, 'publish', '2020-02-14'),
 (3, 'start', '2020-02-15'),
 (3, 'cancel', '2020-02-15'),
 (4, 'start', '2020-02-18'),
 (1, 'publish', '2020-02-19');

WITH users (user_id, action, action_date) AS 
(VALUES ROW(1, 'start', CAST('2020-2-12' AS date)), 
ROW(1, 'cancel', CAST('2020-2-13' AS date)), 
ROW(2, 'start', CAST('2020-2-11' AS date)), 
ROW(2, 'publish', CAST('2020-2-14' AS date)), 
ROW(3, 'start', CAST('2020-2-15' AS date)), 
ROW(3, 'cancel', CAST('2020-2-15' AS date)), 
ROW(4, 'start', CAST('2020-2-18' AS date)), 
ROW(1, 'publish', CAST('2020-2-19' AS date))),
ranked AS (
SELECT *, row_number() OVER (PARTITION by user_id ORDER BY action_date DESC) AS date_rank
FROM users ),

latest AS (
SELECT *
FROM ranked 
WHERE date_rank = 1 ),

next_latest AS (
SELECT *
FROM ranked
WHERE date_rank = 2 )

SELECT l1.user_id, 
        l1.action_date - l2.action_date AS days_elapsed
FROM latest l1
LEFT JOIN next_latest l2
ON l1.user_id = l2.user_id
ORDER BY 1;


-- 3. Create an SQL query that shows the TOP 3 authors who sold the most books in total 
CREATE TABLE authors (author_name char(50), book_name char(50));
INSERT INTO authors (author_name, book_name)
VALUES ('author_1', 'book_1'),
('author_1', 'book_2'), 
('author_2', 'book_3'), 
('author_2', 'book_4'), 
('author_2', 'book_5'), 
('author_3', 'book_6');
CREATE TABLE books (book_name char(50), sold_copies char(40));
INSERT INTO books (book_name, sold_copies)
VALUES ('book_1', 1000),
('book_2', 1500), 
('book_3', 34000), 
('book_4', 29000), 
('book_5', 40000), 
('book_6', 4400);

SELECT author_name, sum(sold_copies) as total_sold from authors
LEFT JOIN books as books
on authors.book_name = books.book_name
GROUP BY author_name
ORDER by total_sold DESC
Limit 3;

-- 4. Show every department where the average salary per employee is lower than $500

CREATE TABLE employees (department_name char(50), employee_id int, employee_name char(50));
INSERT INTO employees (department_name, employee_id, employee_name)
VALUES ('Sales', 123, 'John Doe'),
('Sales',211, 'Jane Smith'),
('HR',556, 'Billy Bob'),
('Sales',711,'Robert Hayek'),
('Marketing',235,'Edward Jorgson'),
('Marketing', 236, 'Christine Packard');

CREATE TABLE salaries (salary int, employee_id int, employee_name char(50));
INSERT INTO salaries (salary, employee_id, employee_name)
VALUES (500,123,'John Doe'),
(600,211,'Jane Smith'),
(1000,556,'Billy Bob'),
(400,711,'Robert Hayek'),
(1200,235,'Edward Jorgson'),
(200,236,'Christine Packard');

-- dept where average salary per employee lower than $500
SELECT department_name, avg(salary) as average_salary
FROM employees
JOIN salaries as salaries
on employees.employee_id = salaries.employee_id
group by department_name
HAVING avg(salary) <= 500;