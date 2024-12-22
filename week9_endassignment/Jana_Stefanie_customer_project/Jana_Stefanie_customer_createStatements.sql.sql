drop database if exists customerdb;
create database customerdb;

use customerdb;

create table customer (
    customerId integer not null primary key,
    firstname varchar(7) not null,
    lastname varchar(10) not null,
    address varchar(18) not null,   
    customerclass varchar(21) not null
);

select * from customer;

insert into customer values(82,'Britta','Dune','Unterlinden 12', 'Lobbyist');
insert into customer values(83,'Horst','Mausi','Pigstreet 6', 'SuperBonus');


select * from customer;

drop user if exists 'luke'@'localhost';
create user 'luke'@'localhost' identified by '0LYhzaHp';

grant all privileges on customerdb.* to 'luke'@'localhost';