'use strict';

const { readStorage, writeStorage } = require('./csvReaderWriter');

const storagePath = './employee.csv';

readStorage(storagePath).then().catch(console.log);