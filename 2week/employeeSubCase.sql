use employeedb;

describe employee;

select * from employee;

select lastname, firstname, salary from employee
where salary=(select min(salary) from employee); --employee wit lowest salary compared to others

select lastname, firstname, salary from employee
where salary=(select max(salary) from employee); --employee with max salary compared to others

select avg(salary) from employee;

select lastname,firstname,salary from employee
where salary >(select avg(salary) from employee); --employees with higher salary compared to others than average

update employee set salary=(select coalesce(round(salary*1.1, 2), 3000)) --- just select, not update (deswegen sind 3000 bei NULL nicht eingetragen, nur in der selection sichtbar)
where employeeId in (1,2,7,9);

select employeeId, firstname, lastname, round(salary,1) as salary from employee; -- round example

select coalesce(round(salary*1.1 ,2), 3000) from employee;

-- CASE Statement
bsp. für extra columns

-- with: when and then

select firstname, lastname, salary, case 
  when salary is null then 'salary missing'
  else 'ok' end as checkSalary
from employee;
-- need to have end to end the case

select firstname, lastname, salary, case  -- which one is true first, then it shows the first value inside the column, not all of them
  when salary is null then 'salary missing'
  when salary=(select min(salary) from employee) then 'min'
  when salary=(select max(salary) from employee) then 'max'
  else '' end as minmax
from employee;

select employeeId, case
  when salary is null then 'salary missing'
  when salary=(select min(salary) from employee) then 'min'
  when salary=(select max(salary) from employee) then 'max'
  else '' end as minmax
from employee;

select firstname, lastname, salary,
    case  -- 2 cases
        when salary is null then 'salary missing'
        when salary=(select min(salary) from employee) then 'min'
        when salary=(select max(salary) from employee) then 'max'
        else '' end as minmax,
    case  
        when salary>6000 then 'Top Worker'
        else '' end as bonus
from employee;

-- in which intervall is the salary

select firstname, lastname, salary, case
    when salary is null then 'no value'
    when salary < 4000 then 'less than 4000'
    when salary < 6000 then '4000 <= salary < 6000'
    when salary < 8000 then '6000 <= salary < 8000'
    else 'salary >=8000' end as 'interval'
from employee
order by salary asc;
