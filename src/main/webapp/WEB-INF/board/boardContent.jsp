<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardContent.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
	th{
		text-align: center;
		width: 100px;
		background-color: #eee;
	}
</style>
<script type="text/javascript">
	'use strict';
	
	function BoardDelete() {
    	let ans = confirm("현재 게시글을 삭제 하시겠습니까?");
    	if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}";
    }
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<h2 class="text-center">${vo.title}</h2>
 			조회수
 			${vo.readNum}
 			
 			접속IP
 			${vo.hostIp}
 	<table class="table table-bordered">
 		<tr>
 			<th>글쓴이</th>
 			<td>${vo.nickName}</td>
 		</tr>
 		<tr>
 			<th>글쓴날짜</th>
 			<td>${vo.wDate}</td>
 			<th>좋아요</th>
 			<td>${vo.good}</td>
 		</tr>
 		<tr>
 			<th>글제목</th>
 			<td colspan="3">${vo.title}</td>
 		</tr>
 		<tr>
 			<th>글 내용</th>
 			<td colspan="3" style="height: 240px;">${fn:replace(vo.content, newLine, '<br/>')}</td>
 		</tr>
 	</table>
 	<table class="table table-borderless">
	    <tr>
	    	<td colspan="2">
		      <input type="button" value="돌아가기" onclick="location.href='BoardList.bo?pag=${pag}'" class="btn btn-secondary mr-2"/>
	      </td>
	      	<td class="text-right">
	    <c:if test="${sMid == vo.mid || sLevel==0}">
	      	<input type="button" value="수정하기" onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}'" class="btn btn-warning mr-2"/>	
		      <input type="button" value="삭제하기" onclick="BoardDelete()" class="btn btn-danger mr-2"/>
      </c:if>
	      </td>
	    </tr>
  </table>
  
</div>
<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>