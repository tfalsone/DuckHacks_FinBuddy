/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO QUERY SAVINGS_BUDGET_DATA TABLE IN FINBUDDY DB
*/

var db = require('../dbconn'); //reference to dbconn.js to connect to FinBuddy db

var savings_budget_data ={
  //query to add data to the living_budget_dadta table
  createSavingsBudgetData:function(data, callback){
    return db.query("insert into savings_budget_data values()", [
      data.user_id,
      data.savings_tot_perc,
      data.to_save_perc,
      data.to_buy_perc,
      data.tot_saved,
      data.purch_goals_acheived], callback)
  },

  //query to get data from living_budget_data by user_id
  getSavingsBudgetData:function(id, callback){
    return db.query("select * from savings_budget_data where user_id=?", [id], callback);
  },

  //query to update data in living_budget_data by user_id
  updateSavingsBudgetData:function(id, data, callback){
    return db.query("update savings_budget_data set savings_tot_perc=?, to_save_perc=?, to_buy_perc=?, tot_saved=?, purch_goals_acheived=? where user_id=?", [
      data.savings_tot_perc,
      data.to_save_perc,
      data.to_buy_perc,
      data.tot_saved,
      data.purch_goals_acheived, id], callback);
  },

  //query to delete data from living_budget_data by user_id
  deleteSavingsBudgetData:function(id, callback){
    return db.query("delete from savings_budget_data where user_id=?", [id], callback);
  }
};

//export functions for use in routes directory
module.exports = savings_budget_data;
