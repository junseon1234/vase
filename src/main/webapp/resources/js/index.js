// 앵귤라 모듈 만들기
var app = angular.module("Index", ["ngRoute", "Notice", "Noticedetail", "Item", "Itemdetail", "Order", "Basket", "Mypage"]);
		
// 라우터 처리 부분 (싱글 페이지 적용)
app.config(function($routeProvider){
	$routeProvider.when("/home", {
		templateUrl : "resources/html/contents/home.html"
	}).when("/about", {
		templateUrl : "resources/html/contents/about.html"
	}).when("/notice", {
		templateUrl : "resources/html/contents/notice/notice.html",
		controller : "notice"
	}).when("/noticedetails/:params", {
		templateUrl : "resources/html/contents/notice/noticedetail.html",
		controller : "noticedetail"
	}).when("/qa", {
		templateUrl : "resources/html/contents/qa.html"
	}).when("/mypage", {
		templateUrl : "resources/html/logincontent/mypage.html",
		controller : "mypage"
	}).when("/item", {
		templateUrl : "resources/html/contents/item.html",
		controller : "item"
	}).when("/itemdetails/:params", {
		templateUrl : "resources/html/contents/itemdetail.html",
		controller : "itemdetail"
	}).when("/basket", {
		templateUrl : "resources/html/logincontent/basket.html",
		controller : "basket"
	}).when("/order/:params", {
		templateUrl : "resources/html/contents/order.jsp",
		controller : "order"
	}).otherwise({redirectTo: "/home"});
});

// Index 실행시
app.run(function($rootScope, $http){
	$rootScope.topimage = 'resources/html/base/topimage.html';
	$rootScope.nav = 'resources/html/base/nav.jsp';
	$rootScope.left = 'resources/html/base/left.html';
	$rootScope.footer = 'resources/html/base/footer.html';
	$rootScope.hash = location.hash;
	
	$rootScope.loginchk = function(){
		$http.post("loginCheck").then(data => {
			result = data;
			console.log(data);
		},data => {
			result = data;
			console.log(data);
		});
	}
	
});

