const Pool = require('pg').Pool
const pool = new Pool({
	user:"flori",
	host:'localhost',
	password:'password',
	port: 5432,
})

const db = require('./queries')

const getPartners = (request, response)=> {
	pool.query('SELECT * FROM places ORDER BY id ASC', (error, results)=> {
		if(error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

const getPartnersById = (request, response)=> {
	pool.query('SELECT * FROM places WHERE id = $1', [id], (error, results)=> {
		if(error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
}

const createPartners = (request, response)=> {
	const { name, email }
} 

module.exports = {
	getUsers,
	getUserById,
	createUser,
	updateUser,
	deleteUser,
}