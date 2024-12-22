'use strict';

/* creates params to use in functions */

function insertParameters(car) {
    return [car.carId, car.model, car.price]
}

function updateParameters(car) {
    return [car.model, car.price, car.carId]
}

module.exports = { insertParameters, updateParameters }