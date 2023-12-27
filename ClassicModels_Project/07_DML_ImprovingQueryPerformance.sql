SHOW DATABASES;
USE classicmodels;

SHOW TABLES;

--  *** Adding an INDEX ***
-- Add an index on the lastName column of the customers table.
CREATE INDEX customer_lastname_index ON customers (contactLastName);

SHOW INDEX 
FROM customers; -- show table existing indexes

-- Query
SELECT * FROM customers WHERE contactLastName="Lee";

-- Order
SELECT * 
FROM customers 
ORDER BY contactLastName 
LIMIT 10;


--  *** Creating a VIEW ***

-- creala
CREATE VIEW usaCustomers 
AS (
    SELECT * 
    FROM customers 
    WHERE country='USA'
);

-- query de la view
SELECT * 
FROM usaCustomers 
WHERE state="CA"; 