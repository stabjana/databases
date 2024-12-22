use customerdb;

create table customer (
    customerId integer not null primary key,
    firstname varchar(7) not null,
    lastname varchar(10) not null,
    address varchar(18) not null,   
    customerclass varchar(21) not null
);

insert into customer values(2000,'Matt','River','Codepath 2', 'OrdinaryPenPusher');
insert into customer values(7987,'Paula','Irony','Cloudhill 3', 'KeyCustomer');
insert into customer values(6543,'Jeff','Smith','Street 20', 'SolidGold');
insert into customer values(4123,'Sophie','Lake','Bugpath 42', 'ToBeAwoided');
insert into customer values(5000,'Abel','Bell','River side 2', 'R.I.P');
insert into customer values(3000,'Layla','Garcia','Station 5', 'SuperBonus');
insert into customer values(1000,'Olivia','Hammer','Dataway 35', 'VIP');

select * from customer;
select lastname, customerId, customerclass from customer;

select * from customer where lastname='Bell';
select * from customer where firstname='Layla';
select * from customer where lastname='Irony';

update customer set address='River side 2', customerclass='KeyCustomer' where customerId=3000;
update customer set firstname='Layla', customerclass='ToBeAwoided' where customerId=1000;
update customer set address='Codepath 2', lastname='Irony',customerclass='SolidGold' where customerId=3000;
update customer set address='Dataway 35', firstname='Olivia',customerclass='ToBeAwoided' where customerId=7987;

insert into customer values(6543,'Peter','Nana','Dataway 38', 'SuperCustomer');
insert into customer values(7000,'Peter','Hammer','Dataway 38', 'SuperCustomer');

delete from customer where customerId=3000;
delete from customer where customerId=6543;
delete from customer where customerclass='VIP';
delete from customer where firstname='Paula' or firstname='Sophie';
delete from customer where lastname in ('Garcia','Hammer','Smith');