-- Find the number of employees
SELECT COUNT(emp_id)
FROM employee
;

-- Find the number of employees having supervisor
SELECT COUNT(super_id)
FROM employee
;

-- Find the muber of female employees born afer 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1970-01-01'
;

-- Find the avreage salary
SELECT AVG(salary)
FROM employee
;

-- Find the avreage salary per men
SELECT AVG(salary)
FROM employee
WHERE sex = 'M'
;

-- Fid the sum of all emloyee's salaries (pa saber cuanto gasta la company en personal)
SELECT SUM(salary)
FROM employee
;