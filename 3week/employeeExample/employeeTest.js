'use strict';

const {
    getAllFromStorage,
    getFromStorage,
    addToStorage
} = require('./storageLayer');

// getFromStorage(1).then(console.log);
//getFromStorage('River', 'lastname').then(console.log);

// getAllFromStorage().then(console.log); // prints out all employees from the storage

// somewhere from the storage comes the data, doesnt know where it comes from

// same upper layer can be used with different backends

const newPerson = {
    "id": 5,
    "firstname": "Amanda",
    "lastname": "Lavender",
    "department": "fee",
    "salary": 9000
};

addToStorage(newPerson).then(console.log);