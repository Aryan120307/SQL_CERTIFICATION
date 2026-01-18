--Create a new database
CREATE DATABASE college_;
--Use the newly created database
USE college;
--Create a table named student
CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(30),
    age INT
);
INSERT INTO student VALUES (95, 'Aryan', 'BCA', 18);
--View the data
SELECT * FROM student;
--Alter table - add a new column for city
ALTER TABLE student ADD city VARCHAR(30);
--view the data
SELECT * FROM student;
--Rename table (SQL Server uses sp_rename)
EXEC sp_rename 'student_.name', 's.name', 'COLUMN';
select * from student_;
--Drop the column 'city'
ALTER TABLE student_
DROP COLUMN city;

--Verify that the column is deleted
SELECT * FROM student_;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(30)
);

-- Insert values
INSERT INTO employees VALUES 
(101, 'Aman', 35000, 'HR'),
(102, 'Priya', 42000, 'Finance'),
(103, 'Karan', 38000, 'IT');
-- Show table
select * from employees;
--Update salary
UPDATE employees SET salary = 40000 WHERE emp_id = 103;
-- Show table
select * from employees;
-- Delete a record
DELETE FROM employees WHERE emp_id = 101;
-- Show table
select * from employees;





