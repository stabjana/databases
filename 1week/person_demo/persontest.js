// persontest.js
'use strict';

const persons = require('./persons.json');

/* console.log(persons); */
// in json there are double quotes here we have js object and has single quotes
// these are now js objects, if we want to have json obj we need stringify

/* console.log(JSON.stringify(persons, null, 2)); */

// is important for the server programming

const jr = 'JR';
const newPerson = {
    firstname: 'Marc',
    lastname: `Lake ${jr}`,
    age: 45
}

/* console.log('new', newPerson); */
persons.push(newPerson);
/* 
console.log(persons);
console.log(JSON.stringify(persons, null, 2)); */

function searchByAge(age) {
    const found = [];
    // could use filter but we do here a for loop
    for (const person of persons) {
        if (person.age === age) { // is this destructuring???
            found.push(person);
        }
    }
    return (found);
}

console.log(searchByAge(25));

// we are using the file as a source
// its stored only in memory -  when we run the program again new added "persons" is lost
// is meant for configuration files, not for storage files (program is loaded only once) - we need to do sth else to make a storage and be able to read and write on/ from it


function search(key, value) {
    const found = []; // not assingnin new value, just fill the array, if want overwriting - need let

    for (const person of persons) {
        if (person[key] === value) {
            found.push(person);
        }
    }
    return found;
}

console.log('search: ', search('lastname', 'River'));