<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestInput.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2 style="text-align: center;">방 명 록 글 쓰 기</h2>
  	<form name="myform" method="post" action="GuestInputOk.gu" class="was-validated">
    <div class="form-group">
      <label for="name">성명</label>
      <input type="text" class="form-control" id="name" value="${sNickName}" readonly placeholder="이름을 입력해주세요." name="name" autofocus required>
      <div class="valid-feedback">확인</div>
      <div class="invalid-feedback">성명을 입력하세요</div>
    </div>
    <div class="form-group">
      <label for="email">이메일</label>
      <input type="text" class="form-control" id="email" value="${email}" placeholder="이메일을 작성해주세요." name="email">
    </div>
    <div class="form-group">
      <label for="homePage">홈페이지</label>
      <input type="text" class="form-control" id="homePage" value="http://" name="homePage">
    </div>
    <div class="form-group">
      <label for="content">방문소감</label>
      <textarea rows="5" class="form-control" id="content" placeholder="방문 소감을 작성해주세요." name="content" required></textarea>
      <div class="valid-feedback">확인.</div>
      <div class="invalid-feedback">방문 소감을 작성해주세요.</div>
    </div>
    <div class="form-group text-center">
	    <button type="submit" class="btn btn-primary">등록</button>
	    <button type="reset" class="btn btn-warning">다시입력</button>
	    <button type="button" onclick="location.href='GuestList.gu'" class="btn btn-secondary">돌아가기</button>
    </div>
    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}">
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>