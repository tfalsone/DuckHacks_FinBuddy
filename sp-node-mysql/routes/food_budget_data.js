/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO FOOD_BUDGET_DATA TABLE IN FINBUDDY DB
*/

var express = require('express'),
    router = express.Router(),
    food_budget_data = require('../models/food_budget_data'); //reference to food_budget_data.js file to use defined functions to query table

//get from the food_budget_data table by user_id
router.get('/:id', function(req, res, next){
  food_budget_data.getFoodBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//post call to add data to food_budget_data table
router.post('/', function(req, res, next){
  food_budget_data.createFoodBudgetData(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//put call to update data in food_budget_data table by user_id
router.put('/:id', function(req, res, next){
  food_budget_data.updateFoodBudgetData(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//delete call to delete data from food_budget_data table by user_id
router.delete('/:id', function(req, res, next){
  food_budget_data.deleteFoodBudgetData(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

module.exports = router;
