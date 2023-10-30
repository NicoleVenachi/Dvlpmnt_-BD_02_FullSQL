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

-- ***** DML ****

-- Insert noramilto

INSERT INTO student VALUES(1, 'Juana', 'Telecommunications');

INSERT INTO student VALUES(2, 'Kate', 'Chemistry');

--nulos todos los que no mande

INSERT INTO student(student_id, name) VALUES(3, 'Claire');

INSERT INTO student VALUES(4, 'Mark', 'Sociology');

INSERT INTO student(name, major) VALUES('Maria', NULL);

INSERT INTO student VALUES(8, 'Isabela', 'Electronics');
--pa mostrar/query
SELECT * FROM student;
