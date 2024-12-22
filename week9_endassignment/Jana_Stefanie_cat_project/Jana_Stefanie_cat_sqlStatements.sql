use catdb;

create table cat (
    number integer not null primary key,
    name varchar(12) not null,
    length integer not null,
    weightKg integer not null,   
    yearOfBirth integer not null
);

insert into cat values(2,'Fatzo', 42, 10, 2012);
insert into cat values(5,'Puma', 33, 4, 2000);
insert into cat values(1,'Fluffy', 50, 15, 2005);
insert into cat values(3,'Lion II', 40, 5, 2011);
insert into cat values(7,'Hairball', 35, 7, 2015);
insert into cat values(6,'Zebra', 30, 6, 2018);
insert into cat values(4,'Cute', 32, 3, 1995);

select * from cat;
select number, yearOfBirth, name from cat;

select * from cat where name='Fluffy';
select * from cat where name='Hairball';
select * from cat where yearOfBirth=1995;

update cat set weightKg=3, name='Fatzo' where number=4;
update cat set length= 30, name='Fatzo' where number=1;
update cat set weightKg= 7, length=40, yearOfBirth=2015 where number=5;
update cat set name='Puma', length=40, yearOfBirth=2012 where number=1;

insert into cat values(8,'Kittie', 30, 6, 1995);
insert into cat values(9,'Miau', 50, 12, 2019);
insert into cat values(10,'Fluffy', 45, 10, 2015);
insert into cat values(11,'Puma', 50, 6, 2022);

delete from cat where number=3;
delete from cat where number=7;
delete from cat where yearOfBirth=1995;
delete from cat where yearOfBirth=2015 and weightKg=10;
delete from cat where name='Puma' and length=50 and weightKg=6;