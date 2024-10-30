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
	  	<div>아이디를 입력하세요.</div>
	 		<div class="input-group">
	  		<input type='text' name='mid' value='${mid}' class='form-control' autofocus required/>
	  		<div class="input-group-append ml-2" style="margin-right: 20%">
		  		<input type="checkBox" id="saveId" name="saveId" style="width: 20px; height: 20px; margin-top: 10px; margin-right: 4px" ${check}/>
		  		<label for="saveId" style="margin-top: 10px">아이디 저장</label>
  			</div>
  		</div>
		<div>비밀번호를 입력하세요<input type='password' name='pwd' value="1234" class='form-control mb-2' required/></div>
  	<div>
	  	<button type="submit" class="btn btn-success">로그인</button>
	  	<button type="reset" class="btn btn-warning">다시 입력</button>
	  	<button type="button" onclick="location=href='MemberJoin.mem'" class="btn btn-info">회원가입</button>
  	</div>
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>