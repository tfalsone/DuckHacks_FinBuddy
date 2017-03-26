var getStartedApp = angular.module('getStartedApp', ['ngRoute']);

getStartedApp.controller('getStartedCtrl', function($scope, $http){
  "user strict";

  $scope.submitForm = function(){
    var rentInput = document.getElementById("rent").value;
    var electricInput = document.getElementById("electric").value;
    var water_input = document.getElementById("water").value;
    var cableInput = document.getElementById("cable_internet").value;
    var tuitionInput = document.getElementById("tuition").value;
    var totLiving = parseInt(rentInput) + parseInt(electricInput) + parseInt(water_input) + parseInt(cableInput) + parseInt(tuitionInput);
    var incomeInput = document.getElementById("inputSuccess").value;

    var rent_perc = (rentInput/totLiving)*100;
    var electric_perc = (electricInput/totLiving)*100;
    var water_perc = (water_input/totLiving)*100;
    var cable_perc = (cableInput/totLiving)*100;
    var school_perc = (tuitionInput/totLiving)*100;

    var living_perc = (totLiving/incomeInput)*100;
    var num = 50 - living_perc;
    var savings_perc = (20 + num/2);
    var food_perc = 100 - living_perc - savings_perc;

    var budgetData={};
    budgetData["user_id"] = localStorage["user_id"];
    budgetData["income_monthly"] = incomeInput;
    budgetData["food_perc"] = food_perc;
    budgetData["living_perc"] = living_perc;
    budgetData["savings_perc"] = savings_perc;

    var livingData={};
    livingData["user_id"] = localStorage["user_id"];
    livingData["living_tot_perc"] = living_perc;
    livingData["rent_perc"] = rent_perc;
    livingData["electric_perc"] = electric_perc;
    livingData['water_perc'] = water_perc;
    livingData["cable_internet_perc"] = cable_perc;
    livingData["school_perc"] = school_perc;

    $http.post("http://155.246.213.64:3000/budget_data", budgetData).success(function(data){
      if(data.error){
        console.log("error");
        console.log(data);
      }
      else{
        console.log("success");
        console.log(data);
      }
    });

    $http.post("http://155.246.213.64:3000/living_budget_data", livingData).success(function(data){
      if(data.error){
        console.log("error");
        console.log(data);
      }
      else{
        console.log("success");
        console.log(data);
      }
    });
  }
});
