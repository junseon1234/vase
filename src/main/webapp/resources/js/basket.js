var app = angular.module("Basket", []);
app.controller("basket", function($scope, $rootScope, $http, $routeParams){
	$scope.itemtest = function(){$http.post("basketlist", "", {params: {id:$(".loginid").text()}})
		  .then(function(result){
			  	$scope.basket = result.data.list;
			  	if(result.data.list.length==0){
			  		$("tbody").append("<td colspan='7'> <p> 선택하신 상품이 없습니다 </p></td>")
			  	}
			  	$scope.sum = 0;
			  	for (var i = 0; i<$scope.basket.length ; i++){
			  		$scope.sum = $scope.sum + $scope.basket[i].ItemPrice;
			  	}
			  	
			 }, function(result){
				    $("tbody").append("<td colspan='7'> <p> 선택하신 상품이 없습니다 </p></td>")
		});
	}
	$scope.itemtest();
	$scope.itemcount = 1;
	
	
	$scope.basketbuy = function(){
		$(".selchk:checked").each(function(){
			var index = $(".selchk").index(this);
            var item = $("table tr").eq(index+1).find("td").eq(2).text();
            
            $http.post("basketbuy", "", 
            		{params: {id:$(".loginid").text(), item:item}})
            	 .then(function(result){
      				location.href = "#!/order/0";
      			 }, function(result){
      				alert("구매중 오류가 발생했습니다");
      				location.reload();
      		});
		});
	}
	
	$scope.basketdel = function(){
		$(".selchk:checked").each(function(){
			var index = $(".selchk").index(this);
            var item = $("table tr").eq(index+1).find("td").eq(2).text();
            
            $http.post("basketdel", "", 
            		{params: {id:$(".loginid").text(), item:item}})
            	 .then(function(result){
      			 }, function(result){
      		});
		});
		location.reload();
	}
	
	
	$scope.selcheck = function(){
		if($(".selchk").length == $(".selchk:checked").length){
			$("#chkall").prop("checked", true);
		} else {
			$("#chkall").prop("checked", false);
		}
	}
});