'use strict'

const Controller = require('./public_controller')
const model = require('../models/sports_model')

const sportsController = new Controller(model)
module.exports = sportsController.router