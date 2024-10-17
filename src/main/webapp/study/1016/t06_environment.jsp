<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String hostIp = request.getRemoteAddr();
	request.setAttribute("hostIp2", request.getRemoteAddr());
	pageContext.setAttribute("hostIp3", request.getRemoteAddr());
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t06_environment.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2>서버 환경변수 값 확인</h2>
  	<hr>
  	<div>
  		<div>호스트IP : <%=hostIp%></div>
  		<div>호스트IP : ${hostIp2}</div>
  		<div>호스트IP : ${hostIp3}</div>
  		<div>전송방식 : <%= request.getMethod() %></div>
  		<div>접속프로토콜 : <%= request.getProtocol() %></div>
  		<div>접속(서버)포트 : <%= request.getServerPort() %></div>
  		<div>접속(서버)이름 : <%= request.getServerName() %></div>
  		<div>접속 Context 이름 : <%= request.getContextPath() %></div>
  		<div>접속 URL : <%= request.getRequestURL() %></div>
  		<div>접속 URI : <%= request.getRequestURI() %></div>
  	</div>
	</div>
	<p><br/></p>
	</body>
</html>