use companydb3;

select lastname, firstname,departmentName, positionName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionNumber=positionId;

select lastname, firstname,departmentName, positionName from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionNumber=positionId
where positionName='leader';

select lastname, firstname, departmentName, case
    when positionName='leader' then 'boss'
    else '' end as lead from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join department on departmentNumber=departmentId
inner join workerPosition on positionNumber=positionId
order by lastname asc, firstname asc;

select avg(salary) as average from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join workerPosition on positionNumber=positionId
where positionName='leader';

select firstname, lastname,salary as average from employee
inner join workerOfDepartment on employeeNumber=employeeId
inner join workerPosition on positionNumber=positionId
where positionName='leader';