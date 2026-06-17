DROP TABLE IF EXISTS courses CASCADE;


CREATE TABLE courses(
    id SERIAL PRIMARY KEY ,
    course_name VARCHAR (50) NOT NULL ,
    price NUMERIC
);

INSERT INTO courses(course_name, price) VALUES
                                            ('Java Proqramlaşdırma' , 120),
                                            ('SQL verilənlər bazası' , 75),
                                            ('Python Giriş', 45),
                                            ('Frontend İnkişafı', 100),
                                            ('SMM və Kontent', 50);

SELECT * FROM courses
WHERE price BETWEEN 50 and 100;