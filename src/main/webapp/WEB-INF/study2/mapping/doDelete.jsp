<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>doDelete.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container text-center">
  	<h2>doDelete.jsp</h2>
  	<hr>
  	<div><img src="${ctp}/images/15.jpg" width="500px"></div>
  	<hr>
  	<div class="row">
	  	<div class="col"><a href="deleteOk.do" class="btn btn-danger">삭제하기</a></div>
	  	<div class="col"><a href="${ctp}/study/mapping/Test2" class="btn btn-success">돌아가기</a></div>
  	</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>