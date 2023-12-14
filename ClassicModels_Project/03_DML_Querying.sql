
USE classicmodels;

-- **** WHERE clausule ***

--Pull employees working as Sales representatives in SanFrancisto office (code 1)
SELECT *
FROM classicmodels.employees
WHERE jobTitle='Sales Rep' AND officeCode='1';

SELECT * 
FROM offices;

DELETE 
FROM offices 
WHERE officeCode='aaa'; -- WHERE on -D-elete CRUD op

-- change the person reporting to from San francisco empoloyees working as Sales Rep

SELECT * 
FROM employees;

UPDATE employees
SET reportsTo="1002"
WHERE jobTitle='Sales Rep' AND officeCode='1'; -- WHERE on -U-pdate


SELECT * 
FROM employees;

-- **** Excercises ***

SHOW TABLES;

-- list USA customers with credit higher than 1000
DESCRIBE customers;

SELECT *
FROM customers
WHERE country="USA" AND creditLimit >= 1000; 

-- list the employee codes for sales representatives of customers in Spain, France and Italy. Make another query to list the names and email addresses of those employees.


SELECT salesRepEmployeeNumber
FROM customers
WHERE country IN ("SPAIN", "FRANCE", "ITALY" );

DESCRIBE employees;

SELECT firstName, lastName,  email
FROM employees
WHERE employeeNumber IN (
    SELECT salesRepEmployeeNumber
    FROM customers
    WHERE country IN ("SPAIN" OR "FRANCE" OR "ITALY" )
); --using NESTED QUERY to get the employees ID to look for