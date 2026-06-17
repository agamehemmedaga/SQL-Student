DROP TABLE IF EXISTS student_courses CASCADE ;
DROP TABLE IF EXISTS students CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE students (
    id SERIAL PRIMARY KEY ,
    student_name VARCHAR (100) NOT NULL
);

CREATE TABLE courses(
    id SERIAL PRIMARY KEY,
    course_name VARCHAR (100) NOT NULL
);

CREATE TABLE student_courses (
    student_id INT REFERENCES students (id) ON DELETE CASCADE ,
    course_id INT REFERENCES courses (id) ON DELETE CASCADE ,
    progress INT NOT NULL DEFAULT 0,
    PRIMARY KEY (student_id , course_id)
);

INSERT INTO students VALUES
                         (11 , 'Aga Mehemmed' ),
                         (12, 'Ismayil Agayev'),
                         (13, 'Ramin '),
                         (33 , 'Valide' ),
                         (44, ' Ali');



INSERT INTO courses VALUES
                        (25 , 'Compar Academy'),
                        (55, 'Jet Academy'),
                        (65, 'Code Academy');


INSERT INTO student_courses (student_id, course_id, progress) VALUES
                                                                  (11 , 25 , 100),
                                                                  (12, 55 , 90),
                                                                  (13 , 65 , 80),
                                                                  (33 , 55 , 75),
                                                                  (44 , 25 , 95);

SELECT
    c.course_name,
    AVG(sc.progress) AS "orta_progress"


FROM student_courses sc
         INNER JOIN courses c ON sc.course_id = c.id
GROUP BY c.course_name;





