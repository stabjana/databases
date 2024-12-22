select * from information_schema.USER_VARIABLES;
set @x:=1;
select * from information_schema.USER_VARIABLES;
select @x;

set @y=2;
select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;


-- := operator within sql statement

select round(avg(salary),2) from employee;

-- same with variable
select @avg:=round(avg(salary),2) from employee;

select @avg; -- sessional stored variable (when exit db its gone)

select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;

update employee set salary=@avg where salary<@avg;

delete employee from employee where salary<@avg;


-- select ... into

select round(avg(salary),2) into @a from employee;

select @a;

set @z:=(select avg(salary) from employee);
select @z;

select * from information_schema.USER_VARIABLES order by VARIABLE_NAME;

-- remove variables:
flush USER_VARIABLES;

-- RÜCKGÄNGIG MACHEN - wenn irgendwas schief läuft

select * from employee;
start transaction;

select @avg:=round(avg(salary),2) from employee;
update employee set salary=@avg where <@avg;

select * from employee;

rollback; -- cancels all changes after start transaction!
 
select * from employee;

-- with committing:

start transaction;

select @avg:=round(avg(salary),2) from employee;
update employee set salary=@avg where salary<@avg;

commit; -- now they are done and no rollback possible - transation ends and will be written to the disc - all changes become permanent
-- if manipulate multiple tables, with multiple users, we need to use that
 
-- there is autocommit: if you not run the start transaction (then its turned off)
-- you can check from the var if it is on or not
select @@autocommit;
-- in words:
show VARIABLES where Variable_name='autocommit';

-- you can set it on or off:
-- set autocommit=1;

-- autocommit is sessionbased and cant be turned on or off just like that

-- sub transaction

start transaction;
select * from employee;

update employee set salary=1000 where salary is null;

select * from employee;

savepoint a;

update employee set department='x' where department is null;

select * from employee;

rollback to a; -- cancels update after savepoint a

-- creating savepoint outside 

savepoint a; -- doesnt create a savepoint
release savepoint a; -- gives an error