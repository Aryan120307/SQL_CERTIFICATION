use college
create table emp_ss(e_id int primary key,e_name varchar(20),e_salary int,e_age int, e_gender varchar(10),e_dept varchar(20))
insert into emp_ss values(1,'Sam',93000,40,'Male','Operations' )
insert into emp_ss values(2,'Bob',80000,21,'Male','Support' )
insert into emp_ss values(3,'Anne',130000,25,'Female','Analytics' )
insert into emp_ss values(6,'Jeff',112000,27,'Male','Operation' )
insert into emp_ss values(7,'Adam',100000,28,'Male','Content' )
insert into emp_ss values(8,'Priya',85000,37,'Female','Tech' )
select * from emp_ss;

create table emp_t(e_id int primary key,e_name varchar(20),e_salary int,e_age int, e_gender varchar(10),e_dept varchar(20))
insert into emp_t values(1,'Sam',93000,40,'Male','Operations' )
insert into emp_t values(2,'Bob',80000,21,'Male','Support' )
insert into emp_t values(3,'Anne',125000,25,'Female','Analytics' )
insert into emp_t values(4,'Julia',73000,30,'Female','Analytics' )
insert into emp_t values(5,'Matt',159000,33,'Male','Sales' )
insert into emp_t values(6,'Jeff',112000,27,'Male','Operation' )
select * from emp_t;

-- STORED PROCEDURE
create procedure employee_details
as
select * from emp_ss
go;
 exec employee_details

 -- stored procedure with parameter 
 create procedure employee_gender @gender varchar(20)
 as 
 select * from emp_ss where e_gender=@gender 
 go
 exec employee_gender @gender='Male' 
 exec employee_gender @gender='Female'

 -- VIEWS
 create view female_employess as
 select * from emp_ss
 where e_gender='Female'

 select * from female_employee



 -- TRANSACTION
 begin transaction
 update emp_ss set e_age=30 
 where e_name='Sam'
 rollback transaction-- to undo it -- commit -- to save permanently

 select * from emp_ss;

 begin try
	begin transaction
	update emp_ss set e_salary=50 where e_gender='Male'
	update emp_ss set e_salary=50/0 where e_gender='Female' -- if we remove / 0 , transaction completed show else rollback 
	commit transaction
	print 'Transaction completed '
 end try
 begin catch
	rollback transaction
	print 'Transaction Rollback'
end catch

--EXCEPTION HANDLING
declare @val1 int
declare @val2 int
begin try
	set @val1=8
	set @val2=@val1/0
end try 
begin catch 
	print error_message()
end catch

begin try 
	select e_salary + e_name from emp_ss
end try 
begin catch 
	print 'cannot add a numerical value with a string value'
end catch

