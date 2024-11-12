# Databases - intro

Database system (engine):

- can store Data
- contains all Programs to handle the data (database handling programs)
  - manipulating data
  - and manipulating database structure
  - and users, etc.

Relational Databases (eg: MariaDb, MySql)

- SQL language

non-ralational

- noSQL (for example MongoDb)

## links

https://en.wikipedia.org/wiki/Relational_database
https://en.wikipedia.org/wiki/SQL
https://en.wikipedia.org/wiki/NoSQL

https://mariadb.org/ **Tutorial part**

### Datastorage usage (here Database)

`client application`  
(API, for example fetch)
**backend**  
`datastorage layer`  
(API, for example SQL) -> Frontend uses the API  
`database engine`  
(API, read/write disk etc.) -> is done by MariaDb  
`disc storage (permanent disc)`

see also graphic from Ilkka

Data Storage example from Table
ID = every role is different (unique key)

each row is one json or js object
name of table = relations name
usually we combine multiple tables together

## SQL - Structured Query Language

### Create table

```sql
create table person(
    id integer not null primary key,
    firstname varchar(20) not null,
    lastname varchar(30) not null,
    age integer
)
```

##### one column will be written in a row

- not null = cannot be empty
- primary key = will be THE identifier
- varchar variable char (20 chars max) (there is no string)
- lines without not null can be left out when creating a new item

### insert data in the table

```sql
insert into person (id, firstname, lastname, age)
values(1, Matt, River, 25)
```

person = table name
first setting the datensatz
then insert the data with value

### select data from table - how to get data out

```sql
select firstname, age from person;
```

selection with only the data I want.

install homebrew
then mariaDb

#### after installing:

MariaDB [(none)]> show databases;
create database peopledb;
Query OK, 1 row affected (0.003 sec)

MariaDB [(none)]> use peopledb
Database changed

MariaDB [(none)]> create table person(
-> id integer not null primary key,
-> firstname varchar(20) not null,
-> lastname varchar(30) not null,
-> age integer
-> );

MariaDB [peopledb]> insert into person (id,firstname,lastname,age) values(1,'Matt','River',25);
Query OK, 1 row affected (0.059 sec)

MariaDB [peopledb]> select firstname,age from person;
+-----------+------+
| firstname | age |
+-----------+------+
| Matt | 25 |
+-----------+------+
1 row in set (0.001 sec)

exit
