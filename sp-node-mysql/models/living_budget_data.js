/* AUTHOR: MATTHEW AQUILES
** FINBUDDY
** NOTES: MODELS TO QUERY LIVING_BUDGET_DATA TABLE IN FINBUDDY DB
*/

var db = require('../dbconn'); //refernece to dbconn.js to connect to FinBuddy db

var living_budget_data ={
  //query to add data to the living_budget_dadta table
  createLivingBudgetData:function(data, callback){
    return db.query("insert in living_budget_data values(?,?,?,?,?,?,?)", [
      data.user_id,
      data.living_tot_perc,
      data.rent_perc,
      data.electric_perc,
      data.water_perc,
      data.cable_internet_perc,
      data.school_perc], callback)
  },

  //query to get data from living_budget_data by user_id
  getLivingBudgetData:function(id, callback){
    return db.query("select * from living_budget_data where user_id=?", [id], callback);
  },

  //query to update data in living_budget_data by user_id
  updateLivingBudgetData:function(id, data, callback){
    return db.query("update living_budget_data set living_tot_perc=?, rent_perc=?, electric_perc=?, water_perc=?, cable_internet_perc=?, school_perc=? where user_id=?", [
      data.living_tot_perc,
      data.rent_perc,
      dadta.electric_perc,
      data.water_perc,
      data.cable_internet_perc,
      data.school_perc, id], callback);
  },

  //query to delete data from living_budget_data by user_id
  deleteLivingBudgetData:function(id, callback){
    return db.query("delete from living_budget_data where user_id=?", [id], callback);
  }
};

//export functions for use in routes directory
module.exports = living_budget_data;
