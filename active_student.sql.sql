DROP TABLE IF EXISTS students_courses  CASCADE ;
DROP TABLE IF EXISTS students CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE students (
   student_id SERIAL PRIMARY KEY ,
    student_fullname VARCHAR (50) NOT NULL
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR (50) NOT NULL
);

CREATE TABLE students_courses(
    student_id INT REFERENCES students (student_id),
    course_id INT REFERENCES courses (course_id),
    PRIMARY KEY (student_id , course_id)
);

INSERT INTO students VALUES
 (1, 'Necati Aliyev'),
 (2, 'Nihat Aliyev'),
 (3, 'Yunus Babayev'),
 (4, 'Hakim Agayev'),
 (5, 'Nicat Isgenderli'),
 (6, 'Serxan Asadov');

INSERT INTO courses VALUES
                        (10 , 'Compar Academy'),
                        (20 , 'Jet Academy');

INSERT INTO students_courses (student_id, course_id) VALUES
                                                         (1 , 10),
                                                         (1 , 20),
                                                         (2 , 10),
                                                         (2 , 20),
                                                         (3 , 10),
                                                         (4 , 10),
                                                         (5 , 10),
                                                         (5 , 20),
                                                         (6 , 20);

SELECT
    s.student_id,
    s.student_fullname,
    COUNT(sc.course_id) AS Kurs_sayi,
    STRING_AGG(c.course_name, ', ') AS Kurs_adlari
FROM students s
JOIN students_courses sc ON s.student_id = sc.student_id
JOIN courses c ON sc.course_id = c.course_id
GROUP BY s.student_id ,  s.student_fullname
HAVING COUNT (sc.course_id) = (
    SELECT COUNT (course_id)
    FROM students_courses
    GROUP BY student_id
    ORDER BY COUNT(course_id) DESC
    LIMIT 1
    )
ORDER BY Kurs_sayi DESC, s.student_id ASC;




