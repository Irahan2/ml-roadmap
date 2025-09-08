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
