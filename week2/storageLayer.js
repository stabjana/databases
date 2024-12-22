'use strict';

const { readStorage, writeStorage } = require('./readerWriter');

// we create a const for filename

const storageFilePath = './employee.json'; // so we can use it later in our functions

async function getAllFromStorage() {
    return await readStorage(storageFilePath); // it should be waiting that its been read
}
// reads the whole storage and returns it - will be always the latest version becaus it always reads the storage file

// we export it and then make a test function - test main (=> would be user interface) employeeTest.js

/* async function getFromStorage(value, key = 'id') {
    const found = [];

    const persons = await readStorage(storageFilePath); // here comes the data - reading the data from the persons array
    for (const person of persons) {
        if (person[key] == value) {
            found.push(person);
        }
    }
    return found;
} */

async function getFromStorage(value, key = 'id') { //same result as before
    return (await readStorage(storageFilePath))
        .filter(person => person[key] == value);
}

// that will be adding something: append-part (can't just append it. first read, then can push it then I write it back)

async function addToStorage(newObject) {
    const storage = await readStorage(storageFilePath); // not this layers decision to to do. just obeys the order

    // console.log(storage);

    storage.push(newObject);

    // console.log(storage);

    return await writeStorage(storageFilePath, storage); // overwrites the existing file
}


module.exports = {
    getAllFromStorage,
    getFromStorage,
    addToStorage
}

// we cant delete or update anything
// what if we want 
// all persons should be earning more than 5000
// or persons whose first name is Matt or Mary
// or persons whose salary is between 3000-7000

// -- all fct seperately or create a language that can do all that

// engine, that can do all is built in in Databases 

// Database use SQL language or non-SQL Databases