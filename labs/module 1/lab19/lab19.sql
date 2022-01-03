SELECT * FROM olist.order_items;
SELECT price FROM olist.order_items 
ORDER BY price DESC; 
SELECT price FROM olist.order_items 
ORDER BY price ASC;

SELECT shipping_limit_date FROM olist.order_items
ORDER BY shipping_limit_date ASC;

SELECT customer_state, count(customer_unique_id) FROM olist.customers
GROUP BY customer_state
ORDER BY count(customer_unique_id) DESC;

SELECT customer_state, customer_city, count(customer_unique_id) from olist.customers
WHERE customer_state = 'SP'
Group by customer_city
order by count(customer_unique_id) DESC;

SELECT business_segment, count(business_segment) from olist.closed_deals
WHERE business_segment is not Null
group by business_segment;

SELECT business_segment, sum(declared_monthly_revenue) from olist.closed_deals
WHERE declared_monthly_revenue > 0 
GROUP BY business_segment
ORDER BY sum(declared_monthly_revenue) DESC
LIMIT 3;


SELECT review_score, count(DISTINCT review_id) FROM olist.order_reviews
group by review_score;

ALTER TABLE olist.order_reviews
ADD review_desc text FIRST;
UPDATE olist.order_reviews SET review_desc = 'bad' WHERE review_score = 1;
UPDATE olist.order_reviews SET review_desc = 'must do better' WHERE review_score = 2;
UPDATE olist.order_reviews SET review_desc = 'medium' WHERE review_score = 3;
UPDATE olist.order_reviews SET review_desc = 'good' WHERE review_score = 4;
UPDATE olist.order_reviews SET review_desc = 'excellent' WHERE review_score = 5;

SELECT count(review_desc), review_desc, review_score FROM olist.order_reviews
GROUP BY review_desc
ORDER BY count(review_desc) DESC
LIMIT 1;

SELECT review_desc, count(review_desc) FROM olist.order_reviews
GROUP BY review_desc
ORDER BY count(review_desc) DESC
LIMIT 1;

