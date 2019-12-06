var express = require('express');
const fs = require('fs');
var router = express.Router();
const request = require('request');
const bodyParser = require('body-parser');

router.use(bodyParser.json())

// var csv2geojson = require('csv2geojson');

var geojson = [{
  "type": "Feature",
  "properties": {
    "accuracy": "point",
    "address": "7600 Southwest Quarry Avenue, Redmond, Oregon 97756, United States",
    "phone": "541 923-5076",
    "products": "Meat, Poultry",
    "name": "Central Oregon Farm"
  },
  "geometry": {
    "coordinates": [
      -121.260588,
      44.209118
    ],
    "type": "Point"
  }
},
{
  "type": "Feature",
  "properties": {
    "accuracy": "point",
    "address": "18130 Mckenzie Highway, Sisters, Oregon 97759, United States",
    "phone": "541 213-6406",
    "products": "Meat, Poultry, Eggs",
    "name": "Cascade Mountains Pasture"
  },
  "geometry": {
    "coordinates": [
      -121.425355,
      44.29337
    ],
    "type": "Point"
  }
},
{
  "type": "Feature",
  "properties": {
    "accuracy": "point",
    "address": "22225 Bear Creek Road, Bend, Oregon 97701, United States",
    "phone": "415 609-3677",
    "products": "Meat, Poultry",
    "name": "Freedom Rock Farms"
  },
  "geometry": {
    "coordinates": [
      -121.211005,
      44.045741
    ],
    "type": "Point"
  }
}]

router.get('/', function(req, res){
  const data = fs.readFileSync('./geodata.geojson');
  res.send(data);
});

router.post('/location', (req, res) => {
  const url = req.body.url;
  request.get(url, (err, response, body) => {
    if (err) {
      res.status(400).send("ERROR!")
    } else {
      if (response.status === 200) {
        console.log(body);
        res.send(body);
      } else {
        console.log(body);
      }
    }
  })
});

router.post('/', function(req, res){
	res.send('POST Something');
});

module.exports = router;
