'use strict';

const Model = require('./model');

// Here, we are implementing the class with Singleton design pattern

class ParticipantModel extends Model {
	constructor() {
		super('participants');
		if (this.instance) return this.instance;
		ParticipantModel.instance = this;
	}
}

module.exports = new ParticipantModel();
