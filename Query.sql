DROP TABLE IF EXISTS teachers_courses CASCADE ;
DROP TABLE IF EXISTS teachers CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE teachers(
    teacher_id SERIAL PRIMARY KEY ,
    teacher_fullname VARCHAR (100) NOT NULL
) ;

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR(50) NOT NULL
);

CREATE TABLE teachers_courses(
    teacher_id INT REFERENCES teachers (teacher_id) ON DELETE CASCADE ,
    course_id INT REFERENCES  courses (course_id) ON DELETE CASCADE ,
PRIMARY KEY (teacher_id , course_id)
);

INSERT INTO teachers VALUES
                         (11 , 'Nihad Amirov'),
                         (22 , 'Orxan Allahyarov'),
                         (33 , 'Eli Asadov');

INSERT INTO courses VALUES
                        (55 , ' Compar Academy'),
                        (44 , ' Compar Academy'),
                        (77 , 'Jet Academy');

INSERT INTO teachers_courses (teacher_id, course_id) VALUES
                                                         (11 , 55 ),
                                                         (22 , 55 ),
                                                         (33 , 77);

SELECT *
FROM courses
WHERE course_id IN(
SELECT course_id
FROM teachers_courses
WHERE teacher_id IN (11 , 22)
    );
