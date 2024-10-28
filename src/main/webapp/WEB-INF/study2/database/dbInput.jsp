<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style type="text/css">
		th {
        text-align: center; /* 가로 가운데 정렬 */
        vertical-align: middle; /* 세로 가운데 정렬 */
        background-color: #eee;
        height: 60px; /* 필요에 따라 높이 조정 */
    }
	</style>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2 class="text-center">회 원 가 입</h2>
  	<form name="myform" method="post" action="${ctp}/study2/database/DbInputOk">
		<table class="table table-bordered">
	    <tr>
	    	<th>성명</th>
	      <td><input type="text" name="name" id="name" class="form-control" autofocus required /></td> 
	    </tr>
	    <tr>
	    	<th>나이</th>
	      <td><input type="number" name="age" id="age" class="form-control" required></td> 
	    </tr>
	    <tr>
	    	<th>성별</th>
	      <td>
	      	<input type="radio" name="gender" id="male" value="남자" checked/><label for="male">남자</label>
	      	<input type="radio" name="gender" id="female" value="여자"/><label for="female">여자</label>
      	</td> 
	    </tr>
	    <tr>
	    	<th>주소</th>
	      <td><input type="text" name="address" id="address" class="form-control" autofocus required /></td> 
	    </tr>
	    <tr>
	    	<td colspan="2" class="text-center">
		      <button type="submit" class="btn btn-secondary mr-2">회원가입</button>
		      <button type="reset" class="btn btn-warning mr-2">다시입력</button>
		      <button type="button" onclick="location.href='${ctp}/study/database/DbList'" class="btn btn-primary">돌아가기</button>
	      </td>
	    </tr>
    </table>
  </form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>