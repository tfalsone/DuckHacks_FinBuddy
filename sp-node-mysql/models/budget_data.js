/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO QUERY BUDGET_DATA TABLE IN FINBUDDY DB
*/

var db = require('../dbconn'); //reference to dbconn.js to connect to FinBuddy db

var budget_data ={
  //query to add data to the budget_data table
  createBudgetData:function(data, callback){
    return db.query("insert into budget_data values(?,?,?,?,?)", [
      data.user_id,
      data.income_monthly,
      data.food_perc,
      data.living_perc,
      data.savings_perc], callback);
  },

  //get data from budget_data table by user_id
  getBudgetData:function(id, callback){
    return db.query("select * from budget_data where user_id=?", [id], callback);
  },

  //query to update data in budget_data table by user_id
  updateBudgetData:function(id, data, callback){
    return db.query("update budget_data set income_monthly=?, food_perc=?, living_perc=?, savings_perc=? where user_id=?",[
      data.income_monthly,
      data.food_perc,
      data.living_perc,
      data.savings_perc, id], callback);
  },

  //query to delete data from the budget_data table
  deleteBudgetData:function(id, callback){
    return db.query("delete from budget_data where user_id=?", [id], callback);
  }
};

//export fucntions for user in routes directory
module.exports = budget_data;
