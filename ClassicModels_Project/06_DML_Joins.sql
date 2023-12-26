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
