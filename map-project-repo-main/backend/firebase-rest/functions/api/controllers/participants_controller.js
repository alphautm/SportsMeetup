'use strict';

const Controller = require('./public_controller');
const model = require('../models/participant_model');

const participantsController = new Controller(model);
module.exports = participantsController.router;
