SHOW DATABASES;
USE classicmodels;

SHOW TABLES;

-- *** Combining tables -> Inner Join (common registers) *** 
-- Show the 10 most recent payments with customer details (name & phone no.).
DESCRIBE payments;

DESCRIBE customers;

SELECT checkNumber, paymentDate, amount, customers.customerNumber, customerName, phone
FROM payments

JOIN customers
ON payments.customerNumber = customers.customerNumber

ORDER BY paymentDate DESC
LIMIT 10
;



-- *** Excercises ***
-- Show the full office address and phone number for each employee.
SHOW TABLES;

DESCRIBE employees;
DESCRIBE offices;

SELECT lastName, jobTitle, offices.officeCode, CONCAT(country, ' ', city) AS dependency, addressLine1, phone AS officePhone
FROM employees
JOIN offices
ON employees.officeCode = offices.officeCode
; -- registers/existing in both (i.e., a cada empleado le traigo su oficina)

-- Show the full order information and product details for order no. 10100.
DESCRIBE products;
DESCRIBE orderdetails;

SELECT orderdetails.*, productName, productVendor
FROM orderdetails
JOIN products
ON orderdetails.productCode = products.productCode
WHERE orderNumber = 10100
; -- de la orden, veo todos los productos pedidos, y muestro la info del producto