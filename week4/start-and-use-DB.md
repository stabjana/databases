# Commands for mariaDB

- mysql.server start
- sudo mysql
- show databases;
- use peopledb;

try the selector
select firstname,age from person;
you get:
+-----------+------+
| firstname | age |
+-----------+------+
| Matt | 25 |
+-----------+------+

create statements in a file and run them
with: (runs the whole code of the script again)

```shell
mysql -u admin -p<filename.sql
```

create user:

we can also drop tables

```shell
drop table employee;
```

```shell
describe employee;
```

-> gives this:
+------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| employeeId | int(11) | NO | PRI | NULL | |
| firstname | varchar(20) | NO | | NULL | |
| lastname | varchar(30) | NO | | NULL | |
| department | varchar(15) | YES | | NULL | |
| salary | decimal(6,2) | YES | | NULL | |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.008 sec)

we create **insert statements** in the same file,
we could also do it in seperate files

### with this command you can see whats in the table

```shell
 select * from employee;
```

## redirecting inputs and output

### redirect output to a file

```shell
$ ls >textfile.txt
```

### redirect input from a file

```shell
$ myProgram < textfile.txt
```

### run script

```shell
$ mysql -u root -p < employeeCreateStatement.sql
```

or

```shell
$ mysql < employeeCreateStatement.sql
```

## SELECT Statements

```shell
select columnList from tableList where searchCriteria group by columnOrComputedValue having filteringCriteria order by sortingCriteria
```

```sql
use employeedb;
select * from employee;
select firstname, lastname from employee;
select lastname, firstname from employee;
```

every name only once.... (to have a dropdown menu:)

```sql
select distinct lastname from employee;
```

and to have it in a alphabet order

```sql
select distinct lastname from employee order by lastname asc;
```

```sql
select lastname, firstname from employee
order by lastname asc, firstname asc;
```

this is the better version for programms:

```sql
select count(*) as numberOfRows from employee;
```

# SUBQUERY

to compare values inside where statements

# create user

```sql
create user 'zeke' @ 'localhost' identified by 'secret';
```

or:

```sql
create user 'zeke'@'localhost';
set password for 'matt'@'localhost' = password('secr');
```

--- could be also server for example

you can have users for one project and can assign rights to them

when getting hacked, you can have the limited rights also to as a protection

## with grant

```sql
grant select, insert on employeedb.employee to 'matt'@'localhost'
```

--- matt is not the enduser! maybe some layer of the program

**@'localhost'** is from where you can connect it (locak machine)
you can put '\*' then you can access it from everywhere
or you can put an IP address to access it from outside
or from a server (then you take localhost:serveraddress)
or from the server in your serverroom (IP) (Backend or rest server) - then no access from outside your serverroom

it grants the privileges

# create user with password:

```sql
create user 'zeke' @ 'localhost' identified by 'secret';
```

show user:

```sql
select user, host, password from mysql.user where user='steffi';
```

login:
mysql -u steffi -p

show all users:

```sql
select user from mysql.user

select user, host, password from mysql.user;
```
