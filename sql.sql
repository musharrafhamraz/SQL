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

ALTER TABLE Employeex
ADD Sal int;

UPDATE Employeex
SET Sal = 
  CASE 
    WHEN Empl_id = 1 THEN 1200
    WHEN Empl_id = 2 THEN 9209
    WHEN Empl_id = 3 THEN 7834
    WHEN Empl_id = 4 THEN 8545
    WHEN Empl_id = 5 THEN 9223
    ELSE Sal
  END;

SELECT * FROM employeex;

UPDATE employeex
SET Empl_name = "Ahmad"
WHERE Empl_id = 2;

SELECT * FROM employeex;

DELETE FROM employeex
WHERE Empl_id = 1;

SELECT * FROM employeex;

select * from employeex
where Sal < (
select avg(Sal) from employeex
);


# Creating another table where we will put the values where the salary will be between 1200 to 9000
CREATE TABLE empdatabase.employees (
	Empl_id int primary key,
    Empl_name varchar(256),
    Empl_age int
);
ALTER TABLE Employees
ADD Sal int;

insert into empdatabase.employees
select * from empdatabase.employeex
where Sal between 1200 AND 9000;

select * from employees;


drop table empdatabase.employees;


select employeex
into employees
from employeex
full join employees on employees.Empl_id = employeex.Empl_id;

select sum(replacement_cost) as "Acc Replacement_cost"
from film
where film_id not in(
		select distinct f.film_id
        from film f
		join inventory inv on f.film_id = inv.film_id
        join rental r on inv.inventory_id = r.inventory_id
        
);

-- lab 4 
use empdatabase;
create view first_view as select * from employeex;

select * from first_view;

create view second_view as select * from employeex where sal = 5000;

create view second_view1 as select * from employeex where sal = 9223;
select * from second_view1;


select Empl_name from employeee
union
select Empl_name from employeex;


select * from first_view
union all
select * from second_view;

-- select * from first_view
-- INTERSECT
-- select * from second_view;

-- select Empl_name, Empl_age from employeee
-- INTERSECT
-- select Empl_name, Empl_age from employeex;

select * from first_view
union
select * from employeex;

use sakila;

create view actor_view as select * from actor;

select * from actor_view;
