var login_page = angular.module('login', ['ngRoute']);

login_page.controller('login', function($scope, $http){
  "use strict";

  //TODO: need to update this url to get from whatever account is signed in
  $http.get('http://155.246.213.64:3000/budget_data/' + localStorage["user_id"])
    .success(function(data){
      
    });
});
