/*global angular */
var usersApp = angular.module('usersApp', ['ngRoute']);
usersApp.controller('usersListCrtl', function ($scope, $http) {
    "use strict";

    var user_data = {},

        budget_data = {},

        living_budget_data = {},

        savings_budget_data = {},

        monthly_saving = {},

        food_budget_data = {};

    $http.get('http://155.246.213.124:3000/users/' + localStorage["user_id"])
        .success(function (data) {
        user_data = data[0];
        $scope.user_name = user_data["name"]

    });


    $http.get('http://155.246.213.124:3000/budget_data/' + localStorage["user_id"])
        .success(function (data) {
        budget_data = data[0];
        $scope.income_monthly = budget_data["income_monthly"];
        $scope.living_budget = (budget_data["living_perc"]*budget_data["income_monthly"]/100).toFixed(2);
        $scope.savings =(budget_data["savings_perc"]*budget_data["income_monthly"]/100).toFixed(2);
        $scope.savings_perc = budget_data["savings_perc"];
        $(function() {

            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: 'Living',
                    a: (budget_data["living_perc"]*budget_data["income_monthly"]/100)
                }, {
                    y: 'Food',
                    a: (budget_data["food_perc"]*budget_data["income_monthly"]/100).toFixed(2),
                },
                       {
                           y: 'Savings',
                           a:(budget_data["savings_perc"]*budget_data["income_monthly"]/100)
                       }],
                preUnits: '$',
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Money Alotted'],
                barColors: function (row, series, type) {
                    if(row.label == "Living") return "#2bc643";
                    else if(row.label == "Food") return "#4286f4";
                    else if(row.label == "Savings") return "#ba1a1a";
                },
                hideHover: 'auto',
                resize: true
            });
        });
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
    });

    $http.get('http://155.246.213.124:3000/living_budget_data/' + localStorage["user_id"])
        .success(function (data) {
        living_budget_data = data[0];

        $scope.living_budget_perc = living_budget_data["living_tot_perc"];
        $scope.rent_perc = living_budget_data["rent_perc"];
        $scope.electric_perc = living_budget_data["electric_perc"];
        $scope.water_perc = living_budget_data["water_perc"];
        $scope.cable_internet_perc = living_budget_data["cable_internet_perc"];
        $scope.school_perc = living_budget_data["school_perc"];
        $scope.rent = ($scope.rent_perc*$scope.income_monthly/100).toFixed(2);
        $scope.rent = ($scope.rent_perc*$scope.living_budget/100).toFixed(2);
        $scope.electric = ($scope.electric_perc*$scope.income_monthly/100).toFixed(2);
        $scope.water = ($scope.water_perc*$scope.living_budget/100).toFixed(2);
        $scope.cable_internet =($scope.cable_internet_perc*$scope.living_budget/100).toFixed(2);
        $scope.school = ($scope.school_perc*$scope.living_budget/100).toFixed(2);
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
    });

    $http.get('http://155.246.213.124:3000/savings_budget_data/' + localStorage["user_id"])
        .success(function (data) {
        savings_budget_data = data[0];

    });

    $http.get('http://155.246.213.124:3000/food_budget_data/' + localStorage["user_id"])
        .success(function (data) {
        food_budget_data = data[0];
        $scope.food_budget_perc = food_budget_data["food_tot_perc"];
        $scope.food_budget = ($scope.food_budget_perc*$scope.income_monthly/100).toFixed(2);
        $scope.groceries = (food_budget_data["groceries_perc"]*$scope.food_budget/100).toFixed(2);
        $scope.eat_out = (food_budget_data["eat_out_perc"]*$scope.food_budget/100).toFixed(2);
        $scope.social = (food_budget_data["social_perc"]*$scope.food_budget/100).toFixed(2);
        $(function() {

            var data = [{
                label: "Groceries",
                data: food_budget_data["groceries_perc"]
            }, {
                label: "Eating Out",
                data: food_budget_data["eat_out_perc"]
            }, {
                label: "Social",
                data: food_budget_data["social_perc"]
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

    });

    $http.get('http://155.246.213.124:3000/monthly_savings/' + localStorage["user_id"])
        .success(function (data) {
        monthly_saving = data[0];
        $scope.money_spent = ($scope.income_monthly - $scope.food_budget - $scope.living_budget).toFixed(2);
        $scope.money_saved = ($scope.income_monthly - $scope.money_spent).toFixed(2);
        $scope.amt_save = monthly_saving["amt_save"].toFixed(2);
        $scope.amt_made = monthly_saving["amt_made"].toFixed(2);
        $scope.amt_spent = monthly_saving["amt_spent"].toFixed(2);
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

    });


    $(function() {

        Morris.Area({
            element: 'savings-area-chart',
            data: [{
                period: '2017-03',
                saved: 500,
                spent: 1500,
                made: 2000
            }, {
                period: '2017-04',
                saved: 1000,
                spent: 3000,
                made: 4000
            }, {
                period: '2017-05',
                saved: 1500,
                spent: 4500,
                made: 6000
            }, {
                period: '2017-06',
                saved: 2000,
                spent: 6000,
                made: 8000
            }, {
                period: '2017-07',
                saved: 2500,
                spent: 7500,
                made: 10000
            }, {
                period: '2017-08',
                saved: 3000,
                spent: 9000,
                made: 12000
            }, {
                period: '2017-09',
                saved: 3500,
                spent: 10500,
                made: 14000
            }, {
                period: '2017-10',
                saved: 4000,
                spent: 12000,
                made: 16000
            }, {
                period: '2017-11',
                saved: 4500,
                spent: 13500,
                made: 18000
            }, {
                period: '2017-12',
                saved: 5000,
                spent: 15000,
                made: 20000
            }],
            preUnits: '$',
            behaveLikeLine: true,
            fillOpacity: 0.2,
            xkey: 'period',
            ykeys: ['made', 'spent', 'saved'],
            labels: ['Money Made', 'Money Spent', 'Money Saved'],
            pointSize: 3,
            hideHover: 'auto',
            resize: true
        });
    });

    //});
});
