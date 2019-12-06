const express = require('express');
const app = express();
const port = 3000;
var cors = require('cors');
var partners = require('./partners.js');

app.use(cors({
	credentials: true,
}));

app.use('/partners', partners);
app.use(express.static('root.github.io'))

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/src/index.html');
})

app.listen(port, () => {
    console.log(`app running on port ${port}`)
})
