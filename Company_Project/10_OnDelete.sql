-- delete de un manager, para que se ponga en NULL el mgr_id field asociado

SELECT *
FROM branch
; -- veamos la branch antes

DELETE FROM employee
WHERE emp_id = 102
; -- eliminemos a Michael

SELECT *
FROM branch
; -- verifiquemos que se puso en null su branchasocciada

SELECT *
FROM employee
; -- veamos que tambien un pooc de supervisores ahora están en null


-- CASCADE, si elimino una branch, todos los registros con ese branch suplier se eleiminan


SELECT *
FROM branch_supplier
; -- veamos suplliers antes


DELETE FROM branch
WHERE branch_id = 2
; -- eliminemos una rama

SELECT *
FROM branch_supplier
; -- veririguqmoes que los branch suppliers se fueron

