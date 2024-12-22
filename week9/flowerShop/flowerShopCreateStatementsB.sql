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

-- neue create Statements
create table customer(
    customerId integer not null primary key,
    firstname varchar(30) not null,
    lastname varchar(40) not null,
    customerAddress varchar(100) not null
);

create table customerOrder(
    orderId integer not null primary key,
    customerId integer not null,
    orderDate date not null,
    foreign key (customerId) references customer(customerId)
);

create table order_has_flower(
    orderId integer not null,
    flowerId integer not null,
    amount integer not null,
    primary key(orderId, flowerId),
    foreign key (orderId) references customerOrder(orderId),
    foreign key (flowerId) references flower(flowerId)
);
--

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

-- neue inserts
insert into customer values(1, 'Matt', 'River', 'Seapath 3');
insert into customer values(2, 'Mary', 'Jones', 'Dataway 20');

insert into customerOrder values(1,1,'2024-12-10');
insert into customerOrder values(2,1,'2024-11-10');
insert into customerOrder values(3,2,'2024-12-10');

insert into order_has_flower values(1,2,10);
insert into order_has_flower values(2,2,4);
insert into order_has_flower values(3,1,20);
insert into order_has_flower values(3,2,10);

/* farmerId integer not null, --->  primary key together with flower id 
    flowerId integer not null,
    primary key(farmerId,flowerId), --->  farmer can be associated only once with a flower */

insert into customer(customerId,firstname,lastname,customerAddress)
values(3,'Amanda','Brown','Mainstreet 1');

start transaction;

-- add new customer
insert into customerOrder(orderId,customerId,orderDate)
values (4,3,'2024-12-17');
INSERT INTO customerOrder (orderId, orderDate, customerId)
VALUES (4, '2024-06-18', 3);

--add flowers to order
insert into order_has_flower(orderId,flowerId,amount)
values(4,2,10);
insert into order_has_flower(orderId,flowerId,amount)
values(4,3,5);
insert into order_has_flower(orderId,flowerId,amount)
values(4,1,20);

commit;

-- then check
select orderId,orderDate from customerOrder;

select orderId,orderDate from customerOrder
natural join customer
where firstname="Amanda" and lastname="Brown";

select flowerName, unitPrice, amount from flower
natural join order_has_flower
where customerId=2;

select orderDate ,flowerName, unitPrice, amount,unitPrice*amount as total from flower
natural join order_has_flower
natural join customerOrder
where customerId=1;

select customerOrder.orderId, sum(amount*unitPrice) as total from customerOrder
natural join order_has_flower
natural join flower
group by customerOrder.orderId;

select customerOrder.orderId, flowerId ,flowerName, unitPrice, amount,unitPrice*amount as total from flower
natural join order_has_flower
natural join customerOrder
where customerId=1;