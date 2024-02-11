--Sujung Choi (PostgreSQL)
--CSC612 (HW6)

--1.
select dept_name, count(ID) as number_students
from student
group by dept_name;

--2.
select dept_name, count(ID) as number_students
from student
group by dept_name
having count(ID) >= 3;

--3.
(select ID from instructor)
INTERSECT
(select ID from student);

--4.
select ID
from student
where ID in (select ID
			 from instructor);

--5.
select ID
from student
where ID = some(select ID
				from instructor);