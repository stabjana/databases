'use strict';

const fs = require('fs').promises;

async function readStorage(storageFile) { // read file is async and it can throw an exception we need try catch
    try {
        const data = await fs.readFile(storageFile, 'utf8');
        return JSON.parse(data); // parsed into js object

    } catch (error) {
        console.log(error.message);
        return []; // we make it simple and it ret an empty array
    }
}
async function writeStorage(storageFile, data) {
    try {
        await fs.writeFile(storageFile,
            JSON.stringify(data, null, 4)), { // number of spaces inside the object code will be written not in a single line

            encoding: 'utf8',
            flag: 'w' // it overwrites an existing file (when append it, it would be appended - here it would be wrong and make it a different format than json) or if it would be re-written again. there can be only one top lvl
        }

        return true;
    } catch (error) {
        console.log(error.message);
        return false;
    }
}

/* writeStorage('./test.json', { a: 3, b: 'wwe' }).then(console.log);
 */// readStorage('./employee.json').then(console.log); 
// this will always read from the file and search from the result and returns the right version from the storage

module.exports = { readStorage, writeStorage };