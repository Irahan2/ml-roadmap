/* =================================================================================
   SQL Data Definition Language (DDL)
---------------------------------------------------------------------------------
   This document demonstrates the fundamental DDL statements that define and 
   manage database objects such as tables.

   Outline:
     1. CREATE - Define new tables
     2. ALTER  - Change table schema
     3. DROP   - Remove tables from the database
================================================================================= 
*/

/* =================================================================================
   CREATE
================================================================================ */

/* Build a table named persons 
   including the fields: id, person_name, birth_date, and phone */
CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
)

/* =================================================================================
   ALTER
================================================================================ */

-- Insert a new column called email into the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

-- Delete the phone column from the persons table
ALTER TABLE persons
DROP COLUMN phone

/* =================================================================================
   DROP
================================================================================ */

-- Completely remove the persons table from the schema
DROP TABLE persons
