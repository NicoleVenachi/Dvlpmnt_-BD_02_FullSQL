
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

-- Delete the entries for Sales Representatives working in London.

DESCRIBE offices;

SELECT  *
FROM offices;

SELECT officeCode, country
FROM offices
WHERE city = 'London'; --get office code for london offices

SELECT *
FROM employees
WHERE officeCode = (
    SELECT officeCode
    FROM offices
    WHERE city = 'London'
); -- show wxisting sales rep on london

DELETE FROM employees
WHERE officeCode = (
    SELECT officeCode
    FROM offices
    WHERE city = 'London'
); -- no dejo por table constraints, no sabe que hacer con estos employees en los customers
 
SELECT *
FROM employees
WHERE officeCode = (
    SELECT officeCode
    FROM offices
    WHERE city = 'London'
); -- check deleted registers


-- Show a list of employees who are not sales representatives

DESCRIBE employees;

SELECT DISTINCT jobTitle
FROM employees; -- obtener categorias de posibles trabajos


SELECT * 
FROM employees
WHERE jobTitle = 'Sales Rep';


-- Show a list of customers with "Toys" in their name

DESCRIBE customers;

SELECT *
FROM customers
WHERE customerName LIKE '%Toys%'; -- pattern is toys at any position

-- **** ORDER BY and LIMIT clausule ***
SELECT customerName, country
FROM customers
ORDER BY country;

SELECT customerName, country
FROM customers
LIMIT 10;

--- list the top 5 customers with a credit limit greater than a 1000 USD, order by it's country  
SELECT customerName, country, creditLimit
FROM customers
WHERE creditLimit>100000
ORDER BY country
LIMIT 5;

-- **** Excercises ***
