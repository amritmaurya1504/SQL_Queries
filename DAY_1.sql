CREATE DATABASE temp;

USE temp;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO student VALUES(1, "Amrit Raj");
INSERT INTO student VALUES(2, "Sampriti Mukherjee");

SELECT * FROM student;