const Pool = require('pg').Pool
const pool = new Pool({
	user:"flori",
	host:'localhost',
	password:'password',
	port: 5432,
})