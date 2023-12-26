
SHOW DATABASES;
USE classicmodels;

SHOW TABLES;

-- *** Mapping Functions -> Strings *** 

-- *** UCASE and CONCAT ***
-- Display the full name of point of contact each customer in the United States in upper case, along with their phone number, sorted by alphabetical order of customer name.

DESCRIBE customers;

SELECT customerName, CONCAT (UCASE(contactLastName), ' ', UCASE(contactFirstName)) AS concatName, phone
FROM customers
WHERE country = 'USA'
ORDER BY customerName ASC; 

-- *** SUBSTRING and LCASE **
-- Display a paginated list of customers (sorted by customer name), with a country code column. The country is simply the first 3 letters in the country name, in lower case.

DESCRIBE customers;

SELECT customerName, SUBSTRING(LCASE(country), 1,3) AS countryCode 
FROM customers
ORDER BY customerName ASC
LIMIT 10
OFFSET 0;




-- *** Mapping Functions -> Numbers/Arithmetic operations *** 

-- *** ROUND *** 
-- Display the list of the 5 most expensive products in the "Motorcycles" product line with their price (MSRP) rounded to dollars.
DESCRIBE products;

SELECT ROUND(MSRP)
FROM products
WHERE productLine = 'Motorcycles'
ORDER BY MSRP DESC
LIMIT 5;

-- *** Arithmetic Operations ***
-- Display the product code, product name, buy price, sale price and profit margin percentage ((MSRP - buyPrice)*100/buyPrice) for the 10 products with the highest profit margin. Round the profit margin to 2 decimals.
DESCRIBE products;

SELECT productCode, productName, ROUND((MSRP - buyPrice)*100/buyPrice, 2) AS marginPercentage, buyPrice, MSRP
FROM products
ORDER BY marginPercentage DESC
LIMIT 10;