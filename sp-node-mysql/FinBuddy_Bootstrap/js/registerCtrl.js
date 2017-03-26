/* global angular, $ */

var registerApp = angular.module("registerApp", ["ngRoute"]);
registerApp.controller("registerCtrl", function ($scope, $html) {
    "use strict";
    $scope.submitReg = function () {
        console.log("We are in the function");
        var data = {};
        data["user_id"] = document.getElementById("email").value;
        data["password"] = document.getElementById("password").value;
        data["name"] = document.getElementById("name").value;
        data["create_date"] = new Date();
    };

    $http.post("http://155.246.213.64:3000/users", data).success(function (data) {
        if (data.error) {
            console.log("Error: ");
            console.log(data);
        } else {
            console.log("Success");
            console.log(data);
        }
    });
});
