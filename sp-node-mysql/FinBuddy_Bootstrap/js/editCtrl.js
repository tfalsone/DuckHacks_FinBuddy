/*global angular */
var usersApp = angular.module('usersApp', ['ngRoute']);
usersApp.controller('populateFields', function ($scope, $http) {
    "use strict";

    $http.get('http://155.246.213.64:3000/budget_data/' + localStorage["user_id"])
        .success(function (data) {
            var budget_data = data[0];
            $scope.income_monthly = budget_data["income_monthly"];
            $scope.living_budget = (budget_data["living_perc"] * budget_data["income_monthly"] / 100).toFixed(2);
            $scope.savings = (budget_data["savings_perc"] *budget_data["income_monthly"]/100).toFixed(2);
            $scope.savings_perc = budget_data["savings_perc"];

        });

    $http.get('http://155.246.213.64:3000/savings_budget_data/' +localStorage["user_id"])
        .success(function (data) {
            var savings_budget_data = data[0];
            $scope.saving_perc = savings_budget_data["to_save_perc"];
            $scope.spending_perc = 100 - $scope.saving_perc;
            $scope.savings_perc = savings_budget_data["savings_tot_perc"];

        });

    $http.get('http://155.246.213.64:3000/living_budget_data/' +localStorage["user_id"])
        .success(function (data) {
            var living_budget_data = data[0];

            $scope.living_budget_perc = living_budget_data["living_tot_perc"];
            $scope.rent_perc = living_budget_data["rent_perc"];
            $scope.electric_perc = living_budget_data["electric_perc"];
            $scope.water_perc = living_budget_data["water_perc"];
            $scope.cable_internet_perc = living_budget_data["cable_internet_perc"];
            $scope.school_perc = living_budget_data["school_perc"];

            $scope.rent = (($scope.rent_perc*($scope.living_budget_perc/100*$scope.income_monthly)/100)).toFixed(2);
            $scope.electric = ($scope.electric_perc*($scope.living_budget_perc/100*$scope.income_monthly)/100).toFixed(2);
            $scope.water = ($scope.water_perc*($scope.living_budget_perc/100*$scope.income_monthly)/100).toFixed(2);
            $scope.cable_internet =($scope.cable_internet_perc*($scope.living_budget_perc/100*$scope.income_monthly)/100).toFixed(2);
            $scope.school = ($scope.school_perc*($scope.living_budget_perc/100*$scope.income_monthly)/100).toFixed(2);

        });

    $http.get('http://155.246.213.64:3000/food_budget_data/' + localStorage["user_id"])
        .success(function (data) {
        var food_budget_data = data[0];
        $scope.food_budget_perc = food_budget_data["food_tot_perc"];
        $scope.eat_out_perc = food_budget_data["eat_out_perc"];
        $scope.social_perc = food_budget_data["social_perc"];

        $scope.food_budget = ($scope.food_budget_perc*$scope.income_monthly/100).toFixed(2);
        $scope.groceries_perc = food_budget_data["groceries_perc"];
        $scope.groceries = (food_budget_data["groceries_perc"]*$scope.food_budget/100).toFixed(2);
        $scope.eat_out = (food_budget_data["eat_out_perc"]*$scope.food_budget/100).toFixed(2);
        $scope.social = (food_budget_data["social_perc"]*$scope.food_budget/100).toFixed(2);

    });

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

        $http.put("http://155.246.213.64:3000/budget_data/"+localStorage["user_id"], budgetData)
          .success(function(data){
               if(data.error){
                console.log("error");
                console.log(data);
            }
            else{
                console.log("success");
                console.log(data);
            }
        });

        $http.put("http://155.246.213.64:3000/living_budget_data/"+localStorage["user_id"], livingData)
          .success(function(data){
            if(data.error){
                console.log("error");
                console.log(data);
            }
            else{
                console.log("success");
                console.log(data);
            }
        });

        $http.put("http://155.246.213.64:3000/savings_budget_data/"+localStorage["user_id"], savings_budget_data)
          .success(function(data){
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
