
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

-- product lines (como categorias)

DROP TABLE IF EXISTS `productlines`;

CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `htmlDescription` mediumtext,
  `image` mediumblob,
  PRIMARY KEY (`productLine`)
);

DESCRIBE productlines;

-- products

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint(6) NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL, 
  `MSRP` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productCode`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`)
); --manufacturing price
--retaikl price o precio a la venta


-- orders

CREATE TABLE IF NOT EXISTS orders (
    orderNumber INT(11) NOT NULL,
    orderDate DATETIME NOT NULL,
    requiredDate DATETIME NOT NULL,
    shippedDate DATETIME DEFAULT NULL,
    status varchar(15) NOT NULL CHECK (status IN ('Shipped','Resolved','Disputed', 'Cancelled', 'On Hold', 'In Process')),
    comments TEXT DEFAULT NULL,
    customerNumber INT(11) NOT NULL,
    PRIMARY KEY (orderNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber)
); 

DESCRIBE orders;

-- order details

CREATE TABLE IF NOT EXISTS orderdetails (
    orderNumber INT(11) NOT NULL,
    productCode varchar(15) NOT NULL,
    quantityOrdered INT(11) NOT NULL,
    priceEach DOUBLE NOT NULL,
    orderLineNumer SMALLINT(6) NOT NULL,
    PRIMARY KEY (orderNumber, productCode),
    FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
    FOREIGN KEY (productCode) REFERENCES products(productCode)

); -- PK compuesta de dos FK

DESCRIBE orderdetails;