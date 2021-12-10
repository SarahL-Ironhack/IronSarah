create database applestore;
SELECT * FROM applestore.applestore;
SELECT prime_genre FROM applestore.applestore GROUP BY prime_genre;

SELECT prime_genre, sum(rating_count_tot) FROM applestore.applestore 
GROUP BY prime_genre
order by sum(rating_count_tot) DESC
LIMIT 1;


SELECT prime_genre,COUNT(ï»¿id) FROM applestore.applestore
GROUP BY prime_genre
ORDER BY COUNT(ï»¿id) DESC
LIMIT 1;

SELECT prime_genre, COUNT(ï»¿id) FROM applestore.applestore
GROUP BY prime_genre
ORDER BY COUNT(ï»¿id) ASC
LIMIT 1;

SELECT track_name, rating_count_tot FROM applestore.applestore
ORDER BY rating_count_tot DESC
LIMIT 10;

SELECT track_name, user_rating FROM applestore.applestore
ORDER BY user_rating DESC
LIMIT 10;

SELECT track_name, user_rating, rating_count_tot FROM applestore.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

SELECT price, user_rating, rating_count_tot FROM applestore.applestore
ORDER BY price DESC;
SELECT price, user_rating, rating_count_tot FROM applestore.applestore
ORDER BY rating_count_tot DESC;

