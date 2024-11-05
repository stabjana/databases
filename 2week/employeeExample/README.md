## Example

employee.json is our storage

if we need to change something, we need to read the whole thing

if there would be thousands of objects...
thats why we need some extra structure there, split the array into smaller arrays or split to value arrays
one has all the ids or names
or split into folders

but if we want to search for some name with the id - then we still need to read all of them one by one
so we need some kind of index files

Matt could be in multiple files

in database engines it is done automatically

but we need to learn how that works:

need to read this files
and write something back

libraries!

readWrite.js

```js
writeStorage("./test.json", { a: 3, b: "wwe" }).then(console.log);
```

its just returning

writes a new file

module.exports = { readStorage, writeStorage };
we can use those outside

layered structure

lowest nearest to database
highest near to api

now storageLayer.js
and testing:
employeeTest.js

## Layer structure

- employee.json = Database
- storageLayer.js = Filters and verwaltet all data
- readerWriter.js = reads and writes the data
- employeeTest.js = working with the data

## why Databases?

- we cant delete or update anything
- what if we want
- all persons should be earning more than 5000
- or persons whose first name is Matt or Mary
- or persons whose salary is between 3000-7000

- -- all fct seperately or create a language that can do all that

- engine, that can do all is built in in Databases

- Database use SQL language or non-SQL Databases that use JS ähnliche Sprachen.

We will do:
mariaDB
mySQL = relational Databases
