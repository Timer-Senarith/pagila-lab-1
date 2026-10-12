-- Q1
-- Row count: 486

SELECT
    title,
    rental_rate,
    replacement_cost
FROM film
WHERE replacement_cost > 20.00
ORDER BY replacement_cost DESC, title ASC;

-- Q2
-- Version A
-- Row count: 162

SELECT
    title,
    rating
FROM film
WHERE (rating = 'G' OR rating = 'PG-13') AND rental_duration >= 6;


-- Version B
-- Row count: 272

SELECT
    title,
    rating
FROM film
WHERE rating = 'G' OR rating = 'PG-13' AND rental_duration >= 6;

-- The row counts differ because SQL evaluates AND before OR.
-- In Version A, the rental duration condition applies to both G and PG-13 films.
-- In Version B, the rental duration condition applies only to PG-13 films,
-- while all G-rated films are returned.



-- Q3
-- Part 1: Films between 75 and 105 minutes long

SELECT
    title,
    length,
    rental_rate
FROM film
WHERE length BETWEEN 75 AND 105;


-- Part 2: Films rated G, PG, or PG-13

SELECT
    title,
    rating
FROM film
WHERE rating IN ('G', 'PG', 'PG-13');



-- Q4
-- Part 1: Film titles starting with AGENT

SELECT
    title
FROM film
WHERE title LIKE 'AGENT%';


-- Part 2: Actors whose first_name is exactly four characters long

SELECT
    first_name,
    last_name 
FROM actor
WHERE first_name LIKE '____';


-- Part 3: Film titles containing IRON anywhere

SELECT
    title
FROM film
WHERE title LIKE '%IRON%';



-- Q5
-- Part 1: Rentals where return_date is NULL

SELECT
    rental_id,
    customer_id
FROM rental
WHERE return_date IS NULL;


-- Part 2: Number of rentals with a non-NULL return_date

SELECT
    COUNT(*)
FROM rental
WHERE return_date IS NOT NULL;



-- Q6
-- Add a 10% surcharge to each payment and return the top 15

SELECT
    customer_id,
    amount AS payment_amount,
    amount * 1.10 AS amount_with_surcharge
FROM payment
ORDER BY amount_with_surcharge DESC
LIMIT 15;



-- Q7
-- Part 1: Unique film ratings

SELECT DISTINCT
    rating
FROM film
ORDER BY rating ASC;

-- Number of distinct ratings: 5


-- Part 2: Replace NULL address2 values with 'No unit'

SELECT
    address,
    address2,
    COALESCE(address2, 'No unit') AS unit
FROM address;



-- Q8

-- Error:
-- The WHERE clause is being misused because COUNT(*) is an aggregate function.
-- WHERE is evaluated before GROUP BY and before COUNT(*) is calculated, so the
-- rental_count does not exist yet when the WHERE clause is evaluated.
-- HAVING should be used because it filters results after grouping and aggregation.

SELECT
    customer_id,
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > 15
ORDER BY rental_count DESC;