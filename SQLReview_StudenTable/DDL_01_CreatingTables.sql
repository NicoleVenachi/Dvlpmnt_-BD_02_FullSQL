-- create
CREATE TABLE student 
(
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
    -- table constraints
    -- PRIMARY KEY(student_id)
);

DESCRIBE student; -- para ver la tabla, como un print

-- Modify 
ALTER TABLE student ADD gpa DECIMAL(3,2);
    --en una nota, tengo por ejemplo 4.3

ALTER TABLE student DROP COLUMN gpa;

DESCRIBE student;

-- Delete
DROP TABLE student;

DESCRIBE student;