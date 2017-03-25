/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO QUERY USERS DATABSE IN FINBUDDY DB
*/

var db = require('../dbconn'); //reference to dbconn.js to connect to FinBuddy db

var users ={
  //query all users in users tables
  getAllUsers:function(callback){
    return db.query("select * from users", callback);
  },

  //query for user by uder_id in users table
  getUserById:function(id, callback){
    return db.query("select * from users where user_id=?", [id], callback);
  },

  //query to add a new users to the users table
  addUser:function(User, callback){
    return db.query("insert into users values(?,?,?,?,?)",[
      User.user_id,
      User.password,
      User.name,
      User.age,
      User.create_date], callback);
  },

  //query to update data in users table by user_id
  updateUser:function(id, User, callback){
    return db.query("update users set password=?, name=?, age=?, create_date=? where user_id=?", [
      User.password,
      User.name,
      User.age,
      User.create_date, id], callback);
  },

  //query to delete a user from the users table
  deleteUser:function(id, callback){
    return db.query("delete from users where user_id=?", [id], callback);
  }
};

//export functions for use in routes directory
module.exports = users;
