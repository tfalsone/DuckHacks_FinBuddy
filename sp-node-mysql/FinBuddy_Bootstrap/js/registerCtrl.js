var registerApp = angular.module("registerApp", ['ngRoute']);

registerApp.controller('registerCtrl', function($scope, $http) {
    "use strict";
    var mydata = {};

    $scope.submitReg = function() {
        console.log("We are in the function");
        mydata["user_id"] = document.getElementById("email").value;
        mydata["password"] = document.getElementById("password").value;
        mydata["name"] = document.getElementById("name").value;
        //data["create_date"] = new Date();

    $http.post("http://155.246.213.64:3000/users", mydata).success(function (data) {
        if (data.error) {
            console.log("Error:");
            console.log(data);
        } else {
            console.log("Success");
            console.log(data);
        }
    });
  }
});
