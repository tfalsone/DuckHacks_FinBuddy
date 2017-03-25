/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO BUDGET_DATA TABLE IN FINBUDDY DB
*/

var express = require('express'),
    router = express.Router(),
    budget_data = require('../models/budget_data'); //reference to budget_data.js file to use defined functions to query table

//get from the budget_data table by user_id
router.get('/:id', function(req, res, next){
  budget_data.getBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//post call to add data to budget_data table
router.post('/', function(req, res, next){
  budget_data.createBudgetData(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//put call to update data in users table by user_id
router.put('/:id', function(req, res, next){
  budget_data.updateBudgetData(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//delete call to delete data from budget_data table by user_id
router.delete('/:id', function(req, res, next){
  budget_data.deleteBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

module.exports = router;
