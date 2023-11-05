-- crear tabla paraPRUEBAS
CREATE TABLE trigger_test (
    message VARCHAR(100)
)
;

------------  tirggers (los corro en el CLI)

DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ; --antes de inservar algo en employees, metemos un mensaje automático en trigger_test
--cambie el deliminter 2 veces, antes y desoues de terminar el trigger


INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT *
FROM trigger_test
; --confirmo que automáticamente se escribió

-------
DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);
    END$$
DELIMITER ; -- antes de insetar algo en employee, aacedo a info de ese registro y lo almaceno en trigger test

INSERT INTO employee
VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

SELECT *
FROM trigger_test
; --confirmo que automáticamente se escribió

------------------ 
DELIMITER $$
CREATE
    TRIGGER my_trigger3 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
         IF NEW.sex = 'M' THEN
               INSERT INTO trigger_test VALUES('added male employee');
         ELSEIF NEW.sex = 'F' THEN
               INSERT INTO trigger_test VALUES('added female');
         ELSE
               INSERT INTO trigger_test VALUES('added other employee');
         END IF;
    END$$
DELIMITER ; -- puedo usar condicionales, evluando data escrita
INSERT INTO employee
VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

SELECT *
FROM trigger_test
; --confirmo que automáticamente se escribió


-- desactivar/eliminar trigger
DROP TRIGGER my_trigger;