CREATE DATABASE publications;
USE publications;

SELECT pubs.pub_name, count(titles.title_id) AS Titles from publications.publishers pubs 
LEFT JOIN publications.titles titles ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;

SELECT *
FROM publications.employee emp 
LEFT JOIN publications.jobs job
ON emp.job_id = job.job_id 
UNION
SELECT *
FROM publications.employee emp
RIGHT JOIN publications.jobs job
ON emp.job_id = job.job_id;

SELECT pubs.pub_name,
COUNT(titles.title_id) AS Titles
FROM publications.publishers pubs
INNER JOIN publications.titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;
