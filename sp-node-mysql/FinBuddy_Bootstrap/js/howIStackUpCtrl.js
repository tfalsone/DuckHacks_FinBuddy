var howIStackUpApp = angular.module('howIStackUpApp', ['ngRoute']);

howIStackUpApp.controller('howIStackUpCtrl', function($scope, $http){
  "use strict";

  //TODO: need to update this url to get from whatever account is signed in
  $http.get('http://155.246.213.64:3000/budget_data/matt@gmail.com')
    .success(function(data){
      //console.log(data);
      //console.log(data[0]["food_perc"]);
      $scope.food_perc = data[0]["food_perc"];
      $scope.living_perc = data[0]["living_perc"];
      $scope.savings_perc = data[0]["savings_perc"];
    });
});
