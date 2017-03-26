/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO MONTHY_SAVINGS TABLE IN FINBUDDY DB
*/

var express = require('express'),
    router = express.Router(),
    monthly_savings = require('../models/monthly_savings'); //reference to monthly_savings.js file in modules directory

//get from monthly_savings table by user_id
router.get('/:id', function(req, res, next){
  monthly_savings.getMonthlySavings(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//post call to add data to monthly_savings table
router.post('/', function(req, res, next){
  monthly_savings.addMonthlySavings(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//delete call to delete data from monthly_savings table by savings_id
router.delete('/:id', function(req, res, next){
  monthly_savings.deleteMonthlySavings(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//again, no put call because we should not ever need to update this information since it is basically historical data

module.exports = router;
