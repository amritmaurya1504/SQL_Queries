CREATE DATABASE EMP;
USE EMP;

CREATE TABLE EMPLOYEE (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age INT,
    emailID VARCHAR(255),
    phoneNo INT,
    city VARCHAR(255)
);

DESC EMPLOYEE;

INSERT INTO EMPLOYEE (id, name, age, emailID, phoneNo, city) VALUES
	(001, 'Amrit Raj', 32, 'amritmaurya2014@gmail.com', 898, 'Delhi'),
    (002, 'Aman Proto', 12, 'aman@gmail.com', 898, 'Palam'),
    (003, 'Rahul BD', 42, 'rahul@gmail.com', 898, 'Kolkata'),
    (004, 'Ankit Raj', 22, 'ankit@gmail.com', 898, 'Raipur'),
    (005, 'Sampriti Raj', 44, 'sam@gmail.com', 898, 'Jaipur');
    
SELECT * FROM EMPLOYEE;

CREATE TABLE CLIENT (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    age INT,
    emailID VARCHAR(255),
    phoneNo INT,
    city VARCHAR(255),
    empID INT,
    FOREIGN KEY (empID)
		REFERENCES EMPLOYEE(id)
        ON DELETE CASCADE
);

INSERT INTO CLIENT (id, name, age, emailID, phoneNo, city, empID) VALUES
	(001, 'Mac Rogers', 32, 'amritmaurya2014@gmail.com', 333, 'Kolkata',3),
    (002, 'Max Pointer', 12, 'aman@gmail.com', 123, 'Kolkata',3),
    (003, 'Peter Jain', 42, 'rahul@gmail.com', 154, 'Delhi',1),
    (004, 'Pratap Singh', 22, 'ankit@gmail.com', 785, 'Hyderabad',5),
    (005, 'Sampriti Mukherjee', 44, 'sam@gmail.com', 986, 'Mumbai',2);
    
SELECT * FROM CLIENT;

CREATE TABLE PROJECT (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
    startdate DATE,
    clientID INT,
    empID INT,
		FOREIGN KEY (clientID) REFERENCES CLIENT(id) ON DELETE CASCADE,
        FOREIGN KEY (empID) REFERENCES EMPLOYEE(id) ON DELETE CASCADE
);

INSERT INTO PROJECT (id, name, startdate, clientID, empID) VALUES
	(001,'A','2021-04-21',3,1),
    (002,'B','2021-03-12',1,2),
    (003,'C','2021-01-16',5,3),
    (004,'D','2021-04-27',2,3),
    (005,'E','2021-05-01',4,5);

-- INNER JOIN
-- ENLIST ALL THE EMPLOYESS ID, NAME, ALONG WITH THE PROJECT ALLOCATED TO THEM
SELECT e.id, e.name, p.id, p.name FROM EMPLOYEE AS e INNER JOIN PROJECT AS p ON e.id = p.empID;
-- WITHOUT JOIN
SELECT e.id, e.name, p.id, p.name FROM EMPLOYEE AS e, PROJECT AS p WHERE e.id = p.empID;

SELECT e.id, e.emailID, e.name, e.phoneNo , c.name FROM EMPLOYEE AS e 
INNER JOIN CLIENT AS c ON e.id = c.empID 
WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad';

SELECT e.name, p.* FROM EMPLOYEE AS e LEFT JOIN PROJECT AS p ON e.id = p.empID;
SELECT p.id, p.name, e.name, e.emailID FROM EMPLOYEE AS e RIGHT JOIN PROJECT AS p ON p.empID = e.id;
































