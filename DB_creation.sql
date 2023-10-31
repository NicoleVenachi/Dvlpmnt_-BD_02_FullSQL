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