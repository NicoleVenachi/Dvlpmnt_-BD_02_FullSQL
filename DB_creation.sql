-- DROP TABLE student;

--employers

CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT,
    PRIMARY KEY(emp_id)

); --sex es f/m. 
-- No puedo deifnir foreing keys si aun on he creado esas tablas
DESCRIBE employee;

-- branch
CREATE TABLE branch (
    branch_id INT AUTO_INCREMENT,
    branch_name VARCHAR(40),
    mgr_id INT,
    mrg_start_date DATE,
    PRIMARY KEY(branch_id),
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

--DROP TABLE branch;

DESCRIBE branch;

-- Ahora sí podemos editar eployee table con sus foreing keys, pues
-- ya fueron credas tablas branch y emloyee

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

DESCRIBE branch;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL; --el foreing es el id del empleado

DESCRIBE employee;

-- client
CREATE TABLE client (
    client_id INT AUTO_INCREMENT,
    client_name VARCHAR(40),
    branch_id INT,
    PRIMARY KEY(client_id),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

DESCRIBE client;

-- client

CREATE TABLE works_with (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

--DROP TABLE works_with;

DESCRIBE works_with;

-- branch_supplier

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

--DROP TABLE works_with;

DESCRIBE branch_supplier;