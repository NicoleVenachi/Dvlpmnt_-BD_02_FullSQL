-- *** AGGREGATION Excercises ***

-- How many employees are there in the company?

SELECT count(*)
FROM employees;

--What is the total of payments received?

DESCRIBE payments;

SELECT SUM(amount)
FROM payments;
