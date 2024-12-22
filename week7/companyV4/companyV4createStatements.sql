drop database if already exists companydb4;

create database companydb4;

use companydb4;


create table department(
    departmentId integer not null primary key,
    departmentName varchar(30) not null,
    departmentFloor varchar(15) not null
);

create table workerPosition(
    positionId integer not null primary key,
    positionName varchar(20) not null,
    positionRank integer not null
);

create table employee(
    employeeId integer not null primary key,
    firstname varchar(25) not null,
    lastname varchar(35) not null,
    salary decimal(7,2) not null,
    departmentId integer not null,
    positionId integer not null,
    foreign key (departmentId) references department(departmentId),
    foreign key (positionId) references workerPosition(positionId)
);

insert into department (departmentId, departmentName, departmentFloor)
values(1,'ict','basement');

insert into department (departmentId, departmentName, departmentFloor)
values(2,'admin','top-floor');

insert into department (departmentId, departmentName, departmentFloor)
values(3,'maintenance','workshop');


insert into workerPosition(positionId, positionName, positionRank)
values(1,'CEO',1);

insert into workerPosition(positionId, positionName, positionRank)
values(2,'Big Boss',5);

insert into workerPosition(positionId, positionName, positionRank)
values(3,'leader',10);

insert into workerPosition(positionId, positionName, positionRank)
values(4,'worker',20);

insert into employee (employeeId,firstname,lastname,salary,departmentId,positionId)
values(1,'Mary','Jones',7000,1,3);

insert into employee values(2,'Dave','Truck',4000,1,4);
insert into employee values(3,'Amanda','Smith',6000,2,4);
insert into employee values(4,'Matt','River',9000,2,1);
insert into employee values(5,'Vera','Rover',8000,2,2);
insert into employee values(6,'Peter','bond',3000,3,4);

drop user if exists 'ceo'@'localhost';
create user 'ceo'@'localhost' identified by '999TH';
grant all privileges on companydb4.* to 'ceo'@'localhost';


/* with the same names you can use natural join 
   create table employee( ... lastname varchar(35) not null,
    salary decimal(7,2) not null,
    departmentId integer not null,
    positionId integer not null
) ...
*/