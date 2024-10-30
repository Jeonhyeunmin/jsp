<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2>회 원 전 용 방</h2>
  	<hr>
  	<div>현재 <font size="5px"><b>${sNickName}</b></font>(<font color="red"><b>${strLevel}</b></font>) 님 로그인 중입니다.</div>
  	<hr>
  	<div>총 방문 횟수 : <font color="red"><b>${mVo.visitCnt}</b></font></div>
  	<div>오늘 방문 횟수 :  <font color="red"><b>${mVo.todayCnt}</b></font></div>
  	<div>최종 방문일 : <font color="red"><b>${fn:substring(sLastDate,0,19)}</b></font></div>
  	<div>총 포인트 :  <font color="red"><b>${mVo.point}</b></font></div>
  	<hr>
		<!-- 이름 아이디 닉네임이 같아야 내가 쓴걸로 간주 -->
  	<div>방명록에 작성한 글 수 :  <font color="red">총 <b>__</b>건</font></div>
  	<hr>
  	<div>회원 사진 <img src="${ctp}/images/member/${mVo.photo}" width="300px"/> </div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>