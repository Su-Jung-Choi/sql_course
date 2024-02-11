--Sujung Choi (PostgreSQL)
--CSC612 (HW7)

--1.
select ID
from instructor as I
where exists (select ID
				from student as S
				where S.ID = I.ID);
--2.					
select distinct S.name, S.ID
from student S
where not exists((select course_id
					from course
					where dept_name = S.dept_name)
					except
					(select course_id
					from takes
					where takes.ID = S.ID));
--3.
select S.name, S.ID
from student as S
where 1 =(select count(T.ID)
			from takes as T
			where T.semester = 'Fall' and T.year = 2017 
				and T.ID = S.ID);
				
--4.
select S.name, S.ID
from student as S
where 1 >=(select count(T.ID)
			from takes as T
			where T.semester = 'Fall' and T.year = 2017 
				and T.ID = S.ID);
				
--5.
select id, number_courses
from (select id, count(course_id) as number_courses
		from takes
		where semester = 'Fall' and year = 2017
		group by id)
where number_courses >= 2;

--6.
select name, ID,
	(select count(distinct course_id)
	from teaches
	where teaches.ID = instructor.ID) as number_courses
from instructor;

--7.	
with stu_total(ID, number_courses) as
	(select ID, count(course_id) as number_courses
	from takes
	group by ID),
	max_stu(number_courses) as
	(select max(number_courses)
	from stu_total)
select ID, stu_total.number_courses
from stu_total, max_stu
where stu_total.number_courses = max_stu.number_courses;
	
