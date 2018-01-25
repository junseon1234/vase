<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/jquery-3.2.1.js"></script>
<script src="resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/accountcss.css">
<script>
function winClose(){
	myWin = window.close();
}	
</script>
<%HashMap <String, Object> order = (HashMap <String, Object>)request.getAttribute("Orders"); %>
<%List<HashMap<String, Object>> orderlist = (List<HashMap<String, Object>>) order.get("list");%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
alert("조회에 성공했습니다");
</script>
</head>
<body>
<h2 style="text-align:center">주문내역</h2>
	<table class="table table-bordered table-basket">	
	<thead>
		<tr>
			<th></th>
			<th>상품명</th>
			<th>수량</th>
			<th>구매일시</th>
			<th>배송상태</th>
		</tr>
	</thead>
	<tbody>
	<% for (int i=0; i<orderlist.size(); i++){
		%><tr>
		  <td><%=i+1%></td>
		  <td><%=orderlist.get(i).get("OrderItem")%></td>
		  <td><%=orderlist.get(i).get("OrderCount")%></td>
		  <td><%=orderlist.get(i).get("OrderDate")%></td>
		  <td><%=orderlist.get(i).get("OrderStatus")%></td></tr><%
	}
	 %>
	</tbody>
</table>
<button type="button" class="btn cancelbtn" onclick="winClose()">닫기</button>
</body>
</html>