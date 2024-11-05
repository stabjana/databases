/* 
drop database peopledb; 
-> removes database (if there was an error, we can run all this again, then the error is gone) 
can't remove empty database!!!
nur für development-phase, NIE in production! (when it's used in everyday use)
*/

show databases;
drop database peopledb;
create database peopledb;

use peopledb;

create table person( 
    id integer not null primary key, 
    firstname varchar(20) not null, 
    lastname varchar(30) not null,
    membership varchar(30),
    age integer 
);

insert into person (id,firstname,lastname,age) values(1,'Matt','River',25);

select firstname,age from person;

exit
