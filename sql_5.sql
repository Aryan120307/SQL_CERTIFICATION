use college;
--joins
create table Employees1(e_id int primary key,e_name varchar(20),e_salary int , e_age int, e_dept varchar(20));
alter table Employees1 add e_gender varchar(20);
insert into Employees1 values(1,'sam',95000,45,'operations','male');
insert into Employees1 values(2,'bob',80000,21,'support','male');
insert into Employees1 values(3,'anne',125000,25,'analytics','female');
insert into Employees1 values(4,'julia',73000,30,'analytics','female');
insert into Employees1 values(5,'matt',159000,33,'sales','male');
insert into Employees1 values(6,'jeff',112000,27,'operations','male');
create table department(d_id int ,d_name varchar(20),d_location varchar(20));
insert into department values(1,'content','new york');
insert into department values(2,'support','chicago');
insert into department values(3,'analytics','newyork');
insert into department values(4,'sales','boston');
insert into department values(5,'tech','dallas');
insert into department values(6,'finance','chicago');
select * from Employees1;
select  * from department; 
--inner joins- it gives us those records that have matching values  in both tables.it is also known as simple join 
select Employees1.e_name,Employees1.e_dept,department.d_name,department.d_location
from Employees1
inner join department on Employees1.e_dept=department.d_name;
ALTER TABLE department
ALTER COLUMN d_id INT NOT NULL;
-- we have make the column first not null to do alter as primary key
alter table department
add primary key(d_id);
update department 
set d_location='new york' 
where d_id=3; 
--left join - it returns all the records from the left table and the matched records from the right table 
select Employees1.e_name,Employees1.e_dept,department.d_name,department.d_location
from Employees1
left join department
on Employees1.e_dept=department.d_name;
--right join- it returns all the record from the second table and the match records from table first
select Employees1.e_name,Employees1.e_dept,department.d_name,department.d_location
from Employees1
right join department
on Employees1.e_dept=department.d_name;
--full join - it returns all the records from the right table and  left table and null values where the join condition is not met 
--it can be made possible through union of left join and right join
--delete= it is used to delete existing records in the table 
delete from Employees1 where e_age=33;
select * from Employees1
delete from Employees1 where e_name='sam';
--Truncate - it deletes all the data from the table
truncate table Employees1;
select * from Employees1;
--Update - it is used to modify the existing data.
update Employees1 set e_age=43 where e_name='sam';
update Employees1 set e_dept='tech' where  e_id=4;
update Employees1 set e_dept='analytics' where e_id=3;

--update using joins
update  e
set  e_age=e_age+10
from Employees1 e
join department d
on e.e_dept=d.d_name
where d.d_location='new york';

select * from Employees1 ;
select * from department;

--delete using join
delete e
from Employees1 e
join department d
on e.e_dept=d.d_name
where d.d_location='new york'; --anne got deleted


