<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>claimList.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<script type="text/javascript">
	'use strict';
	
	function claimViewCheck(flag, idx) {
		$.ajax({
			type : "post",
			url : "ClaimViewCheck.ad",
			data : {
				flag : flag,
				idx : idx
				},
			success: function(res) {
				if(res != "0"){
					if(flag=="NO"){
						alert("게시글을 표시합니다.");
					}
					else{
						alert("게시글을 감춥니다.");
					}
					location.reload();
				}
				else{
					alert("작업실패");
				}
			},
			error: function() {
				alert("전송오류");
			}
		});
	}
	
	function claimDeleteOk(part, partIdx){
		let ans = confirm("현재 신고된 글을 삭제하시겠습니까?");
		if(!ans){
			return false;
		}
		$.ajax({
			type : "post",
			url : "ClaimDeleteOk.ad",
			data : {
				part : part,
				idx : partIdx
			},
			success: function(res) {
				if(res != "0"){
					alert("신고글이 삭제되었습니다.");
					location.reload();
				}
				else{
					alert("신고글 삭제 실패.");
				}
			},
			error: function() {
				alert("전송실패");
			}
		});
		
	}
</script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
<p><br/></p>
<div class="container">
 	<h2 class="text-center">신 고 리 스 트</h2>
 	<table class="table table-hover text-center">
 		<tr class="table table-secondary">
 			<th>번호</th>
 			<th>분류</th>
 			<th>글제목</th>
 			<th>글쓴이</th>
 			<th>신고자</th>
 			<th>신고내역</th>
 			<th>신고날짜</th>
 			<th>처리결과</th>
 		</tr>
 		<c:forEach var="vo" items="${vos}" varStatus="st">
	 		<tr>
	 			<td>${st.count}</td>
	 			<td>${vo.part}</td>
	 			<td>${vo.title}</td>
	 			<td>${vo.mid}</td>
	 			<td>${vo.claimMid}</td>
	 			<td>${vo.claimContent}</td>
	 			<td>${vo.claimDate.substring(0,10)}</td>
	 			<td>
	 				<a href="javascript:claimDeleteOk('${vo.part}' ,${vo.partIdx})" class="badge badge-danger">삭제</a>
	 				<c:if test="${vo.claim == 'OK'}"><a href="javascript:claimViewCheck('NO', '${vo.partIdx}')" class="badge badge-warning">표시하기</a></c:if>
	 				<c:if test="${vo.claim != 'OK'}"><a href="javascript:claimViewCheck('OK', '${vo.partIdx}')" class="badge badge-info">감추기</a></c:if>
	 			</td>
 			</tr>
 		</c:forEach>
 		<tr><td colspan="8" class="m-0 p-0"></td></tr>	
 	</table>
</div>
<p><br/></p>
<jsp:include page="/include/Footer.jsp"/>
</body>
</html>