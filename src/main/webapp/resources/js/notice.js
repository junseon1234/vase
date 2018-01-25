var app = angular.module("Notice", []);
app.controller("notice", function($scope, $http, $routeParams){
	$scope.noticetest = 
		$http.post("notice")
		  .then(function(result){
				$scope.list = result.data.list;
			 }, function(result){
				$scope.list = result.data.list;
		});
});