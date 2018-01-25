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
	<form class="form-horizontal" action="security_check" method="POST">
	<div class="form-group text-center">
    	<h1>로그인 페이지</h1>
	</div>
	
	<hr>
  		<div class="form-group">
    		<label class="control-label col-sm-4" for="id">아이디 : </label>
    		<div class="col-sm-4">
    			<input type="text" class="form-control" placeholder="아이디 입력" name="UserID" id="id" required>
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="control-label col-sm-4" for="password">비밀번호: </label>
    		<div class="col-sm-4">
    		<input type="password" class="form-control" placeholder="비밀번호 입력" name="UserPW" id="password" required>
			</div>
		</div>
    	<div class="form-group">
    		<div class="col-sm-offset-4 col-sm-4 text-center">
    			<button type="submit">로그인</button>
    			<button type="button" class="cancelbtn" onclick="winClose()">취소</button>
    		</div>
    	</div>
	</form> 
</div>
</body>
</html>