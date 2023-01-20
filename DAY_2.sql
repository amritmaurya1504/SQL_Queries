CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker ( WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
	(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),
    (002, 'Niharika', 'Verma', 8000, '14-06-11 09:00:00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');


CREATE TABLE BONUS (
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) 
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
	(001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (004, 4500, '16-02-20'),
    (005, 3500, '16-06-11');
    
CREATE TABLE Title (
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTEF_FROM DATETIME,
    FOREIGN KEY(WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
        -- IT HELP IN WHEN YOU DELETE TUPPLE FROM PARENT THEN CHILD TUPPLE IS ALSO DELETED ANS ON DELETE SET NULL NULL KAR DETA HAI
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTEF_FROM) VALUES
	(001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Executive', '2016-06-11 00:00:00'),
    (003, 'Executive', '2016-06-11 00:00:00'),
    (004, 'Manager', '2016-06-11 00:00:00'),
    (005, 'Asst. Manager', '2016-06-11 00:00:00'),
    (006, 'Executive', '2016-06-11 00:00:00'),
    (007, 'Lead', '2016-06-11 00:00:00'),
    (008, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Worker;
SELECT FIRST_NAME, SALARY FROM Worker;
SELECT 44 + 11;
SELECT now();
SELECT * FROM Worker WHERE SALARY>300000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- SALARY [8000, 300000]
SELECT * FROM Worker WHERE SALARY BETWEEN 8000 AND 300000;
-- REDUCE OR STATEMENT
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';
-- BETTERWAY
SELECT * FROM Worker WHERE DEPARTMENT IN('HR','Admin');
SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR','Admin');
-- WILDCARD
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';
-- SORTING USING ORDER BY
SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;
-- DISTINCT 
SELECT DISTINCT DEPARTMENT FROM Worker;
-- DATA GROUPING => BY DEFAULT DISTINCT WITHOUT AGGREATION (COUNT, MIN, MAX, AVG, SUM)
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;
-- AVERAGE SALARY PER DEPARTMENT
SELECT DEPARTMENT, AVG(SALARY), MIN(SALARY), MAX(SALARY), SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- HAVING 
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;

-- DATA MODIFICATION COMMAND
INSERT INTO Worker ( WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
	(009, 'Amrit', 'Raj', 100000, '14-02-20 09:00:00', 'Developer');
-- IF WE DONT PROVIDE ALL ATTRIBUTES
INSERT INTO Worker ( WORKER_ID, FIRST_NAME, LAST_NAME) VALUES 
	(010, 'Sampriti', 'Raj');    
-- UPDATE 
UPDATE Worker SET SALARY=50000, JOINING_DATE='14-02-20 09:00:00', DEPARTMENT="Developer" WHERE WORKER_ID=010;
-- ADD A COLUMN
ALTER TABLE Worker ADD PINCODE INT;
-- IF YOU WANT TO UPDATE MULTIPLE 
SET SQL_SAFE_UPDATES = 1;
-- UPDATE MULTIPLE ROWS
UPDATE Worker SET PINCODE = 804408;
UPDATE Worker SET SALARY = SALARY + 1;
-- DELTE
DELETE FROM Worker WHERE WORKER_ID = 010;
-- DELETE TABLE
DELETE FROM Worker;
-- REPLACE
REPLACE INTO Worker (WORKER_ID,FIRST_NAME, LAST_NAME) VALUES (002,'Amrit', 'Raj');
REPLACE INTO Worker (WORKER_ID,FIRST_NAME, LAST_NAME) VALUES (010,'Amrit', 'Hihiha');
REPLACE INTO Worker SET WORKER_ID = 1, FIRST_NAME = 'Sagrika';


-- JOINS
-- INNER JOIN
SELECT W.*, B.* FROM Worker AS W INNER JOIN BONUS AS B ON W.WORKER_ID = WORKER_REF_ID;
-- LEFT JOIN
SELECT W.*, B.* FROM Worker AS W LEFT JOIN BONUS AS B ON W.WORKER_ID = WORKER_REF_ID;
-- RIGHT JOIN
SELECT W.*, B.* FROM Worker AS W RIGHT JOIN BONUS AS B ON W.WORKER_ID = WORKER_REF_ID;
-- FULL JOIN
SELECT * FROM Worker AS W LEFT JOIN BONUS AS B ON W.WORKER_ID = WORKER_REF_ID 
UNION 
SELECT * FROM Worker AS W RIGHT JOIN BONUS AS B ON W.WORKER_ID = WORKER_REF_ID;

SELECT * FROM Worker;
SELECT * FROM BONUS;
SELECT * FROM Title;