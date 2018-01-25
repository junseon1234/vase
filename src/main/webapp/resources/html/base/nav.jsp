<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page session="false" %>
<script>
	function loginOpen(){
		myWin = window.open("login", "new", "width=800, height=550, left=500, top=50");
	}
	function signinOpen(){
		myWin = window.open("signin", "new", "width=800, height=850, left=500, top=50");
	}
	function ordersearchOpen(){
		myWin = window.open("ordersearch", "new", "width=800, height=500, left=500");
	}
</script>
<nav class="navbar navbar-inverse">
	<div class="container">
		<ul class="nav navbar-nav">
			<li><a href="#!/home">Home</a></li>
			<li><a href="#!/about">About</a></li>
			<li><a href="#!/notice">Notice</a></li>
			<li><a href="#!/qa">Q&A</a></li>
		</ul>
		
		<ul class="nav navbar-nav" style="float:right">
		<li><a href="" onclick="ordersearchOpen()">주문확인</a></li>
		<s:authorize access="isAuthenticated()"> <!-- 인증한 사용자 -->
			<li><a href="security_logout">Log Out</a></li>
			<li><a href="#!/mypage" class="loginid"><s:authentication property="name"/></a></li>
			<li><a href="#!/basket">장바구니</a></li>
		</s:authorize>
		<s:authorize access="isAnonymous()"> <!-- 익명 사용자 -->
			<li><a href="" onclick="signinOpen()">Sign In</a></li>
			<li><a href="" onclick="loginOpen()">Log In</a></li>
		</s:authorize>
		</ul>
	</div>
</nav>