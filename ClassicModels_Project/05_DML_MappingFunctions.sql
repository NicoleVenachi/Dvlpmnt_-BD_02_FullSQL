SHOW DATABASES;

USE classicmodels;

-- *** Mapping Functions *** 

-- *** UCASE and CONCAT ***
-- Display the full name of point of contact each customer in the United States in upper case, along with their phone number, sorted by alphabetical order of customer name.

DESCRIBE customers;

SELECT customerName, CONCAT (UCASE(contactLastName), ' ', UCASE(contactFirstName)) AS concatName, phone
FROM customers
WHERE country = 'USA'
ORDER BY customerName ASC; 