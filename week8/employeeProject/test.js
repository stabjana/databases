'use strict';

const Database = require('./database');

const options = require('./employeedbOptions.json');

const db = new Database(options);

(async function () {
    try {
        const result = await db.doQuery('select *from employee');
        console.log(result);
        if (result.resultSet) {
            for (const emp of result.queryResult) {
                console.log(`${emp.firstname} ${emp.lastname}`);
            }
        }

        const insertStatus = await db.doQuery('insert into employee values(?,?,?,?,?)',
            [123, 'Lou', 'Adams', 'ict', 4000]
        );
        console.log(insertStatus);  // comment out after first tim running!

        const removeStatus = await db.doQuery('delete from employee where employeeId=?', [123]);
        console.log(removeStatus); // and comment this  out when adding the upper one

    }
    catch (err) {
        console.log(err);
    }

})();