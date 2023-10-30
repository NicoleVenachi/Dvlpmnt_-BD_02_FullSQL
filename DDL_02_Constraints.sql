-- create
DROP TABLE student;

CREATE TABLE student 
(
    student_id INT AUTO_INCREMENT, 
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT('undecided') UNIQUE,
    -- table constraints
    PRIMARY KEY(student_id)
);

DESCRIBE student; -- para ver la tabla, como un print