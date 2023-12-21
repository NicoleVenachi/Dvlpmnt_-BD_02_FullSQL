SHOW DATABASES;

USE classicmodels;

SHOW TABLES;

-- *** COUNT  *** 
-- USE CASE counting how many registers fulffil the condition/query


-- Report the total number of payments received before October 28, 2004.

SELECT *
FROM payments;

SELECT COUNT(*)
FROM payments
WHERE paymentDate< "2004-10-28";




-- *** COUNT & DISTINCT  *** 
-- USE CASE counting the number of categories/ distict values in a column

-- Report the number of customer who have made payments before October 28, 2004.

SELECT customerNumber
FROM payments
WHERE paymentDate< "2004-10-28"; 


SELECT DISTINCT customerNumber
FROM payments
WHERE paymentDate< "2004-10-28"; -- unique customer numbers

SELECT COUNT (DISTINCT customerNumber)
FROM payments
WHERE paymentDate< "2004-10-28"; -- how many unique customer numbers


-- *** AGGREGATION Excercises ***

-- How many employees are there in the company?

SELECT count(*)
FROM employees;

--What is the total of payments received?

DESCRIBE payments;

SELECT SUM(amount)
FROM payments;



