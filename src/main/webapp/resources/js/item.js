var app = angular.module("Item", []);
app.controller("item", function($scope, $http, $routeParams, $location){
var item = $(".leftpart a").eq($location.hash()-1).text();
$(".itemtitle").text(item);
$scope.ItemType = {ItemType : $location.hash()};
$scope.itemtest = function(){
		$http.post("item", "", {params: $scope.ItemType})
		  .then(function(result){
			  	$scope.items = result.data.list;
			 }, function(result){
				$scope.items = result.data.list;
		});
	}
	$scope.itemtest();
});