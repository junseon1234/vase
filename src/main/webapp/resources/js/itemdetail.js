var app = angular.module("Itemdetail", []);
app.controller("itemdetail", function($scope, $rootScope, $http, $routeParams){
	$scope.itemtest = function(){$http.post("itemdetail", "", {params: {id:$routeParams.params}})
		  .then(function(result){
			  	$scope.itemdata = result.data;
			  	$rootScope.selectitem = $scope.itemdata;
			 }, function(result){
				$scope.itemdata = result.data;
		});
	}
	$scope.itemtest();
	$(document).ready(function(){
	$scope.basketin = function(){
		var itemname = $(".itemname").text();
		itemname
		if($(".loginid").text() == ""){
			alert("먼저 로그인을 해주세요.");
		} else {
			$http.post("basketin", "", {params: 
			{id:$(".loginid").text(), item:itemname, count:$(".itemcount").val()}
				}).then(function(result){
				  	if(result.data.status==1){
				  		alert("장바구니에 등록되었습니다.");
				  	} else {
				  		alert("이미 같은 상품이 등록되어있습니다.");
				  	}
				 }, function(result){
					console.log(result);
			});
		}
		}
	});
	$scope.itemcount = 1;
	
	
	$scope.countup = function(){
		$scope.itemcount++;
		if($scope.itemcount > 999){
			alert("최대 999개만 가능합니다");
			$scope.itemcount = 999;
		}
	}
	
	$scope.countdown = function(){
		$scope.itemcount--;
		if($scope.itemcount < 1){
			alert("최소 구매수량은 1입니다");
			$scope.itemcount += 1;
		}
	}
});