-- find all employees 
SELECT * 
FROM employee
;

-- find all clients 
SELECT * 
FROM client
;

-- find all employees order by salary (mayor a menos)
SELECT * 
FROM employee
ORDER BY salary DESC
;

-- find all employees order by sex, then name (first y last por si hay nomes duplicados)
SELECT * 
FROM employee
ORDER BY sex, first_name, last_name
;

-- find the first 5 employees in the table
SELECT * 
FROM employee
LIMIT 5
;

-- find the first and last names of all employees
SELECT first_name AS forename, last_name AS surename
FROM employee
;

-- find out all the diferent genders (sacar las distintas categorias)
SELECT DISTINCT sex
FROM employee
;

-- find out the braches associated to the employees
SELECT DISTINCT branch_id
FROM employee
;