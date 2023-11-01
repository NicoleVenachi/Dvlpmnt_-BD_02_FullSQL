--todas las columnas
SELECT *
FROM 

-- especificar columnas
SELECT name, major
FROM student;

--puedo tambien especificar la tablal muy claramente
SELECT student.name, student.major
FROM student;

-- con  oden desc
SELECT student.name, student.major
FROM student
ORDER BY name DESC
;

SELECT *
FROM student
ORDER BY major, student_id DESC
;

-- solo saco los 2 primeros
SELECT *
FROM student
ORDER BY major, student_id DESC
LIMIT 2
;

-- filtro con where
SELECT *
FROM student
ORDER BY major, student_id DESC
LIMIT 2
;
-- opadores logicos
-- <, >, <-, >=, =, <> diferent, AND, OR 

-- saco solo algunos major
SELECT *
FROM student
WHERE major = 'Chemistry' OR name='Isabela'
;

SELECT *
FROM student
WHERE student_id <> 3 AND student_id<6
;

-- filtro si nombre está dentor del array
SELECT *
FROM student
WHERE name IN('Isabela', 'Claire', 'Mark')
;
