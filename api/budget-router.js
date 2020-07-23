/** @format */

const express = require('express');

// database access using knex
const db = require('../data/dbConfig.js');

const router = express.Router();



// /api/accounts/

//Get All - Success
router.get('/', (req, res) => {
	//SELECT * FROM posts;
	db.select('*')
		.from('accounts')
		.then((posts) => res.status(200).json({ data: posts }))
		.catch((err) => console.log(err));
});


//Get by ID - Works
router.get('/:id', (req, res) => {
	const { id } = req.params;
	//select * from posts where id = id;
	db('accounts')
		// .where("id", "=", id) Good to use
		// .where({id: id}) Also, good to use. Also .where({id})
		.where('id', id)
		.first()
		.then((account) => res.status(200).json({ data: account }))
		.catch((err) => console.log(err));
});

//Post to accounts - Works
router.post('/', (req, res) => {
	const postData = req.body;
	// Insert into post (fields...) values (values...)
	db('accounts')
		.insert(postData)
		.then((id) => res.status(201).json({ data: id }))
		.catch((err) => console.log(err));
});

//Update - Works
router.put('/:id', (req, res) => {
	const { id } = req.params;
	const postData = req.body;
	// update posts set field = new value where id = id
	db('accounts')
		.where('id', id)
		.update(postData)
		.then((count) => {
			if (count > 0) {
				res.status(200).json({ data: count });
			} else {
				res.status(404).json({ message: 'Nothing exists there.' });
			}
		})
		.catch((err) => console.log(err));
});
//delete - works
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    db('accounts')
		.where('id', id)
		.del()
		.then((count) => {
			if (count > 0) {
				res.status(200).json({ data: count });
			} else {
				res.status(404).json({ message: 'Nothing exists there.' });
			}
		})
		.catch((err) => console.log(err));
});

module.exports = router;
