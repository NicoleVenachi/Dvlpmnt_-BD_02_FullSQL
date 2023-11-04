-- Find a list o employee and branch names and client names

SELECT first_name
FROM employee
;

SELECT branch_name
FROM branch
;


SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client
;

-- Find a list of all clients and branch suppliers' names,and its branch id's they're associated
SELECT client_name, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier
; -- el . para hacerlo mas readable



-- Fiad a list of all money spent or earned by the company (salary y sales)

SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with
;
