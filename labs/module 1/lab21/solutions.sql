Use Publications;
## CHALLENGE 1 ##

## Auth ID, AU Last Name, AU First Name, Title, Publisher ## total row should equal total rows of authors table ##

SELECT * FROM publications.authors; ##au ID, First and last name 
SELECT * FROM publications.publishers; ## pub name
SELECT * From publications.titleauthor; ##title ID and au ID
SELECT * FROM publications.titles; ## title

SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM publications.authors 
LEFT JOIN publications.titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers
on titles.pub_id = publishers.pub_id;

## CHALLENGE 2 ##
SELECT authors.au_id, au_lname, au_fname, count(title) as count_titles, pub_name
FROM publications.authors 
LEFT JOIN publications.titleauthor 
on authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles
on titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers
on titles.pub_id = publishers.pub_id
GROUP BY au_lname, pub_name;

SELECT mycount, sum(mycount) as sumcount FROM (select count(title) as mycount FROM publications.titles) as s; ## result 18
SELECT * FROM publications.titles; ## 18 rows

## CHALLENGE 3 ##
SELECT  titleauth.au_id, au_lname, au_fname, sum(qty) as sum
FROM publications.authors as auth
LEFT JOIN publications.titleauthor as titleauth
on auth.au_id = titleauth.au_id
LEFT JOIN publications.titles as titles
on titleauth.title_id = titles.title_id
LEFT JOIN publications.sales as sales
on titleauth.title_id = sales.title_id
GROUP BY au_id
ORDER BY sum DESC
LIMIT 3;

## CHALLENGE 4 ##
SELECT au_lname, au_fname, auth.au_id, sum(qty) as sum
FROM publications.authors as auth
LEFT JOIN publications.titleauthor as titleauth
ON auth.au_id = titleauth.au_id
LEFT JOIN publications.sales as sales
on titleauth.title_id = sales.title_id
GROUP BY au_id
ORDER BY sum DESC;

