SHOW DATABASES;

USE classicmodels;

SHOW TABLES;

-- *** AGGREGATION Excercises ***

-- How many employees are there in the company?

SELECT count(*)
FROM employees;

--What is the total of payments received?

DESCRIBE payments;

SELECT SUM(amount)
FROM payments;

-- Report the total number of payments received before October 28, 2004.
SELECT *
FROM payments;

SELECT COUNT(*)
FROM payments
WHERE paymentDate< "2004-10-28"; -- count how many registers fulffil the condition/query

