USE [SQL certification];
--create a table to store store details 
create table store_details(
store int primary key,
store_name varchar(200) not null,
sales int check(sales>20),
order_no int unique,
store_location varchar(200) default'faridabad',
city varchar(200),
pincode int
);
-- inserting data into the table
insert into store_details values(1,'flipkart',100,1,' ','faridabad',121004);
-- select command to view table 
select * from store_details;
-- selecting individual column from the table
select store_name,pincode from store_details;
--ALTER- it is used to add modify or delete column in an existing table 
alter table store_details
drop column pincode ; 
-- now again adding the same column 'pincode'
alter table store_details
add pincode int;
--update 
--using where clause
update store_details
set pincode=121004 where city='faridabad';
update store_details
set store_location='haryana' where pincode=121004;

