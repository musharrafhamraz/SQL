CREATE DATABASE EmpDatabase;

CREATE TABLE Employeex (
	Empl_id int primary key,
    Empl_name varchar(256),
    Empl_age int
);

INSERT INTO Employeex (Empl_id,Empl_name, Empl_age)
VALUES ( 1, "Musharraf", 22),
(2, "Hamraz", 23),
(3, "Farhan", 22),
(4, "Tehzeeb", 21),
(5, "Ajmal", 23);

SELECT * FROM employeex;

UPDATE employeex
SET Empl_name = "Ahmad"
WHERE Empl_id = 2;

SELECT * FROM employeex;

DELETE FROM employeex
WHERE Empl_id = 1;

SELECT * FROM employeex;


