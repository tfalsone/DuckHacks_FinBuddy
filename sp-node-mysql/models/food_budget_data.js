/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO FOOD_BUDGET_DATA TABLE IN FINBUDDY DB
*/

var db = require('../dbconn'); //reference to dbconn.js to connect to FinBuddy db

var food_budget_data ={
  //query to add data to the food_budget_data table
  createFoodBudgetData:function(data, callback){
    return db.query("insert into food_budget_data values(?,?,?,?,?)", [
      data.user_id,
      data.food_tot_perc,
      data.groceries_perc,
      data.eat_out_perc,
      data.social_perc], callback);
  },

  //get data from food_budget_data table by user_id
  getFoodBudgetData:function(id, callback){
    return db.query("select * from food_budget_data where user_id=?", [id], callback);
  },

  //query to update data in food_budget_data table by user_id
  updateFoodBudgetData:function(id, data, callback){
    return db.query("update food_budget_data set food_tot_perc=?, groceries_perc=?, eat_out_perc=?, social_perc=? where user_id=?",[
      data.food_tot_perc,
      data.groceries_perc,
      data.eat_out_perc,
      data.social_perc, id], callback);
  },

  //query to delete data from the food_budget_data table
  deleteFoodBudgetData:function(id, callback){
    return db.query("delete from food_budget_data where user_id=?", [id], callback);
  }
};

//export functions for user in routes directory
module.exports = food_budget_data;
