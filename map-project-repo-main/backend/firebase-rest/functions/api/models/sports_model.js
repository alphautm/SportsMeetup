'use strict'

const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class SportsModel extends Model {
    constructor() {
        super('sports')
        if (this.instance) return this.instance
        SportsModel.instance = this
    }
}

module.exports = new SportsModel()