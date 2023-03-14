-- 						  Question
--							 1
-- How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*)
FROM actor
WHERE last_name LIKE 'Wahlberg%'; -- 2


-- 						  Question
--					   	     2
-- How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99; -- 5,607


-- 						  Question
--					   	     3
-- What films have exactly 7 copies? (search in inventory)
SELECT title, count_inventory FROM (
	SELECT film_id, COUNT(film_id) count_inventory
	FROM inventory 
	GROUP BY film_id 
	HAVING COUNT(film_id) = 7
) id INNER JOIN film f ON id.film_id = f.film_id
ORDER BY title -- see title column


-- 						  Question
--					   	     4
-- How many customers have the first name ‘Willie’?
SELECT COUNT(*)
FROM customer
WHERE first_name  LIKE 'Willie%'; -- 2


-- 						  Question
--					   	     5
-- What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC
LIMIT 1; -- staff_id = 1


-- 						  Question
--					   	     6
-- How many unique district names are there?
SELECT COUNT(DISTINCT district) AS "Number of Unique Districs"
FROM address; -- 378 or 273 ???? I'll GO WITH 378
--
--
-- 						  Question
--					   	     7
-- What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id 
ORDER BY COUNT(actor_id) DESC
LIMIT 1; -- film_id = 15


-- 						  Question
--					   	     8
-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(*)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1
GROUP BY store_id; -- 13


-- 						  Question
--					   	     9
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(*)
FROM (
SELECT amount, COUNT(amount)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING COUNT(customer_id) > 250) subquery; -- 3


-- 						  Question
--					   	     10
-- Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT COUNT(DISTINCT rating)
FROM film; -- catagory count = 5

SELECT rating, COUNT(*) 
FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC 
LIMIT 1 -- PG-13 has most AT 223