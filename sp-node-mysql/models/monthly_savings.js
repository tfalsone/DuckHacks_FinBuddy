/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO QUERY MONTHLY_SAVINGS TABLE IN FINBUDDY DB
*/

var db = require('../dbconn'); //reference to dbconn.js to connect to FinBuddy db

var monthly_savings ={
  //query to add data to monthly_savings table
  addMonthlySavings:function(data, callback){
    return db.query("insert into monthly_savings values(?,?,?,?,?,?)", [
      data.savings_id,
      data.user_id,
      data.month_yr,
      data.amt_save,
      data.amt_made,
      data.amt_spent], callback)
  },

  //query to get data from living budget data by user_id
  getMonthlySavings:function(id, callback){
    return db.query("select * from monthly_savings where user_id=?", [id], callback);
  },

  //query to delete data from monthly_savings table by savings_id
  deleteMonthlySavings:function(id, callback){
    return db.query("delete from monthly_savings where savings_id=?", [id], callback);
  }
};

//dont need an update query because we should not ever need to update this data

//export funcitons for use in routes directory
module.exports = monthly_savings;
