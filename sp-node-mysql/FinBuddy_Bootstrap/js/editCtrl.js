/*global angular */
var usersApp = angular.module('populate', ['ngRoute']);
usersApp.controller('populateFields', function ($scope, $http) {
    "use strict";

    $http.get('http://155.246.213.64:3000/budget_data/hbarthol@stevens.edu')
        .success(function (data) {
            var budget_data = data[0];
            $scope.income_monthly = budget_data["income_monthly"];
            $scope.living_budget = (budget_data["living_perc"] * budget_data["income_monthly"] / 100).toFixed(2);
            $scope.savings = (budget_data["savings_perc"] *budget_data["income_monthly"]/100).toFixed(2);
            $scope.savings_perc = budget_data["savings_perc"];

        });
    
    $http.get('http://155.246.213.64:3000/savings_budget_data/hbarthol@stevens.edu')
        .success(function (data) {
            var savings_budget_data = data[0];
            $scope.saving_perc = savings_budget_data["to_save_perc"];
            $scope.spending_perc = 100 - $scope.saving_perc;
            $scope.savings_perc = savings_budget_data["savings_tot_perc"];

        });

    $http.get('http://155.246.213.64:3000/living_budget_data/hbarthol@stevens.edu')
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
    
    $http.get('http://155.246.213.64:3000/food_budget_data/hbarthol@stevens.edu')
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
});
