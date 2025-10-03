/* ==============================================================================
   SQL Data Manipulation Language (DML)
-------------------------------------------------------------------------------
   This reference demonstrates the core DML operations that let you add, modify, 
   and remove data stored in relational database tables.

   Outline:
     1. INSERT - Add new rows
     2. UPDATE - Edit existing rows
     3. DELETE - Remove rows
=================================================================================
*/

/* ============================================================================== 
   INSERT
=============================================================================== */
-- #1 Style: Using VALUES to add data manually
-- Insert a couple of new entries into the customers table
INSERT INTO customers (id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100)

-- Example of wrong column alignment
INSERT INTO customers (id, first_name, country, score)
VALUES 
    (8, 'Max', 'USA', NULL)
    
-- Example with incorrect data types
INSERT INTO customers (id, first_name, country, score)
VALUES 
	('Max', 9, 'Max', NULL)

-- Proper insert with all fields filled
INSERT INTO customers (id, first_name, country, score)
VALUES (8, 'Max', 'USA', 368)

-- Insert without column names (not best practice)
INSERT INTO customers 
VALUES 
    (9, 'Andreas', 'Germany', NULL)
    
-- Insert using only a subset of fields (others default to NULL or defaults)
INSERT INTO customers (id, first_name)
VALUES 
    (10, 'Sahra')

-- #2 Style: INSERT with SELECT - copy records from one table to another
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'Unknown'
FROM customers

/* ============================================================================== 
   UPDATE
=============================================================================== */

-- Update the score for the customer with id 6
UPDATE customers
SET score = 0
WHERE id = 6

-- Update multiple fields at once (id = 10)
UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10

-- Replace all NULL scores with zero
UPDATE customers
SET score = 0
WHERE score IS NULL

-- Check results of the update
SELECT *
FROM customers
WHERE score IS NULL

/* ============================================================================== 
   DELETE
=============================================================================== */

-- Preview which rows will be deleted (ids greater than 5)
SELECT *
FROM customers
WHERE id > 5

-- Delete rows where id is greater than 5
DELETE FROM customers
WHERE id > 5

-- Remove all rows from persons table
DELETE FROM persons

-- TRUNCATE is faster than DELETE for clearing entire tables
TRUNCATE TABLE persons
