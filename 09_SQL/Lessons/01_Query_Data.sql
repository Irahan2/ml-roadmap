/* ==============================================================================
   SQL SELECT Basics
-------------------------------------------------------------------------------
   This reference demonstrates different ways of using SELECT to read data, 
   apply conditions, sort results, and perform aggregations.

   Outline:
     1. SELECT everything
     2. SELECT chosen fields
     3. Filtering with WHERE
     4. Sorting with ORDER BY
     5. Grouping data (GROUP BY)
     6. Filtering groups (HAVING)
     7. Removing duplicates (DISTINCT)
     8. Limiting rows (TOP)
     9. Combining result sets
    10. Extra useful tricks
=================================================================================
*/

/* ==============================================================================
   COMMENTS
=============================================================================== */

-- Single-line comment example

/* 
   Multi-line
   comment 
   example
*/

/* ==============================================================================
   SELECT ALL COLUMNS
=============================================================================== */

-- Get all columns for every customer
SELECT *
FROM customers;

-- Get all columns for every order
SELECT *
FROM orders;

/* ==============================================================================
   SELECT SPECIFIC COLUMNS
=============================================================================== */

-- Show only a customer's name, country, and score
SELECT 
    first_name,
    country,
    score
FROM customers;

/* ==============================================================================
   WHERE
=============================================================================== */

-- Customers whose score is not zero
SELECT *
FROM customers
WHERE score != 0;

-- Customers located in Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Only show name and country for German customers
SELECT
    first_name,
    country
FROM customers
WHERE country = 'Germany';


/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Get all customers and 
   order them by score from highest to lowest */
SELECT *
FROM customers
ORDER BY score DESC

/* Get all customers and 
   order them by score from lowest to highest */
SELECT *
FROM customers
ORDER BY score ASC

/* Get all customers and 
   order them alphabetically by country */
SELECT *
FROM customers
ORDER BY country ASC

/* Get all customers, sort first by country 
   and then by highest score within each country */
SELECT *
FROM customers
ORDER BY country ASC, score DESC

/* Show only name, country, and score 
   for customers with score not equal to 0, 
   sorted from highest to lowest score */
SELECT
    first_name,
    country,
    score
FROM customers
WHERE score != 0
ORDER BY score DESC

/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Calculate total score for each country
SELECT 
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country

/* This query fails because 'first_name' 
   is neither grouped nor aggregated */
SELECT 
    country,
    first_name,
    SUM(score) AS total_score
FROM customers
GROUP BY country

-- Get total score and total number of customers per country
SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country

/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score per country 
   but only return those above 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430

/* Exclude customers with score = 0, 
   then find average per country 
   and only show those above 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Get the list of unique countries
SELECT DISTINCT country
FROM customers

/* ==============================================================================
   TOP
=============================================================================== */

-- Return only 3 customers
SELECT TOP 3 *
FROM customers

-- Get the 3 customers with the highest scores
SELECT TOP 3 *
FROM customers
ORDER BY score DESC

-- Get the 2 customers with the lowest scores
SELECT TOP 2 *
FROM customers
ORDER BY score ASC

-- Show the 2 most recent orders
SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC

/* ==============================================================================
   All Together
=============================================================================== */

/* Find average score per country, 
   ignoring customers with score = 0, 
   return only those with avg > 430, 
   and order results from highest avg score down */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC

/* ============================================================================== 
   COOL STUFF - Extra SQL Features
=============================================================================== */

-- Run multiple queries at once
SELECT * FROM customers;
SELECT * FROM orders;

/* Selecting constants */
-- Select a fixed number without referencing a table
SELECT 123 AS static_number;

-- Select a fixed string value
SELECT 'Hello' AS static_string;

-- Add a constant value as a column in a query
SELECT
    id,
    first_name,
    'New Customer' AS customer_type
FROM customers;
