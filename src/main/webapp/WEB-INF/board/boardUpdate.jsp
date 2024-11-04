<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardUpdate.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	'use strict';
	
	function fCheck(){
		
		
		myform.submit
	}
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<form name="myform" method="post" action="BoardUpdateOk.bo" onsubmit="return fCheck()">
 		<h2 class="text-center">게 시 판 글 수 정</h2>
		<table class="table table-bordered">
	    
	    <!-- 닉네임 -->
	    <tr>
	    	<th class="text-center"><i class="fa-solid fa-user-pen fa-2x"></i></th>
	      <td>
	      	<input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control" readonly/>
      	</td> 
	    </tr>
	    
	    <!-- 글제목 -->
	    <tr class="mb-2">
        <th class="text-center"><i class="fa-solid fa-heading fa-2x"></i></th>
        <td>
          <input type="text" name="title" id="title" value="${vo.title}" class="form-control mr-1" required autofocus/>
        </td>
    	</tr>
    	
    	<!-- 글내용 -->
      <tr class="mb-2">
        <th class="text-center" style="padding-top: 60px"><label for="content" class="form-label"><i class="fa-solid fa-info fa-2x"></i></label></th>
        <td><textarea rows="6" name="content" id="content" class="form-control" required>${vo.content}</textarea></td>
      </tr>
      
      <!-- 공개/비공개 -->
	    <tr>
	    	<th class="text-center"><i class="fa-solid fa-unlock-keyhole fa-2x"></i></th>
	      <td>
	      	<input type="radio" name="openSw" id="openSw1" value="공개" ${vo.openSw == '공개' ? "checked" : ""}/><label for="openSw1">공개</label>
	      	<input type="radio" name="openSw" id="openSw2" value="비공개" class="ml-2" ${vo.openSw == '비공개' ? "checked" : ""}/><label for="openSw2">비공개</label>
      	</td> 
	    </tr>
    </table>
    
    <table class="table table-borderless">
	    <tr>
	    	<td colspan="2">
		      <button type="button" onclick="location.href='BoardContent.bo?idx=${vo.idx}&pag=${pag}'" class="btn btn-secondary mr-2">돌아가기</button>
		      <button type="reset" class="btn btn-warning mr-2">다시입력</button>
	      </td>
	      <td class="text-right">
		      <button type="submit" class="btn btn-primary mr-2">게시글 수정</button>
	      </td>
	    </tr>
    </table>
<%-- 	  <input type="hidden" name="mid" id="mid" value="${sMid}"/> --%>
	  <input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
	  <input type="hidden" name="hostIp" id="hostIp" value="${pageContext.request.remoteAddr}"/>
	  <input type="hidden" name="pag" id="pag" value="${pag}"/>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>