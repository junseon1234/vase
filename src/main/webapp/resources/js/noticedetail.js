var app = angular.module("Noticedetail", []);
app.controller("noticedetail", function($scope, $http, $routeParams){
$scope.itemtest = 
	$http.post("noticedetail", "", {params: {id:$routeParams.params}})
	  .then(function(result){
		  	$scope.noticedata = result.data;
		  	$(".noticetextarea").append($scope.noticedata.NoticeContent);
		 }, function(result){
			$scope.noticedata = result.data;
	});
});