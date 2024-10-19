<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <title>testHeader.jsp</title> -->
<%
	String mid = (String) session.getAttribute("mid");
	String part = (String) session.getAttribute("part");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
	
	<script>
  'use strict';
  
  if('<%=mid%>' == '') {
  	alert("로그인후 사용하세요");
  	location.href = "<%=request.getContextPath()%>/study/exam/t02_login/t02_login.jsp";
  }
  
  function logoutCheck() {
  	alert("로그아웃 합니다.");
  	<%
  	session.removeAttribute(mid);
  	session.removeAttribute(part);
  	%>
  	location.href = "<%=request.getContextPath()%>/study/exam/t02_login/t02_login.jsp";
  }
</script>
</head>
<body>
	<p><br/></p>
	<div class="container">
		<div style="width: 100%; height: 80px; font-size: 20px">
			<table style="float: right;">
			<tr>
				<td>
					<div>접속자 : <font color="red"><b>${mid} : ${part} </b></font></div>
				</td>
				<td>
					<div>|</div>
				</td>
				<td>
					<div><a href="javascript:logoutCheck()" style="color: black">로그아웃</a></div>
				</td>
			</tr>
			</table>
			<table>
			<table class="table">
			<tr>
				<td style="text-align: left; padding-top: 25px">
					<a style="font-size: 30px; color: black; font-family: 'Lobster', cursive" href="test10Member.jsp?mid=<%=mid%>">Hy_.min</a>
				</td>
					<td style="text-align: right; padding-top: 35px">
						<a style=" color: gray" href="test10Board.jsp?mid=<%=mid%>">목차1</a>
					</td> 
					<td style="text-align: right; padding-top: 35px">
						<a style=" color: gray" href="test10Board.jsp?mid=<%=mid%>">목차2</a>
					</td> 
					<td style="text-align: right; padding-top: 35px">
						<a style=" color: gray" href="test10Guest.jsp?mid=<%=mid%>">목차3</a>
					</td>
					<td style="text-align: right; padding-top: 35px"> 
					<a style=" color: gray" href="test10Pds.jsp?mid=<%=mid%>">목차4</a>
					</td>
				</tr>
			</table>
			<hr>

		</div>
	</div>
	<p><br/></p>
</body>
</html>
