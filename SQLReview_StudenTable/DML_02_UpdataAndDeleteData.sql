-- create

-- DROP TABLE student;
CREATE TABLE student 
(
    student_id INT, -- PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20),
    -- table constraints
    PRIMARY KEY(student_id)
);

-- ***** Update***** 

UPDATE student
SET major = 'Telecom', name = 'Juanita' 
WHERE major = 'Telecommunications' OR name='Juana';

--querie
SELECT * FROM student;

 -- ***** Update***** 

DELETE FROM student
WHERE major = 'Telecommunications' OR major='Telecom';

--querie
SELECT * FROM student;