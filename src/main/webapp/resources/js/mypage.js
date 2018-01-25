var app = angular.module("Mypage", []);
app.controller("mypage", function($scope, $http, $routeParams){
	$scope.http = function(){$http.post("iddupe", "", {params: {id:$(".loginid").text()}})
		  .then(function(result){
			  $scope.mypage = result.data.profile;
			  $scope.orders = result.data.orders;
			 }, function(result){
			  console.log(result);
			  $scope.mypage = result.data.profile;
			  $scope.orders = result.data.orders;
		});
	}
	$scope.http();
});