<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl3_vo.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<body>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<p><br/></p>
	<div class="container">
	<h2>vo 자료 출력</h2>
	<p><button type="button" class="btn btn-success" onclick="location.href='${ctp}/1018/Jstl3Ok1'">vo 자료 출력</button></p>
	<p><button type="button" class="btn btn-info" onclick="location.href='${ctp}/1018/Jstl3Ok2'">vos 자료 출력</button></p>
	  	
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>