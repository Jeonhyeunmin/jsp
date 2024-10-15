<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test08.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script>
	'use strict'
	
	if('<%=flag%>' == 'no'){
		alert("회원정보를 확인하세요.");
	}
	

</script>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="/javaGroup/1015/Test08Ok2">
  	<div>아이디 : <input type='text' name='mid' class='form-control' placeholder="아이디를 입력해주세요" autofocus/></div>
		<div>비밀번호 : <input type='password' name='pwd' min='1' max='150' placeholder="비밀번호를 입력해주세요" class='form-control mb-2'/></div>
  	<div><input type="submit" value="입력" class="form-control btn btn-success"></div>
  </form>
</div>
<p><br/></p>
</body>
</html>