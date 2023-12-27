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

-- *** Combining tables -> Sel Join *** 
-- Show a list of employees with the name & employee number of their manager.

DESCRIBE employees;

SELECT 
    emp.employeeNumber AS employerCode, CONCAT(emp.lastName, ' ', emp.firstName) AS employerName, emp.reportsTo,
    manag.employeeNumber AS managerCode, CONCAT(manag.lastName, ' ', manag.firstName) AS managerName

FROM employees emp
LEFT JOIN employees manag
ON emp.reportsTo = manag.employeeNumber; -- la foreign key es a quien se reporta (LEFT para que me traiga cualquier empleado, sea o no manager)

-- *** Combining tables -> Self Join (common registers) *** 

-- *** Excercises ***
-- Show the full office address and phone number for each employee.
SHOW TABLES;

DESCRIBE employees;
DESCRIBE offices;

SELECT lastName, jobTitle, offices.officeCode, CONCAT(country, ', ', city) AS dependency, addressLine1, CONCAT(phone, ' ', extension) AS empFullNumber
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