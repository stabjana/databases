'use strict';

const Database = require('./database');
const options = require('./flowerShopOptions.json');

const db = new Database(options);

const sql = require('./sqlStatements.json');

// db.doQuery('select * from farmer').then(console.log).catch(console.log);

/* I have farmerLocation instead of farmLocation! */

async function getAll(allSql) {
    try {
        return db.doQuery(allSql.join(''));

    } catch (error) {
        return error;
    }
};

async function getOrder(orderId) {
    return ('HIER WEITER DANN - Und VORHERIGE DATEN AUF FEHLER ÜBERPRÜFEN')
}

/* s2400789@BC-CWRW4DVTW1-Kannettava-tietokone flowerShopServer % node '/Users/s2400789/Documents/BC_Studies/7_databases/week9/flowerShop/flowerShopServer/databaseLayer.js'
SQL-error(conn:6, no: 1045, SQLState: 28000) Access denied for user 'farmer'@'localhost' (using password: YES)
s2400789@BC-CWRW4DVTW1-Kannettava-tietokone flowerShopServer %  */

getAll(sql.allFarmers).then(console.log).catch(console.log);