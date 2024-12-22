drop database if exists cardb;

create database cardb;
use cardb;

create table car(
    carId integer not null primary key,
    model varchar(30) not null,
    price decimal(7,2) not null
);

insert into car (carId,model,price) values(1,'GT',20000);
insert into car (carId,model,price) values(2,'BMW',60000);

/* more will be added from our program in the api */

drop user if exists 'driver'@'localhost';
create user 'driver'@'localhost' identified by '1234';

grant all privileges on cardb.car to 'driver'@'localhost';

select carId, model, price from car;
select carId, model, price from car where carId=1;

update car set model='newModel', price=40000 where carId=1;
delete from car where carId=1;

insert into car (carId,model,price) values(1,'GT',20000);
