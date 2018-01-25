var app = angular.module("Order", []);
app.controller("order", function($scope, $rootScope, $http, $routeParams, $timeout){
	
	$scope.unlogin = function(){$http.post("itemdetail", "", {params: {id:$routeParams.params}})
		  .then(function(result){
			  	$scope.order = result.data;
			  	$scope.count = $routeParams.count;
			  	$scope.sum = $routeParams.count * $scope.order.ItemPrice;
			 }, function(result){
				$scope.order = result.data;
		});
	}
	
	
	$scope.loginbasket = function(){$http.post("orderlist", "", {params: {id:$(".loginid").text()}})
		  .then(function(result){
			  	
			  	$scope.order = result.data.list;
			  	$scope.orderuser = result.data.user[0];
			  	$scope.sum = 0;
			  	for (var i = 0; i<$scope.order.length ; i++){
			  		$scope.sum = $scope.sum + $scope.order[i].ItemPrice;
			  	}
			 }, function(result){
				$("tbody").append("<td colspan='7'> <p> 선택하신 상품이 없습니다 </p></td>");
		});
	}
	
	$scope.orderbuy = function(PASWRD, item, count, point, OrderID){
		$http.post("orderbuy", "", {params: 
	{OrderName:$("#username").val(),
	 OrderID:OrderID,
	 OrderPW:PASWRD,
	 OrderItem:item,
	 OrderCount:count,
	 OrderPhone:$("#userphone").val(),
	 OrderAddr1:$("#addr11").val(),
	 OrderAddr2:$("#addr12").val(),
	 TakerName:$("#username2").val(),
	 TakerPhone:$("#userphone2").val(),
	 TakerAddr1:$("#addr21").val(),
	 TakerAddr2:$("#addr22").val(),
	 TakerMessage:$("#sendmsg").val(),
	 Point:point
	}}).then(function(result){
	}, function(result){
	});
	}

	
	$scope.orderbutton = function(){
		var flag = true;
		for(var i = 0; i < $("input:text").length; i++){
			if($("input:text")[i].value == ""){
				flag = false;
			}
		}
		if(flag){
		var PASWRD = Math.floor(Math.random()*899999999)+10000000;
			if($(".loginid").text()==""){
				$(".unlogined .items").each(function(){
					var index = $(".unlogined .items").index(this);
            		var item = $("table .unlogined tr").eq(index).find("td").eq(1).text();
            		var count = $("table .unlogined tr").eq(index).find("td").eq(2).text();
            		var point = $("table .logined tr").eq(0).find("td").eq(5).text().split(" ")[0];
            		var OrderID = "비로그인";
					$scope.orderbuy(PASWRD, item, count, point, OrderID);
				});console.log("비로그인 구매");
				
			} else {
				if($routeParams.params>0){
					$(".unlogined .items").each(function(){
					var index = $(".unlogined .items").index(this);
					var item = $("table .unlogined tr").eq(index).find("td").eq(1).text();
					var count = $("table .unlogined tr").eq(index).find("td").eq(2).text();
					var point = $("table .unlogined tr").eq(0).find("td").eq(5).text().split(" ")[0];
					var OrderID = $(".loginid").text();
					$scope.orderbuy(PASWRD, item, count, point, OrderID);
					});console.log("로그인 직구매");
				} else {
					$(".logined .items").each(function(){
						var index = $(".logined .items").index(this);
						var item = $("table .logined tr").eq(index).find("td").eq(1).text();
						var count = $("table .logined tr").eq(index).find("td").eq(2).text();
						var point = $("table .logined tr").eq(index).find("td").eq(5).text().split(" ")[0];
						var OrderID = $(".loginid").text();
						$scope.orderbuy(PASWRD, item, count, point, OrderID);
						});console.log("로그인 구매");
				}
			}
			
			alert("구매가 완료되었습니다. 조회 비밀번호는 " + PASWRD + " 입니다");
			location.href="#!/home";
		} else {
			alert("모든 입력칸을 작성해주세요!");
		}
        
	}
	
	$scope.sameordtak = function(){
		if($(".same").length == $(".same:checked").length){
			$("#username2").val($("#username").val());
			$("#userphone2").val($("#userphone").val());
			$("#addr21").val($("#addr11").val());
			$("#addr22").val($("#addr12").val());
		} else {
			$("#username2").val("");
			$("#userphone2").val("");
			$("#addr21").val("");
			$("#addr22").val("");
			
		}
	}
	
	if($routeParams.params>0){
		$(".logined").addClass("hide");
		$(".unlogined").removeClass("hide");
		$scope.unlogin();
	} else {
		$(".unlogined").addClass("hide");
		$(".logined").removeClass("hide");
		$scope.loginbasket();
	}
	
});