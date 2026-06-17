DROP TABLE IF EXISTS students_courses CASCADE ;
DROP TABLE IF EXISTS students CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE students(
    id SERIAL PRIMARY KEY ,
    student_fullname VARCHAR (100) NOT NULL
);

CREATE TABLE courses(
    id SERIAL PRIMARY KEY ,
    course_name VARCHAR (100) NOT NULL
);

CREATE TABLE  students_courses (
    student_id INT REFERENCES students (id) ON DELETE CASCADE ,
    course_id INT REFERENCES courses (id) ON DELETE CASCADE ,
    progress INT NOT NULL DEFAULT 0,
    PRIMARY KEY (student_id , course_id)
);

INSERT INTO students VALUES
(222, 'Aga Mehemmed'),
    (355, ' Ismayil Agayev'),
    (444, 'Zeyneb Mahmudova'),
    (254, 'Feride Qasimova'),
    (111, ' Adil Muradov'),
    (785, 'Kemale Memmedova') ,
    (800 , 'Zehra Babayeva');

INSERT INTO courses VALUES
                        (35 , 'Compar Academy'),
                        (28 , ' Jet Academy '),
                        (70 , 'Code Academy');

INSERT INTO students_courses (student_id, course_id, progress) VALUES
                                                                   (222 , 35 , 90),
                                                                   (355 , 35 , 95),
                                                                   (444 , 35 , 100),
                                                                   (254 , 28 , 80),
                                                                   (111 , 28 , 75),
                                                                   (785 , 70 , 50),
                                                                   (800 , 35 , 85);
SELECT
    c.course_name,
    COUNT(student_id) AS "student_count"
FROM
    student_courses sc
JOIN
        courses c ON sc.course_id = c.id
GROUP BY
    c.course_name
HAVING
    COUNT (student_id) >3;
