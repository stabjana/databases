drop database if exists catdb;
create database catdb;

use catdb;

create table cat (
    number integer not null primary key,
    name varchar(12) not null,
    length integer not null,
    weightKg integer not null,   
    yearOfBirth integer not null
);

select * from cat;

insert into cat values(13,'Kittie', 30, 3, 2020);
insert into cat values(12,'Miau', 50, 4, 2019);

select * from cat;

drop user if exists 'leo'@'localhost';
create user 'leo'@'localhost' identified by 'nKHXK0Qa';

grant all privileges on catdb.* to 'leo'@'localhost';