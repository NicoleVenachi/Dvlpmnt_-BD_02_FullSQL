-- % = match any # characters, _ = match one character

-- Find any client's who are an LLC (pertecen a esa company)
SELECT * 
FROM client
;

SELECT *
FROM client
WHERE client_name LIKE '%LLC'
;  


-- Find any branch suppliers who are in the label business
SELECT * 
FROM branch_supplier
;

SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '%label%'
;

-- FInd any employee born in October

SELECT * 
FROM employee
WHERE birth_date LIKE '____-10%'
;
--  le estoy diciendo que los primeros numeros del patron sean ____ lo que sea, pero 4, que sean 4 caracteres/numeros.
-- Asi le indico que busque el mes justo en esas posiciones, porque conozco el formato de la data

-- Find any clients who are schools
SELECT * 
FROM client
;

SELECT * 
FROM client
WHERE client_name LIKE '%school%'
;

