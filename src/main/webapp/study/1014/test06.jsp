<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test06.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		'use strict';
		
//		idx가 3이면 '/T06' 서블릿 호출, 4이면 post 방식으로  /T006' 호출 전송, /T06과 T006은 같은 서블릿(Test06.java)이다
		function fCheck(idx) {
			if(idx == 3){
				location.href="/javaGroup/T06";
			}
			else{
				myform.action="/javaGroup/T006";
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>Controller 연습</h2>
  <form name="myform" method="post" action="/javaGroup/Test06">
     <div><input type="submit" value="전송(Post)" class="form-control btn btn-success mb-2"/></div>
     <div><input type="button" value="전송(Get)" class="form-control btn btn-warning mb-2" onclick="location.href='/javaGroup/Test06'" /></div>
     <div><input type="button" value="전송3" class="form-control btn btn-secondary mb-2" onclick="fCheck(3)" /></div>
     <div><input type="button" value="전송4" class="form-control btn btn-info mb-2" onclick="fCheck(4)" /></div>
  </form>
  
</div>
<p><br/></p>
</body>
</html>