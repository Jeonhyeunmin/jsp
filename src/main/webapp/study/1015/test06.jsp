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
</head>
<script>
	function fCheck(){
		let mid = myform.mid.value;
		let pwd = myform.pwd.value;
		
		if(mid.trim() == ""){
			alert("아이디를 입력하세요");
			myform.mid.focus();
		}
		else if(pwd.trim() == ""){
			alert("비밀번호를 입력하세요");
			myform.pwd.focus();
		}
		else{
			myform.submit();
		}
	}
</script>
<body>
<p><br/></p>
<div class="container">
  <!-- <form name="myform" method="get" action="test05Ok.jsp"> -->
  <form name="myform" method="post" action="test06Ok.jsp">
  	<div>아이디 : <input type='text' name='mid' value='qwe123' class='form-control' autofocus required/></div>
		<div>비밀번호 : <input type='password' name='pwd' value='1234' min='1' max='150' class='form-control mb-2' required/></div>
  	<div><input type="submit" value="입력" onclick="fCheck()" class="form-control btn btn-success"></div>
  </form>
</div>
<p><br/></p>
</body>
</html>