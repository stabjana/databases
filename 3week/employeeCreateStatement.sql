drop database if exists employeedb;
create database employeedb;

use employeedb;

create table employee(
    employeeId integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    department varchar(15),
    salary decimal(6,2) -- 9999.99
);

-- inserts in the order of columns in create table

insert into employee values(1,'Matt','River','ict',5000);
insert into employee values(2,'Vera','River',null,null);

-- inserts based on the last given
insert into employee (employeeId,firstname,lastname)
values(3,'Mary','Jane');

-- insert in different order
insert into employee (salary,firstname, department, employeeId, lastname)
values(4000 ,'Henry', 'ict', 4, 'Jane');

-- when you list the colms before it can find all the colms correctly.
insert into employee(employeeId, firstname, lastname, department, salary)
values(5,'Amanda','Green','admin',7000);

insert into employee(employeeId, firstname, lastname, department, salary)
values(6,'Matty','Green','marketing',7000);