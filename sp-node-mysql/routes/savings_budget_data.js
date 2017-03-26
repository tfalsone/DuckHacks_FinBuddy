/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO SAVINGS_BUDGET_DATA TABLE IN FINBUDDY DB
*/

var express = require('express'),
    router = express.Router(),
    savings_budget_data = require('../models/savings_budget_data'); //reference to savings_budget_data.js file in models directory

//get from living_budget_data table by user_id
router.get('/:id', function(req, res, next){
  savings_budget_data.getSavingsBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//post call to add data to living_budget_data table
router.post('/', function(req, res, next){
  savings_budget_data.createSavingsBudgetData(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//put call to update data in living_budget_data table by user_id
router.put('/:id', function(req, res, next){
  savings_budget_data.updateSavingsBudgetData(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//delete call to delete data from living_budget_data table by user_id
router.delete('/:id', function(req, res, next){
  savings_budget_data.deleteSavingsBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

module.exports = router;
