/*global angular */
var usersApp = angular.module('usersApp', ['ngRoute']);
usersApp.controller('usersListCrtl', function ($scope, $http) {
    "use strict";
	//$http.get('http://172.17.10.14:3000/user_info').success(function(data) {
		//console.log(data);
    var userData = {
            "user_id": "hbarthol@stevens.edu",
            "password": "12345",
            "create_date": "3/25/2017",
            "name": "Hunter Bartholomew",
            "age": 20
        },

        budget_data = {
            "user_id": "hbarthol@stevens.edu",
            "income_monthly": 2000,
            "food_perc": 25,
            "living_perc": 25,
            "savings_perc": 50
        },

        living_budget_data = {
            "user_id": "hbarthol@stevens.edu",
            "living_tot_perc": 25,
            "rent_perc": 20,
            "electric_perc": 10,
            "water_perc": 10,
            "cable_internet_perc": 10,
            "school_perc": 50
        },

        savings_budget_data = {
            "user_id": "hbarthol@stevens.edu",
            "savings_tot_perc": 50,
            "to_save_perc": 50,
            "to_buy_perc": 50,
            "tot_saved": 1000,
            "purch_goals_achieved": 0
        },

        monthly_saving = {
            "saving_id": "03/2017-hbarthol@stevens.edu",
            "user_id": "hbarthol@stevens.edu",
            "amt_save": 500,
            "month_yr": "MAR-2017",
            "amt_made": 2000,
            "amt_spent": 1500
        };
    $(function() {

    var data = [{
        label: "Food",
        data: budget_data["food_perc"]
    }, {
        label: "Living",
        data: budget_data["living_perc"]
    }, {
        label: "Savings",
        data: budget_data["savings_perc"]
    }];

    var plotObj = $.plot($("#pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });

});
    $(function() {

    var data = [{
        label: "Rent",
        data: living_budget_data["rent_perc"]
    }, {
        label: "Electric",
        data: living_budget_data["electric_perc"]
    }, {
        label: "Water",
        data: living_budget_data["water_perc"]
    }, {
        label: "Cable/Internet",
        data: living_budget_data["cable_internet_perc"]
    }, {
        label: "School",
        data: living_budget_data["school_perc"]
    }];

    var plotObj = $.plot($("#living-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });
});
    $(function() {

    var data = [{
        label: "Groceries",
        data: 85
    }, {
        label: "Eating Out",
        data: 15
    }];

    var plotObj = $.plot($("#food-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });

});
    $(function() {

    var data = [{
        label: "Spending",
        data: monthly_saving["amt_save"]
    }, {
        label: "Savings",
        data: monthly_saving["amt_spent"]
    }];

    var plotObj = $.plot($("#savings-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });

});

    $scope.user_name = userData["name"];
    $scope.income_monthly = budget_data["income_monthly"].toFixed(2);
    
    $scope.food_budget_perc = budget_data["food_perc"];
    $scope.food_budget = (budget_data["food_perc"]*budget_data["income_monthly"]/100).toFixed(2);
    
    $scope.living_budget_perc = budget_data["living_perc"];
    $scope.living_budget = (budget_data["living_perc"]*budget_data["income_monthly"]/100).toFixed(2);
    
    $scope.rent_perc = living_budget_data["rent_perc"];
    $scope.rent = ($scope.rent_perc*$scope.income_monthly/100).toFixed(2);
    
    $scope.electric_perc = living_budget_data["electric_perc"];
    $scope.electric = ($scope.electric_perc*$scope.income_monthly/100).toFixed(2);
    

	//});
});
