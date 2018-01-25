<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Index">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<title>Home</title>

<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/css_extra.css">
<script type="text/javascript" src="resources/angular/angular.min.js"></script>
<script type="text/javascript" src="resources/angular/angular-route.min.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>
<script type="text/javascript" src="resources/js/notice.js"></script>
<script type="text/javascript" src="resources/js/noticedetail.js"></script>
<script type="text/javascript" src="resources/js/item.js"></script>
<script type="text/javascript" src="resources/js/itemdetail.js"></script>
<script type="text/javascript" src="resources/js/order.js"></script>
<script type="text/javascript" src="resources/js/basket.js"></script>
<script type="text/javascript" src="resources/js/mypage.js"></script>
<script>
  $(document).ready(function(){
	
	
    $('.rightarea .upward').click(function () { 
      $('html, body').animate({ 
    	  scrollTop:0 
    	  }, 'fast');
      return false;
    });
  });
</script>
</head>
<body>
	<div data-ng-include="topimage"></div>
	<div data-ng-include="nav"></div>
	
	<div class="container">
      	<div class="row">
			<div class="left-include col-lg-3" data-ng-include="left"></div>
			<div class="col-lg-9" data-ng-view></div>
		</div>
	</div>
	
	<footer class="text-center" data-ng-include="footer"></footer>
	
	<div class="rightarea text-center">
	<div class="rightarea-box upward"><img src="resources/image/etc/up_icon.png"></div>
	</div>
	
</body>
</html>