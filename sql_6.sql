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

MERGE emp_t as T
USING emp_ss as S
	ON T.e_id = S.e_id
WHEN MATCHED
	THEN UPDATE set T.e_salary=S.e_salary ,T.e_age=S.e_age
WHEN NOT MATCHED BY TARGET
	THEN INSERT(e_id,e_name,e_salary,e_age,e_gender,e_dept)
	VALUES(S.e_id,S.e_name,S.e_salary,S.e_age,S.e_gender,S.e_dept)
WHEN NOT MATCHED BY SOURCE
	THEN Delete;
select * from emp_t;

-- ALTER 
ALTER table emp_ss
add e_dob DATE
select * from emp_ss;

-- delete alter
ALTER table emp_ss
drop column e_dob ;
select * from emp_ss;

-- TEMPORARY TABLE
CREATE TABLE #STUDENT(
s_id int,
s_name varchar(20),
);
insert into #STUDENT values(1,'ARYAN');
select * from #STUDENT

-- BASIC FUNCTION
--MIN()
SELECT MIN(e_age) from emp_ss;
--MAX()
select max(e_salary) from emp_ss;
--count
select count(*) from emp_ss where e_gender='Female';
--sum()
select sum(e_salary) from emp_ss;
--avg()
select avg(e_age) from emp_ss;

--STRING FUNCTION
--LTRIM()
select '        sparta'
select ltrim('                 sparta')
--upper()
select 'aryan'
select upper('aryan')
--lower()
select 'ARYAN'
select lower('ARYAN')
--REVERSE()
select 'aryan'
select reverse('aryan')
--SUBSTRING()
select 'i am aryan'
select substring('i am aryan',6,9)

--CASE STATEMENT
select * ,grade=
case
when e_salary<90000 then 'c'
when e_salary<120000 then 'B'
else 'A'
end
from emp_ss
go

--IIF ()
select e_id , e_name,e_age , iif(e_age>30,'old employee','new employee') as employee_generation from emp_ss;

--USER DEFINED FUNCTION
--scalar valued UDF
-- Scalar Valued UDF
CREATE FUNCTION add_five(@num AS INT)
RETURNS INT -- No 'AS' here
AS
BEGIN
    RETURN (@num + 5);
END;
GO

SELECT dbo.add_five(10);

--table valued ()
CREATE FUNCTION select_gender(@gender as varchar(20))
returns table
as
return(
select * from emp_ss where e_gender=@gender
);
select * from dbo.select_gender('Male');

--ORDER BY 
select * from emp_ss order by e_salary DESC;
select * from emp_ss order by e_salary;

--top clause
select top 3 * from emp_ss order by e_salary DESC;

--GROUP BY
select avg(e_salary),e_gender from emp_ss group by e_gender;

--HAVING
select e_dept , avg(e_salary) as avg_salary from emp_ss group by e_dept having avg(e_salary)>100000;

--UNION
select * from emp_ss
union
select * from emp_t;

--UNION ALl - i t allows duplicate also 
--INTERSECT
select * from emp_ss
intersect
select * from emp_t;

--EXCEPT
select * from emp_ss
except
select * from emp_t;
