use employeedb;
select * from employee;

-- UPDATE Statements

update employee set department='admin' where employeeId=3;

update employee set salary='6000' where employeeId=3;

-- both at the same time
update employee set salary=5700, department='ict' where employeeId=2;

--everybody gets 10% raise
update employee set salary=round(salary*1.1, 2);     -- no where = for everybody (Null doesn't change)

-- all rivers go to marketing and get salary 3000
update employee set salary=3000, department='marketing' where lastname='River';

/* update employee set salary=4000; */ -- everyone gets 4000.

--- DELETE Statements

/* delete from employee where lastname='Brown'; */

/* delete from employee where firstname='Mary' or firstname='Matt';
delete from employee where firstname in('Mary', 'Matt'); */
