'use strict';

const mariadb = require('mariadb');

// call the function
testA();

// test function connecting the database
async function testA() {
    const options = {
        // defalut host and port would be used if not defined
        host: 'localhost', //or 127.0.0.1 (mariadb server)
        port: '3306', //mariadb's defalut port (check it from mDb prompt: select @@PORT;)
        user: 'ceo', //no root user (case sensitive)
        password: '999TH',
        database: 'companydb4'
        // allowPublicKeyRetrieval: true // for mysql
    };

    const connection = await mariadb.createConnection(options);
    // try catch normally
    let result = await connection.query('select * from employee');
    console.log(result);

    for (const emp of result) {
        console.log(emp.firstname);
    }

    result = await connection.query('select firstname from employee');
    console.log(result.join(', '));
    console.log(result.map(emp => emp.firstname).join(', '));

    result = await connection.query({ //sql statement need to be in an object in that case
        sql: 'select * from employee', rowsAsArray: true
    });
    console.log(result);

    // instert statements
    const sql = `insert into workerPosition(positionId, positionName, positionRank)
                values(?,?,?)`

    try {
        result = await connection.query(sql, [5, 'programmer', 15]);
        console.log(result);
        // we didnt have auto increment field

    } catch (error) {
        // console.log(error.message); // gives hint about the structure- safety risk
        console.log('sorry an error occured');
    }

    result = await connection.query('select * from workerPosition');
    console.log(result);

    const deletesql = 'delete from workerPosition where positionId=?';
    result = await connection.query(deletesql, 5);
    console.log(result);

    const sql2 = `select firstname, lastname, departmentName, positionName from employee
    natural join department
    natural join workerPosition`
    result = await connection.query(sql2);
    console.log(result);

    const averageSql = `select avg(salary) as average from employee
    where positionId in(?,?)`
    result = await connection.query(averageSql, [1, 2]);
    console.log(result);

    connection.end();

} // need mariadb connector