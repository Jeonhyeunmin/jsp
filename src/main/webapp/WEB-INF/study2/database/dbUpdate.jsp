<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbUpdate.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script type="text/javascript">
		'use strict';
		
		function deleteCheck(){
			let ans = confirm("삭제하시겠습니까?");
			if(ans == true){
				location.href = "${ctp}/study2/database/DbDeleteOk?idx=${vo.idx}";
			}
			else{
				location.href = "${ctp}/study2/database/DbUpdateOk";
			}
		}
	</script>
	<style type="text/css">
		th{
			text-align: center;
			background-color: #eee;
		}
	</style>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2 class="text-center">회 원 정 보 수 정</h2>
  	<form name="myform" method="post" action="${ctp}/study2/database/DbUpdateOk">
		<table class="table table-bordered">
	    <tr>
	    	<th>성명</th>
	      <td><input type="text" name="name" id="name" value="${vo.name}" class="form-control" autofocus required /></td> 
	    </tr>
	    <tr>
	    	<th>나이</th>
	      <td><input type="number" name="age" id="age" value="${vo.age}" class="form-control" required></td> 
	    </tr>
	    <tr>
	    	<th>성별</th>
	      <td>
	      	<input type="radio" name="gender" id="male" value="남자" <c:if test="${vo.gender=='남자'}">checked</c:if>/><label for="male">남자</label> &nbsp;
	      	<input type="radio" name="gender" id="female" value="여자" <c:if test="${vo.gender=='여자'}">checked</c:if>/><label for="female">여자</label>
      	</td> 
	    </tr>
	    <tr>
	    	<th>주소</th>
	      <td><input type="text" name="address" id="address"  value="${vo.address}" class="form-control" autofocus required /></td> 
	    </tr>
	    <tr>
	    	<td colspan="2" class="text-center">
		      <button type="submit" class="btn btn-primary mr-2">저장</button>
		      <button type="reset" class="btn btn-warning mr-2">다시입력</button>
		      <button type="button" onclick="location.href='${ctp}/study/database/DbList'" class="btn btn-secondary mr-2">취소</button>
		      <button type="button" onclick="deleteCheck()" class="btn btn-danger mr-2">삭제하기</button>
	      </td>
	    </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}"/>
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>