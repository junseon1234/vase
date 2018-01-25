<%@page import="java.util.Calendar"%>
<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/accountcss.css">
<script>
function winClose(){
	myWin = window.close();
}	
	$(document).ready(function(){
		var id;
		
		$(".iddupe").on("click", function(event) {
			id = $("#userid").val();
			$.ajax({
				  url:"iddupe", 
				  type:"post", 
				  data:{"id":id}
			   }).done(function(result){
				   if(id == ""){
					   $(".btnsubmit").removeClass("active");
					   $(".btnsubmit").addClass("disabled");
					   alert("아이디를 입력해주세요");
				   } else if(result == "null"){
					   $(".btnsubmit").removeClass("disabled");
					   $(".btnsubmit").addClass("active");
					   alert("사용 가능한 아이디입니다");
				   } else {
					   $(".btnsubmit").removeClass("active");
					   $(".btnsubmit").addClass("disabled");
					   alert("이미 사용중인 아이디입니다");
				   }
			   });
		});
		
		$("#email2").on("change", function(){
			$("#emailsub").val(this.value);
		})
	});

</script>
<title>회원가입</title>
</head>
<body>
<div class="container accountcontainer">
  <form class="form-horizontal" action="signin" method="POST">
  	<div class="form-group text-center">
    	<h1>회원가입 페이지</h1>
	</div>
	<hr>
  	<div class="form-group">
    	<label class="control-label col-sm-3" for="userid">아이디</label>
    	<div class="col-sm-6">
    		<input type="text" class="form-control" placeholder="아이디 입력" name="UserID" id="userid" required>
    	</div>
    	<button type="button" class="iddupe">중복확인</button>
	</div>
	
    <div class="form-group">
    	<label class="control-label col-sm-3" for="userpw">비밀번호</label>
    	<div class="col-sm-6">
    		<input type="password" class="form-control" placeholder="비밀번호 입력" name="UserPW" id="userpw" required>
    	</div>
	</div>
	<div class="form-group">
    	<label class="control-label col-sm-3" for="username">이름</label>
    	<div class="col-sm-6">
    		<input type="text" class="form-control" placeholder="이름 입력" name="UserName" id="username" required>
    	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-sm-3" for="birth">생일</label>
	<div class="col-sm-6">
		<div style="position:releative; width:33.3%; float:left">
		<select name="birth1" class="form-control">
		<%Calendar oCalendar = Calendar.getInstance();
		for(int i=oCalendar.get(Calendar.YEAR)-80; i<=oCalendar.get(Calendar.YEAR); i++){
			%><option value="<%=i%>"><%=i%>년</option><%
		}%>
		</select>
		</div>
		<div style="position:releative; width:33.3%; float:left">
		<select name="birth2" class="form-control">
		<%
		for(int i=1; i<=12; i++){
			%><option value="<%=i%>"><%=i%>월</option><%
		}%>
		</select>
		</div>
		<div style="position:releative; width:33.3%; float:left">
		<select name="birth3" class="form-control">
		<%
		for(int i=1; i<=31; i++){
			%><option value="<%=i%>"><%=i%>일</option><%
		}%>
		</select>
		</div>
		</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3" for="email">이메일</label>
		<div class="col-sm-6">
			<div style="position:releative; width:30%; float:left">
				<input type="text" placeholder="메일 입력" name="Email1" class="form-control" id="email1" required>
			</div>
			<div style="position:releative; width:5%; float:left" class="text-center">
			@
			</div>
		<div style="position:releative; width:30%; float:left">
			<input type="text" class="form-control" name="Email2" id="emailsub">
		</div>
		<div style="position:releative; width:35%; float:left">
			<select class="form-control" id="email2">
				<option>직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="google.com">google.com</option>
			</select>
		</div>
		</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3" for="phone">전화번호</label>
	<div class="col-sm-6">
		<div style="position:releative; width:30%; float:left">
		<select class="form-control" name="Phone1" id="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
		</select>
		</div>
		<div style="position:releative; width:5%; float:left" class="text-center">
		-
		</div>
		<div style="position:releative; width:30%; float:left">
			<input type="text" class="form-control" name="Phone2" id="phone2" required>
		</div>
		<div style="position:releative; width:5%; float:left" class="text-center">
		-
		</div>
		<div style="position:releative; width:30%; float:left">
			<input type="text" class="form-control" name="Phone3" id="phone3" required>
		</div>
	</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-3" for="addr">주소</label>
		<div class="col-sm-6">
    		<input type="text" class="form-control" placeholder="주소 입력" name="UserAddress1" id="addr1" required>
    	</div>
    	<div class="col-sm-offset-3 col-sm-6">
    		<input type="text" class="form-control" placeholder="나머지주소 입력" name="UserAddress2" id="addr2" required>
    	</div>
		
	</div>
	<hr>
	<div class=" text-center">
    	<button type="submit" class="btn btn-primary disabled btnsubmit">가입하기</button>
    	<button type="button" class="btn cancelbtn" onclick="winClose()">취소</button>
    </div>
  </form>
</div> 
</body>
</html>