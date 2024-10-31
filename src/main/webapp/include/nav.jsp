<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/include/bs4.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script>
	'use strict';
	
	function memberDelete() {
		let ans = confirm("탈퇴하시겠습니까?");
		if(ans){
			location.href = "MemberPwdDeleteCheck.mem";
		}
	}
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <%-- <a class="navbar-brand" href="${ctp}/">HOME</a> --%>
  <a class="navbar-brand" href="${ctp}/" target="_top">HOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="GuestList.gu">Guest</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pds</a>
      </li>
      <c:if test="${!empty sNickName}">
      <li class="nav-item ml-2">
        <div class="dropdown">
			    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
			      Study1
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/study/mapping/Test1">mapping(Directory Pattern)</a>
			      <a class="dropdown-item" href="${ctp}/study/mapping/Test2">mapping(Extension Pattern)</a>
			      <a class="dropdown-item" href="${ctp}/study/mapping/Storage">세션연습</a>
			      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/el.jsp">EL</a>
			      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/JstlMenu.jsp">JSTL 연습</a>
			      <a class="dropdown-item" href="${ctp}/study/database/DbList">DataBase 연습</a>
			      <a class="dropdown-item" href="PassCheckForm.st">암호화 연습</a>
			      <a class="dropdown-item" href="AjaxTest.st">AJAX</a>
			    </div>
			  </div>
      </li>
	      <li class="nav-item ml-2">
	        <div class="dropdown">
				    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
				      MyPage
				    </button>
				    <div class="dropdown-menu">
				      <a class="dropdown-item" href="MemberMain.mem">회원메인방</a>
				      <a class="dropdown-item" href="MemberPasswordCheck.mem">회원정보수정</a>
				      <a class="dropdown-item" href="javascript:memberDelete()">회원탈퇴</a>
				      <c:if test="${sLevel > 1 || sLevel == 0}">
					      <a class="dropdown-item" href="MemberList.mem">회원리스트</a>
					      <a class="dropdown-item" href="#">쪽지보내기</a>
					      <a class="dropdown-item" href="#">일정관리</a>
				      </c:if>
				      <a class="dropdown-item" href="#">포인트사용내역</a>
				      <c:if test="${sLevel == 0}"><a class="dropdown-item" href="AdminMain.ad">관리자메뉴</a></c:if>
				    </div>
				  </div>
	      </li>
      </c:if>
      
      <li class="nav-item">
        <c:if test="${!empty sNickName}"><a class="nav-link" href="MemberLogout.mem">Logout</a></c:if>
        <c:if test="${empty sNickName}"><a class="nav-link" href="MemberLogin.mem">Login</a></c:if>
      </li>
      <li class="nav-item">
        <c:if test="${empty sNickName}"><a class="nav-link" href="MemberJoin.mem">Join</a></c:if>
      </li>
    </ul>
  </div>
</nav>
