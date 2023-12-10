
USE classicmodels;

SHOW TABLES;

-- offices
DROP TABLE offices;

CREATE TABLE offices (
    officeCode VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL,
    PRIMARY KEY (officeCode)
);



DESCRIBE offices;

--  employees
 
DROP TABLE IF EXISTS  employees; -- to refresh the table

CREATE TABLE employees (
    employeeNumber INT(11) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL, 
    officeCode VARCHAR(10) NOT NULL, -- relation to an office
    reportsTo INT(11) DEFAULT NULL, -- self relation
    jobTitle VARCHAR(50) NOT NULL,
    PRIMARY KEY (employeeNumber),
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber),
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode)
);


DESCRIBE employees;

-- cutomers 

DROP TABLE IF EXISTS  customers; 

CREATE TABLE IF NOT EXISTS customers ( -- doesn't deletes all data like dorp table does

    customerNumber INT(11) NOT NULL,
    customerName VARCHAR(50) NOT NULL,
    `contactLastName` VARCHAR(50) NOT NULL,
    `contactFirstName` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `addressLine1` VARCHAR(50) NOT NULL,
    `addressLine2` VARCHAR(50) NULL DEFAULT NULL,
    `city` VARCHAR(50) NOT NULL,
    `state` VARCHAR(50) NULL DEFAULT NULL,
    `postalCode` VARCHAR(15) NULL DEFAULT NULL,
    country VARCHAR(50) NOT NULL,
    salesRepEmployeeNumber INT(11) NULL, -- relation to an employee
    creditLimit DOUBLE NULL DEFAULT NULL,
    `customerLocation` POINT NOT NULL,
    PRIMARY KEY (`customerNumber`),
    FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
);


DESCRIBE customers;