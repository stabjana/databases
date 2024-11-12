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
