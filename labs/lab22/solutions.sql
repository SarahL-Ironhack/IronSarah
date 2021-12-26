-- CHALLENGE 1 -- 
-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
-- Step 2: Aggregate the total royalties for each title and author
-- Step 3: Calculate the total profits of each author


SELECT au_id, sum(advance * royaltyper /100) as adv,  sum(price *qty * royalty/100 * royaltyper / 100) as roy
FROM publications.titleauthor as titleauth
JOIN titles as titles on titles.title_id = titleauth.title_id
JOIN sales as sales on sales.title_id = titles.title_id
GROUP BY au_id
ORDER BY roy desc
LIMIT 3;

-- Challenge 2 - Alternative Solution
CREATE TEMPORARY TABLE royalties_advance
SELECT au_id, sales.title_id, (advance*royaltyper/100) as advance_calc, (price * qty* royalty/100* royaltyper/100) as royalties
FROM publications.titleauthor as titleauth
JOIN titles as titles on titles.title_id = titleauth.title_id
JOIN sales as sales on sales.title_id = titles.title_id;

CREATE TEMPORARY TABLE sum_roy_adv
SELECT au_id,  sum(advance_calc) as adv , sum(royalties) as roy FROM royalties_advance 
GROUP BY au_id ;

SELECT au_id, (adv + roy) as profits FROM sum_roy_adv
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

-- Challenge 3
CREATE TABLE most_profiting_authors 
SELECT au_id, (adv + roy) as profits FROM sum_roy_adv;

SELECT * FROM most_profiting_authors
ORDER BY au_id;



