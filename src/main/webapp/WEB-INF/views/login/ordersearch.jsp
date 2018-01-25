<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/accountcss.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script>
	function winClose(){
		myWin = window.close();
	}
</script>
<title>로그인</title>
</head>
<body>
<div class="container accountcontainer">
	<form class="form-horizontal" action="ordersearching" method="POST">
	<div class="form-group text-center">
    	<h1>주문내역 조회</h1>
	</div>
	
	<hr>
  		<div class="form-group">
    		<label class="control-label col-sm-4" for="id">조회번호 : </label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control" name="OrderPW" id="id" required>
    		</div>
    	</div>
    	<div class="form-group">
    		<div class="col-sm-offset-4 col-sm-4 text-center">
    			<button type="submit">조회하기</button>
    			<button type="button" class="cancelbtn" onclick="winClose()">취소</button>
    		</div>
    	</div>
	</form> 
</div>
</body>
</html>