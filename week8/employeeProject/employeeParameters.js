'use strict';

/* creates params to use in functions */

function insertParameters(employee) {
    return [employee.employeeId, employee.firstname, employee.lastname,
    employee.department, employee.salary
    ]
}

function updateParameters(employee) {
    return [employee.firstname, employee.lastname,
    employee.department, employee.salary, employee.employeeId
    ]
}

module.exports = { insertParameters, updateParameters }