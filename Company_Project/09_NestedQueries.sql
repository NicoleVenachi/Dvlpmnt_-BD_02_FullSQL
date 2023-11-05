-- Find names of all employees who have sold over 30,000 to a single client

--quiero sacar nombre (coincidencia en el ID)
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
); -- employees que han vendido mas de 30k




-- Find all clients who are handled by the branch Michael Scott manages. Asuume you know Michael's ID (102)

SELECT branch.branch_id
FROM branch
WHERE branch.mgr_id = 102
; -- inner query, encontremos branch managed por michael

SELECT client.client_id
FROM client
; -- outter query, busuemos clients_id's

SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
)
; -- hagamos match por la branch_id

