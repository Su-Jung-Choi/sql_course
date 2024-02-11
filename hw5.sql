--Sujung Choi (PostgreSQL)
--CSC612 (HW5)
drop table if EXISTS manages;
drop table if EXISTS works;
drop table if EXISTS company;
drop table if EXISTS employee;

--1.
create table employee(
	employee_name	varchar(20),
	street	varchar(20),
	city	varchar(20),
	primary key (employee_name));

create table company(
	company_name	varchar(30),
	city	varchar(20),
	primary key (company_name));

create table works(
	employee_name	varchar(20),
	company_name	varchar(30),
	salary	numeric(8,2),
	primary key (employee_name),
	foreign key (employee_name) references employee,
	foreign key (company_name) references company);

create table manages(
	employee_name	varchar(20),
	manager_name	varchar(20),
	primary key (employee_name),
	foreign key (employee_name) references employee,
	foreign key (manager_name) references employee(employee_name));

--2.
insert into employee values ('Susan', 'Walnut', 'Springfield');
insert into employee values ('Claire', 'East st', 'Dallas');
insert into employee values ('Hannah', 'Page', 'Washington');
insert into employee values ('John', 'North st', 'Mountain view');
insert into employee values ('Seon', 'Sunshine st', 'Austin');
insert into employee values ('Kim', 'Sunshine st', 'Austin');
insert into employee values ('Mark', 'East st', 'Dallas');
insert into employee values ('Lee', 'Golden', 'Seattle');
insert into company values ('Google', 'Mountain view');
insert into company values ('Amazon', 'Austin');
insert into company values ('AT&T', 'Dallas');
insert into company values ('First Bank Corporation', 'Springfield');
insert into works values ('Claire', 'First Bank Corporation', 60000);
insert into works values ('John', 'AT&T', 80000);
insert into works values ('Seon', 'Amazon', 100000);
insert into works values ('Mark', 'Google', 130000);
insert into manages values ('Susan', 'John');
insert into manages values ('Claire', 'Mark');
insert into manages values ('Hannah', 'Lee');
insert into manages values ('Kim', 'Seon');

--3-1.
select employee_name
from works
where company_name = 'First Bank Corporation';

--3-2.
select company_name, city
from company
order by company_name;

--3-3.
select employee_name
from works
where salary >= 65000;

--3-4.
select employee_name
from employee natural join works natural join company;

--3-5.
select T.employee_name
from employee T, employee S, manages
where T.employee_name = manages.employee_name 
and S.employee_name = manages.manager_name
and T.street = S.street
and T.city = S.city;