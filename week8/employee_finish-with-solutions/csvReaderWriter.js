'use strict';

const fs = require('fs');
const readline = require('readline');

async function readStorage(storageFile, readline) {
    try {
        const lineread = readline.createInterface({
            input: fs.createReadStream(storageFile)

        });
        const lines = [];
        for await (const line of linereader) {
            lines.push(line)
        }
        const data = [];
        for (const line of lines) {
            data.push(line.split('","').map(d => d.replace(/["]/g, '')));
        }
        return csvToJson(data);

    }
    catch (err) {
        return [];
    }
}

async function writeStorage(storageFilePath, data) {
    try {
        await fs.writeFile(storageFilePath,
            JSON.stringify(data, null, 4), {
            encoding: 'utf8',
            flag: 'w'
        }
        );
        return true;
    }
    catch (err) {
        return false;
    }
}

function csvToJson(data) {
    const [headers, ...datalines] = data;
    /*    console.log(headers);
       console.log(datalines); */
    const jsonData = [];
    for (const line of datalines) {
        if (line.length === headers.length) {
            const item = {};
            for (let i = 0; i < headers.length; i++) {
                item[header[i]] = line[i];
                jsonData.push(item);
            }
        }
    }
    return jsonData;
}

function createCSV(jsondata) {
    // hier könnte Ihre Funktion stehen! 
}

module.exports = { readStorage, writeStorage }

