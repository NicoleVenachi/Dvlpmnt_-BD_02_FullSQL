
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

