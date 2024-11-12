use employeedb;
select * from employee;
select firstname, lastname from employee;
select lastname, firstname from employee;

select distinct lastname from employee;
select distinct lastname from employee order by lastname;
select distinct lastname from employee order by lastname asc;
select distinct lastname from employee order by lastname desc;

select lastname, firstname from employee order by lastname asc, firstname desc;

select lastname, firstname from employee order by salary asc;

select employeeId, firstname, lastname from employee where lastname='River';

select employeeId, firstname, lastname from employee where department='ict';

select employeeId, firstname, lastname from employee where department='ict' and lastname='River';

select employeeId, firstname, lastname from employee where department='ict' or lastname='Green';

select employeeId, firstname, lastname from employee where department is null;


select employeeId, firstname, lastname from employee where lastname<>'River';

select employeeId, firstname, lastname from employee where lastname!='River';


select employeeId,firstname,salary from employee where salary<7000;
select employeeId,firstname,salary from employee where salary>7000;
select employeeId,firstname,salary from employee where salary>=7000;

select count(*) from employee;
select count(salary) from employee; -- how many have salary

select count(*) as numberOfRows from employee;
select count(*) as "number Of Rows" from employee;
select count(*) "number Of Rows" from employee;

select count(*)-count(salary) from employee; -- how many haven't salary
select count(*) from employee where salary is null; -- same thing
select count(*) as salaryMissing from employee where salary is null; -- same thing
select count(*)-count(salary) as  salaryMissing from employee; -- same!

select count(*) as amount from employee;
select lastname, count(*) as amount from employee group by lastname order by amount asc;

select lastname, count(*) as amount from employee 
group by lastname having amount>=2
order by amount desc, lastname asc;

insert into employee (employeeId,firstname,lastname,department)
values(7,'Mary','Brown','ict');

select lastname, count(*) as amount from employee 
group by lastname having amount>=2;

-- other functions than count()
select min(salary) from employee;
select min(salary) as minimum from employee;
select max(salary) as maximum from employee;

select avg(salary) as average from employee;

select round(avg(salary),2) as average from employee; -- rounded version

select sum(salary) as total from employee;

select min(salary) as minimum, max(salary) as maximum from employee;

select min(salary) as minimum, 
max(salary) as maximum,
max(salary)-min(salary) as difference 
from employee;

select max(employeeId)+1 from employee; -- next free ID

select firstname, lastname,rand() as x from employee; -- you can then order by x 

-- in

select firstname, lastname from employee where lastname='Green' or lastname='Brown'; -- oder besser:

select firstname, lastname from employee where lastname in('Green','Brown');

select firstname, lastname from employee where lastname not in('Green','Brown'); -- opposite

-- between ... and

select employeeId, lastname, salary from employee where salary between 4000 and 5000; -- or:

select employeeId, lastname, salary from employee where salary >=4000 and salary<=5000; -- is the same as before (includes always equal as well)

-- like
select firstname, lastname from employee where firstname like 'M%'; -- % means whatever
select firstname, lastname from employee where firstname like 'M_t%'; -- _ skips a letter and then t and then %
select firstname, lastname from employee where firstname like 'M___'; -- 3*_ 4 chars long.
select firstname, lastname from employee where firstname like '%n'; -- all names ending with n

/*
-- odd names with like operation
insert into employee (employeeId,firstname,lastname,department,salary)
values(8,'Mary_Ann','Smith','ict',4500);

insert into employee (employeeId,firstname,lastname,department,salary)
values(9,'Mary-Ann','Smatt','ict',5500);

insert into employee (employeeId,firstname,lastname,department,salary)
values(10,'Mary%Ann','Smull','ict',6500);

select * from employee where firstname like 'Mary_Ann'; -- you get all Mary Anns need esc char
select * from employee where firstname like 'Mary\_Ann'; -- works, you get only 1 Ann with \
select * from employee where firstname like 'Mary\%Ann'; -- get only 1 Ann with \
select * from employee where firstname like 'Mary-Ann'; -- get only 1 Ann because - is ok
*/

