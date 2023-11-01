-- find out how many males and females are there

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex
;


-- Find the total sales of each salesman/saleswomen
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id
;

-- Fin out how much money each client has spent 
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id
;