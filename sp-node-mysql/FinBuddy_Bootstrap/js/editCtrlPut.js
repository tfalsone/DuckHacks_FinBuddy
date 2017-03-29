/* global angular */

var editApp = angular.module('editApp', ['ngRoute']);

editApp.controller('editCtrlPut', function($scope, $http){
    "user strict";

    $scope.submitForm = function() {
        var living_perc = document.getElementById("living").value;
        var rent_perc = document.getElementById("living_rent").value;
        var electric_perc = document.getElementById("living_electric").value;
        var water_perc = document.getElementById("living_water").value;
        var cable_perc = document.getElementById("living_cable").value;
        var school_perc = document.getElementById("living_school").value;

        var food_perc = document.getElementById("food").value;
        var groceries_perc = document.getElementById("food_groceries").value;
        var eat_out_perc = document.getElementById("food_eat_out").value;
        var social_perc = document.getElementById("food_social").value;

        var savings_tot_perc = document.getElementById("savings").value;
        var to_save_perc = document.getElementById("savings_save").value;
        var to_buy_perc = document.getElementById("savings_buy").value;

        var budgetData={};
        budgetData["food_perc"] = food_perc;
        budgetData["living_perc"] = living_perc;
        budgetData["savings_perc"] = savings_perc;

        var livingData={};
        livingData["living_tot_perc"] = living_perc;
        livingData["rent_perc"] = rent_perc;
        livingData["electric_perc"] = electric_perc;
        livingData['water_perc'] = water_perc;
        livingData["cable_internet_perc"] = cable_perc;
        livingData["school_perc"] = school_perc;

        var savings_budget_data={};
        savings_budget_data["savings_tot_perc"] = savings_tot_perc;
        savings_budget_data["to_save_perc"] = to_save_perc;
        savings_budget_data["to_buy_perc"] = to_buy_perc;

        $http.put("http://155.246.213.124:3000/budget_data/"+localStorage["user_id"], budgetData).success(function(data){
            if(data.error){
                console.log("error");
                console.log(data);
            }
            else{
                console.log("success");
                console.log(data);
            }
        });

        $http.put("http://155.246.213.124:3000/living_budget_data/"+localStorage["user_id"], livingData).success(function(data){
            if(data.error){
                console.log("error");
                console.log(data);
            }
            else{
                console.log("success");
                console.log(data);
            }
        });

        $http.put("http://155.246.213.124:3000/savings_budget_data/"+localStorage["user_id"], savings_budget_data).success(function(data){
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
})
