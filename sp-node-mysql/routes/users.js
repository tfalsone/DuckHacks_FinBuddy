/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: ROUTES DEFINED FOR REST REQUESTS TO USERS TABLE FINBUDDY DB
*/

var express = require('express'),
    router = express.Router(),
    users = require('../models/users'); //reference to users.js file to use the defined functions to query db

//get from users table
//if there is an id, get by id, else get all users
router.get('/:id?', function(req, res, next) {
  if(req.params.id){
    users.getUserById(req.params.id, function(err, rows){
      if(err){res.json(err);}
      else{res.json(rows);}
    });
  }
  else{
    users.getAllUsers(function(err, rows){
      if(err){res.json(err);}
      else{res.json(rows);}
    });
  }
});

//post call to add user to the users table
router.post('/', function(req, res, next){
  users.addUser(req.body, function(err, count){
    console.log(req.body);
    if(err){res.json(err);}
    else{res.json(req.body);}
  });
});

//put call to update data in users table by user_id
router.put('/:id', function(req, res, next){
  users.updateUser(req.params.id, req.body, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

//delete call to delete data from users table by user_id
router.delete('/:id', function(req, res, next){
  users.deleteUser(req.params.id, function(err, rows){
    if(err){res.json(err);}
    else{res.json(rows);}
  });
});

module.exports = router;
