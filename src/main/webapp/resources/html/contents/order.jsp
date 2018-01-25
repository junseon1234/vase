<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page session="false" %>

<table class="table table-bordered table-basket">	
	<thead>
		<tr>
			<th>상품 이미지</th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
			<th>소계</th>
			<th>적립 포인트</th>
		</tr>
	</thead>
	<tbody class="logined">
		<tr data-ng-repeat="rows in order" >
			<td><img data-ng-src="resources/image/{{rows.ItemImgsrc}}.jpg" style="width:25%"></td>
			<td class="items"><a data-ng-href="#!/itemdetails/{{rows.ItemNo}}">{{rows.ItemName}}</a></td>
			<td>{{rows.BasketCount}}</td>
			<td>{{rows.ItemPrice * rows.BasketCount}}원</td>
			<td>{{rows.ItemPrice}}원</td>
			<td>{{rows.ItemPrice * rows.BasketCount * 0.001 | number:0}} Pt</td>
		</tr>
	<tbody class="unlogined">
		<tr>
			<td><img data-ng-src="resources/image/{{order.ItemImgsrc}}.jpg" style="width:25%"></td>
			<td class="items">{{order.ItemName}}</td>
			<td>{{count}}</td>
			<td>{{order.ItemPrice * count}}원</td>
			<td>{{order.ItemPrice}}원</td>
			<td>{{order.ItemPrice * count * 0.001 | number:0}} Pt</td>
		</tr>
	</tbody>
</table>
<h2>합계 : {{sum}}원</h2>
<hr>
	<form class="form-horizontal col-sm-12" action="" method="POST">
	<div class="col-sm-6">
  	<div class="form-group">
  		<h3>주문하시는 분</h3>
	</div>
  	<div class="form-group">
    	<label class="control-label col-sm-4" for="username">이름</label>
    	<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="이름 입력" value="{{orderuser.UserName}}" id="username" required>
    	</div>
	</div>
	
	<div class="form-group">
	<label class="control-label col-sm-4" for="addr">주소</label>
		<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="주소 입력" value="{{orderuser.UserAddress1}}" id="addr11">
    	</div>
    	<div class="col-sm-offset-4 col-sm-8">
    		<input type="text" class="form-control" placeholder="나머지주소 입력" value="{{orderuser.UserAddress2}}" id="addr12">
    	</div>
	</div>
	
	<div class="form-group">
    	<label class="control-label col-sm-4" for="username">핸드폰 번호</label>
    	<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="핸드폰 번호 입력" value="{{orderuser.UserPhone}}" id="userphone">
    	</div>
	</div>
	
	</div>
	<!-- -------------------------- -->
	<div class="col-sm-6">
  	<div class="form-group">
  		<div class="col-sm-6">
  			<h3>받으시는 분</h3>
  		</div>
  		<div class="col-sm-6">
  			배송자 동일 <input type="checkbox" class="same" data-ng-click="sameordtak()">
  		</div>
  		 
	</div>
	<div class="form-group">
    	<label class="control-label col-sm-4" for="username">이름</label>
    	<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="이름 입력" id="username2" required>
    	</div>
	</div>
	<div class="form-group">
    	<label class="control-label col-sm-4" for="username">핸드폰 번호</label>
    	<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="핸드폰 번호 입력" id="userphone2" required>
    	</div>
	</div>
	<div class="form-group">
	<label class="control-label col-sm-4" for="addr">주소</label>
		<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="주소 입력" id="addr21" required>
    	</div>
    	<div class="col-sm-offset-4 col-sm-8">
    		<input type="text" class="form-control" placeholder="나머지주소 입력" id="addr22" required>
    	</div>
		
	</div>
	<div class="form-group">
    	<label class="control-label col-sm-4" for="username">전하실 말씀</label>
    	<div class="col-sm-8">
    		<input type="text" class="form-control" placeholder="이름 입력" id="sendmsg" required>
    	</div>
	</div>
	
	</div>
  </form>
<button data-ng-click="orderbutton()" class="ordersubmit btn btn-primary">구매하기</button>
<H6>회원, 비회원 모두 구매시 발급되는 비밀번호로 조회 가능하며, 구매 회원이실 경우 마이페이지에서 조회 가능합니다.</H6>
<H6>비회원으로 구매하실 경우 포인트는 적립되지 않습니다.</H6>