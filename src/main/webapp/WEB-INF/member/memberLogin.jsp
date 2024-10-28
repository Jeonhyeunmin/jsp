<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2 class="text-center">회 원 로 그 인</h2>
	 	<form name="myform" method="post" action="MemberLoginOk.mem">
  	<div>아이디를 입력하세요.<input type='text' name='mid' value='admin' class='form-control' autofocus required/></div>
		<div>비밀번호를 입력하세요<input type='password' name='pwd' value='asdf1234' class='form-control mb-2' required/></div>
  	<div>
  	<button type="submit" class="btn btn-success">로그인</button>
  	<button type="reset" class="btn btn-warning">다시 입력</button>
  	<button type="button" onclick="location.href='GuestList.gu'" class="btn btn-secondary">돌아가기</button>
  	<button type="button" onclick="location=href='MemberJoin.st'" class="btn btn-info">회원가입</button>
  	</div>
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>