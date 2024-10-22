<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>숙제_로그인.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
<%
	Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals("cMid")) {
			pageContext.setAttribute("mid", cookies[i].getValue());
			pageContext.setAttribute("check", "checked");
		}
	}
%>
	<body>
	<p><br/></p>
	<div class="container">
		<h2>로그인</h2>
		<form name="myform" method="post" action="<%=request.getContextPath()%>/exam/t02_loginOk">
	  	<div>아이디를 입력하세요.<input type='text' id="mid" name='mid' value='${mid}' class='form-control' autofocus required/></div>
			<div>비밀번호를 입력하세요<input type='password' name='pwd' class='form-control mb-2' required/></div>
	  	<div>
				<div><input type="checkbox" id="remember" name="remember" class="mt-2 mb-2" ${check} /><label for="remember">아이디저장</label></div>
	  	<button type="submit" class="btn btn-success form-control mb-2">로그인</button>
	  	<button type="reset" class="btn btn-warning form-control mb-2">다시 입력</button>
	  	</div>
	  </form>
	</div>
	<p><br/></p>
	</body>
</html>