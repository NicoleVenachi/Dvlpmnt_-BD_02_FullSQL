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

-- Chaining queryes -> Retrieve the details all customers who have made a payment before October 28, 2004.

DESCRIBE customers;

SELECT *
FROM customers;

SELECT *
FROM customers
WHERE curstomerNumber IN (
    SELECT DISTINCT customerNumber
    FROM payments
    WHERE paymentDate< "2004-10-28"; 
);  -- bring detailed info of unque customers who have made a payment before the specified date

-- *** GROUP BY and AS ***
-- USE CASE, Grouping registers according to a feature, in summary columns

-- Find the total number of payments made each customer before October 28, 2004.

DESCRIBE payments;

SELECT  COUNT(*) AS numberOfPayments, customerNumber
FROM payments
WHERE paymentDate < "2004-10-28"
GROUP BY customerNumber;

-- *** SUM *** 

--Find the total amount paid by each customer payment before October 28, 2004.

SELECT SUM(amount) AS totalPaymentsAmount, customerNumber
FROM payments
WHERE paymentDate < "2004-10-28"
GROUP BY customerNumber;

-- *** SUM and COUNT ***

-- Find the total no. of payments and total payment amount for each customer for payments made before October 28, 2004.

DESCRIBE payments;

SELECT COUNT(*) AS numberOfPayments, SUM (amount) AS totalAmountPaid, customerNumber
FROM payments
WHERE paymentDate < "2004-10-28"
GROUP BY customerNumber;
;


-- *** MIN, MAX and AVERAGE ***

-- Modify the above query to also show the minimum, maximum and average payment value for each customer.

SELECT COUNT(*) AS numberOfPayments, SUM (amount) AS totalAmountPaid, MIN(amount) AS minPaymentAmount, MAX(amount) AS maxPaymentAmount, AVG (amount) AS averagePaymentAmount, customerNumber
FROM payments
WHERE paymentDate < "2004-10-28"
GROUP BY customerNumber
ORDER BY  COUNT(*) DESC, SUM (amount) DESC;



-- *** AGGREGATION Excercises ***

-- How many employees are there in the company?

SELECT count(*)
FROM employees;


--What is the total of payments received?

DESCRIBE payments;

SELECT SUM(amount)
FROM payments;


--  Retrieve details of all the customers in the United States who have made payments between April 1st 2003 and March 31st 2004.

SELECT DISTINCT country
FROM customers;

SELECT DISTINCT customerNumber
FROM payments 
WHERE paymentDate>= "2003-04-01" AND paymentDate<= "2004-03-31";  -- locating unique customerNumbers from payments in this range

SELECT * 
FROM customers
WHERE country = 'USA' AND customerNumber IN (
    SELECT DISTINCT customerNumber
    FROM payments 
    WHERE paymentDate>= "2003-04-01" AND paymentDate<= "2004-03-31"
); -- all info from these customers, living in USA


-- Determine the total number of units sold for each product

DESCRIBE orderdetails;

SELECT SUM(quantityOrdered) AS soldQuantity, productCode
FROM orderdetails
GROUP BY productCode
ORDER BY SUM(quantityOrdered) DESC;





-- *** PAGINATION -> ORDER BY, LIMIT, and OFFSET ***

-- Retrieve the customer number for 10 customers who made the highest total payment in 2004.

DESCRIBE payments;

SELECT SUM(amount) AS totalPayment, customerNumber
FROM payments
WHERE paymentDate < "2004"
GROUP BY customerNumber
ORDER BY totalPayment DESC
LIMIT 10;

-- Pagination -> To get the next 10 results, we can simply add an OFFSET with the number of rows to skip.

SELECT SUM(amount) AS totalPayment, customerNumber
FROM payments
WHERE paymentDate < "2004"
GROUP BY customerNumber
ORDER BY totalPayment DESC
LIMIT 10
OFFSET 10; 
