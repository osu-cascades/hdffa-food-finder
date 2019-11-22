var express = require('express');

var router = express.Router();

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
	res.send(JSON.stringify(geojson));
});

router.post('/', function(req, res){
	res.send('POST Something');
});

module.exports = router;
