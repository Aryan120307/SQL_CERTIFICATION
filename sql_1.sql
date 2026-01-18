create table employee(
e_id int not null,
e_name varchar(20),
e_salary int not null,
e_age int ,
e_gender varchar(20),
e_department varchar(20),
primary key(e_id)
);
insert into employee values(
1,'Aryan',100000,18,'Male','IT'
);
insert into employee values(
2,'Gurudas',50000,18,'Male' ,'IT'
);
insert into employee values(
3,'Amar',40000,18,'Male','IT'
);
insert into employee values(
4,'Ronit',10000,20,'Female','MCF'
);
select e_name from employee;
select e_id,e_name,e_age,e_salary from employee;
select * from employee;
select distinct e_gender from employee;
select * from employee where e_salary>=40000;
select * from employee where e_gender='Female' and e_age>=18;
select * from employee where e_gender='Female' or e_department='acc';
select * from employee where not e_gender='female';
select * from employee where e_name like'A%';
select * from employee where e_salary between 30000 and 100000;
select * from employee where e_age like '1_' ;
alter table employee
add e_dept varchar(20);
select * from employee;
create table department(
e_id int not null,
e_name varchar(20),
e_salary int not null,
e_age int ,
e_gender varchar(20),
e_department varchar(20),
primary key(e_id)
