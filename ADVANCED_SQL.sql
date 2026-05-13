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

-- ADVANCED SQL 
-- STORED PROCEDURE 
CREATE PROCEDURE details
AS
BEGIN
select * from emp_ss
END

EXEC dbo.details
select * from emp_t 

-- ADDING A PARAMETER 
-- Create the stored procedure with explicit table aliases
CREATE PROCEDURE get_data (
    @em_id INT
)
AS 
BEGIN 
    SELECT 
        e.e_name,
        e.e_dept 
    FROM emp_ss AS e 
    LEFT JOIN emp_t AS t ON e.e_id = t.e_id 
    WHERE e.e_id = @em_id 
       OR e.e_id IS NULL;
END;
GO

-- Execute the stored procedure
EXEC dbo.get_data @em_id = 3;

CREATE FUNCTION fn_fullname(@first_name VARCHAR(20) , @last_name VARCHAR(20))
RETURNS VARCHAR(50)
AS
BEGIN
RETURN(
    @first_name +  @last_name
)
END



-- MULTIPLE PARAMETERS
CREATE PROCEDURE GET_DAT
    @em_id int = NULL , -- default parameter not required must
    @em_dept VARCHAR(20)

AS
BEGIN
    SELECT  e_salary ,dbo.fn_fullname('Aryan', 'Sharma') as fname ,e_dept 
    FROM emp_ss
    where 
        ( e_id=@em_id OR @em_id is null  ) 
        AND e_dept=@em_dept
END
go

EXEC dbo.GET_DAT @em_dept='Operations' 
select * from emp_ss


