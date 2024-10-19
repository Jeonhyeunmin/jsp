<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
	session.setAttribute("part", "인사과");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t02_resI.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<jsp:include page="/include/Header.jsp" />
	<body>
	<p><br/></p>
	<div class="container">
	<h2>인사과</h2>
	<hr>
	</div>
	<p><br/></p>
	</body>
	<jsp:include page="/include/Footer.jsp" />
</html>