# Database class APi

download a diffrent driver and change db class to use actual driver there and change the results to the ones that you want to return from the class method.

if you want to use postgres

example of constructor parameter:

```json
{
  "host": "localhost",
  "port": 3306,
  "user": "zeke",
  "password": "secret",
  "database": "employeedb"
}
```

## **doQuery(sqlStatement, parameterArray)**

Executes the given sqlStatement with given parameters. Returns a promise.

usage info:

### Usage

```js
const result = await db.doQuery("select * from employee");
```

```js
const result = await db.doQuery(
  `insert into employee(employeeId, firstname, lastname, department, salary)
    values(?,?,?,?,?)`,
  [5, "Mary", "Adams", "ict", 5000]
);
```

Returns either resultset [] format of json
or
Returns either resultset as an array (select)

```js
{
    queryResult:[
        {
            "id": 1,
            "firstname": "Matt",
            "lastname": "River",
            "department": "ict",
            "salary": 4000
        },
        {
            "id": 2,
            "firstname": "Vera",
            "lastname": "River",
            "department": "ict",
            "salary": 5000
        }
    ],
    resultSet:true
}
```

or status object (insert, update, delete)

```js
{
    queryResult:{rowsChanged:1, insertId:0, status:0},
    resultSet:false
}
```
