-- "Hello World" of SQL -- SELECT all records from a table
SELECT * -- * means ALL COLUMNS
FROM actor;


-- Query specific columns - SELECT column_name, ... FROM table_name
SELECT last_name, first_name
FROM actor;


-- Filter Rows - use the WHERE clause - always come after the FROM 
SELECT *
FROM actor 
WHERE first_name = 'Nick';

-- Using the LIKE operator - allows for regex like patterns
SELECT *
FROM actor 
WHERE first_name LIKE 'Nick';

-- Use wilcards with LIKE - % acts as a multi-character wildcard
-- can be any number of characters (0-infinity) - zero or many [\w\s]*
SELECT *
FROM actor 
WHERE last_name LIKE 'M%';

SELECT *
FROM actor
WHERE first_name LIKE '%r%';


-- Underscore (_) represents 1 and only 1 character;
SELECT *
FROM actor 
WHERE first_name LIKE '_i_';

--Use in same pattern
SELECT *
FROM actor
WHERE last_name LIKE '_i%';


-- Using AND and OR in the WHERE Clause
-- OR - only one needs to be TRUE 
SELECT *
FROM actor 
WHERE first_name LIKE 'N%' OR last_name LIKE 'W%';

-- AND - all conditions need to be TRUE 
SELECT *
FROM actor 
WHERE first_name LIKE 'N%' AND last_name LIKE 'W%';

-- Comparing Operators in SQL:
-- Greater Than (>) - Less Than (<)
-- Greater Than or Equal (>=) -- Less Than or Equal (<=)
-- Equal (=) -- Not Equal (<>)

-- Explore data of new table with SELECT
SELECT *
FROM payment;

-- Query all payments greater than $4.00
SELECT customer_id, amount
FROM payment
WHERE amount > 4;

SELECT customer_id, amount 
FROM payment 
WHERE amount >= '2.99';

SELECT customer_id, amount
FROM payment 
WHERE amount <> 7.99; -- NOT EQUAL

SELECT customer_id, amount
FROM payment
WHERE amount <> 7.99;

-- Get all payments between $3 and $8 (inclusive)
SELECT *
FROM payment
WHERE amount >= 3 AND amount <= 8;

-- BETWEEN/AND clause
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8;


-- Order the rows that come back using the ORDER BY clause - ORDER BY col_nam (Default ASC, add DESC for descending)
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 5
ORDER BY payment_date;

SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 5
ORDER BY payment_date DESC; -- DESC will ORDER IN descending order


-- Order By works with strings (Alphabetically)
SELECT *
FROM actor 
ORDER BY last_name;


-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- take in a column_name as an argument and returns a single value 


-- Get the sum of all of the payments
SELECT SUM(amount)
FROM payment;

-- Aggregations with WHERE
SELECT SUM(amount)
FROM payment 
WHERE amount > 5;

-- Get the average payment amount
SELECT AVG(amount)
FROM payment
WHERE amount > 5;

-- Get the count of all payments
SELECT COUNT(*)
FROM payment;

SELECT COUNT(*)
FROM payment
WHERE amount > 5;

-- Get the min and max of payments - also alias the column name 
SELECT MIN(amount) AS lowest_amount_paid, MAX(amount) AS highest_amount_paid
FROM payment;

SELECT MAX(amount) AS highest_amount_paid
FROM payment;

-- Calculate a column based on two other columns 
SELECT payment_id, rental_id, payment_id - rental_id AS difference
FROM payment;


-- CONCAT - will concatenate strings together
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM actor;



-- GROUP BY CLAUSE
-- used with Aggregations

-- Query the number of payments per amount
SELECT COUNT(*)
FROM payment
WHERE amount = 1.99;

SELECT amount, COUNT(*), SUM(amount), AVG(amount)
FROM payment
GROUP BY amount;

-- columns selected from the table must also be used in the GROUP BY
SELECT amount, customer_id, COUNT(*)
FROM payment 
GROUP BY amount; --ERROR: column "payment.customer_id" must appear in the GROUP BY clause or be used in an aggregate function


-- Query the payment table to display the customers (by id) who have spent the most
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- Alias our aggregation column and use aliased name in ORDER BY
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC;


-- HAVING clause => HAVING is to GROUP BY/AGGREGATIONS as WHERE is to SELECT
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40
ORDER BY total_spent DESC;

SELECT customer_id, COUNT(*)
FROM payment 
GROUP BY customer_id 
HAVING COUNT(*) BETWEEN 20 AND 30;


-- LIMIT and OFFSET clause

-- LIMIT - limit the number of rows that are returned
SELECT *
FROM film
LIMIT 10;

-- OFFSET - start your rows after a certain amount of rows using OFFSET
SELECT *
FROM film
OFFSET 10; -- SKIP OVER THE FIRST 10 ROWS 

-- Put together
SELECT *
FROM film 
OFFSET 10
LIMIT 5;


-- Putting all the clauses into one query
-- Display customers 11-20 who have spent the most in under 20 payments and has a customer_id > 350

SELECT customer_id, SUM(amount) AS total_spent, COUNT(*)
FROM payment 
WHERE customer_id > 350
GROUP BY customer_id 
HAVING COUNT(*) < 20
ORDER BY total_spent DESC
OFFSET 10
LIMIT 10;


-- Syntax Order: (SELECT and FROM are the only mandatory keywords)
-- SELECT
-- FROM 
-- JOIN
-- ON 
-- WHERE 
-- GROUP BY 
-- HAVING 
-- ORDER BY 
-- OFFSET
-- LIMIT 