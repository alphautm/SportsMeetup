// Script:  setup_database.js
// Purpose: An helper tool to upload stock data to firestore
//
// Author: Jumail
// Email: jumail@utm.my
// Github:  github.com/jumail-utm
// Update: 4 Jun 2021

// Add collections and their documents to the database
// Setup the data first manually
// To use your own name for the document, specify the id
// property (The id must be of type string).  Otherwise,
// the document name will be auto-generated

const _collectionsJson = {
	users: [
		{
			id: 'user1',
			name: 'Alexander Holmes',
			photoUrl: 'https://randomuser.me/api/portraits/thumb/men/75.jpg',
			login: 'alex',
			password: '123'
		},
		{
			id: 'user2',
			name: 'Jessica Walters',
			photoUrl: 'https://randomuser.me/api/portraits/thumb/women/75.jpg',
			login: 'jessica',
			password: '123'
		}
	],
	counters: [
		{
			id: 'counter1',
			counter: 0,
			user: 'user1'
		},
		{
			id: 'counter2',
			counter: 0,
			user: 'user2'
		}
	],
	sports: [
		{
			id: 'sports1',
			category: 'Basketball',
			date: 'Jul 20, 2021',
			gender: 'Male',
			imgUrl: 'https://images.idgesg.net/images/article/2017/10/thinkstockbasketball-100739114-large.jpg',
			hostid: 'GWVhLIA4LFPXYLXSs098xeuw85E3',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports2',
			category: 'Badminton',
			date: 'Jul 20, 2021',
			gender: 'Female',
			imgUrl: 'https://cdn.shopify.com/s/files/1/0020/9407/1890/files/shuttles-close-up_480x480.jpg?v=1559295221',
			hostid: 'GWVhLIA4LFPXYLXSs098xeuw85E3',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports3',
			category: 'Badminton',
			date: 'Jul 20, 2021',
			gender: 'Male',
			imgUrl: 'https://www.publicdomainpictures.net/pictures/210000/velka/shuttlecocks-and-badminton-racket.jpg',
			hostid: 'GWVhLIA4LFPXYLXSs098xeuw85E3',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports4',
			category: 'Chess',
			date: 'Jul 20, 2021',
			gender: 'Male',
			imgUrl:
				'https://images.ctfassets.net/3s5io6mnxfqz/wfAz3zUBbrcf1eSMLZi8u/c03ac28c778813bd72373644ee8b8b02/AdobeStock_364059453.jpeg',
			hostid: 'jessica',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports5',
			category: 'Football',
			date: 'Jul 20, 2021',
			gender: 'Male',
			imgUrl: 'https://cdn.britannica.com/51/190751-050-147B93F7/soccer-ball-goal.jpg',
			hostid: 'GWVhLIA4LFPXYLXSs098xeuw85E3',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports6',
			category: 'Basketball',
			date: 'Jul 20, 2021',
			gender: 'Female',
			imgUrl: 'https://images.idgesg.net/images/article/2017/10/thinkstockbasketball-100739114-large.jpg',
			hostid: 'jessica',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		},
		{
			id: 'sports7',
			category: 'Chess',
			date: 'Jul 20, 2021',
			gender: 'Female',
			imgUrl:
				'https://images.ctfassets.net/3s5io6mnxfqz/wfAz3zUBbrcf1eSMLZi8u/c03ac28c778813bd72373644ee8b8b02/AdobeStock_364059453.jpeg',
			hostid: 'jessica',
			time: '10.00pm',
			description: 'Bring your own bottle',
			venue: 'Ktdi taman'
		}
	],
	participants: [
		{
			sportsId: 'sports1',
			participantId: 'jesssica'
		},
		{
			sportsId: 'sports2',
			participantId: 'jesssica'
		},
		{
			sportsId: 'sports3',
			participantId: 'jesssica'
		}
	]
};

const _firestore = require('../api/models/firebase/firebase_admin').firestore();

async function setupDatabase(_req, res, _next) {
	// Start adding the data to the database
	for (const collectionName in _collectionsJson) {
		const collectionData = _collectionsJson[collectionName];

		for (const documentData of collectionData) {
			if (documentData && documentData.id) {
				const documentId = documentData.id;

				// id will not be included in the database. it is used only to name the document
				delete documentData.id;

				const result = await _firestore.collection(collectionName).doc(documentId).set(documentData);
				console.log({ documentId, result });
			} else {
				await _firestore.collection(collectionName).add(documentData);
				console.log('auto gen doc id');
			}
		}
	}

	res.send('Setting Up Database.... Done ');
}

module.exports = setupDatabase;
