
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
WHERE jobTitle='Sales Rep' AND officeCode='1';