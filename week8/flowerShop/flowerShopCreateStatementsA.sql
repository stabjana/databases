drop database if exists flowershopdb;
create database flowershopdb;
use flowershopdb;

create table farmer(
    farmerId integer not null primary key,
    farmerName varchar(50) not null,
    farmerLocation varchar(40) not null
);

create table growingSite(
    siteId integer not null primary key,
    siteType varchar(30) not null,
    siteDescription varchar(200)
);

create table flower(
    flowerId integer not null primary key,
    flowerName varchar(20) not null,
    unitPrice integer not null,
    siteId integer not null,
    foreign key (siteId) references growingSite(siteId)
);

create table farmer_grows_flower(
    farmerId integer not null, 
    flowerId integer not null,
    primary key(farmerId,flowerId), 
    foreign key(farmerId) references farmer(farmerId),
    foreign key(flowerId) references flower(flowerId)
);

create user if not exists 'farmer'@'localhost';
set password for user 'farmer'@'localhost' = password('secret');

grant all privileges on flowershopdb.* to 'farmer'@'localhost';

insert into farmer values(1, 'Rosamunda', 'Vantaa');
insert into farmer values(2, 'Roses of Rovaniemi', 'Rovaniemi');
insert into farmer values(3, 'Violets and Hyasinth', 'Helsinki');

insert into growingSite values(1, 'sunny', null);
insert into growingSite values(2, 'shadow', null);
insert into growingSite values(3, 'half shadow', null);
insert into growingSite values(4, 'shadow', null);
insert into growingSite values(5, 'dry', 'almost desert like place');

insert into flower values(1, 'Violet', 80, 1);
insert into flower values(2, 'Rose', 100, 1);
insert into flower values(3, 'Tulip', 50, 2);
insert into flower values(4, 'Cactus', 60, 5);

insert into farmer_grows_flower values(1,1);
insert into farmer_grows_flower values(1,2);
insert into farmer_grows_flower values(2,2);
insert into farmer_grows_flower values(3,1);
insert into farmer_grows_flower values(3,3);
insert into farmer_grows_flower values(3,4);



/* farmerId integer not null, --->  primary key together with flower id 
    flowerId integer not null,
    primary key(farmerId,flowerId), --->  farmer can be associated only once with a flower */