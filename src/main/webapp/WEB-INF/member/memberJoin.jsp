<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberJoin.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		th{
			width: 100px
		}
	</style>
	<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<div class="container">
	<h2 class="text-center">회 원 가 입</h2>
		<form name="myform" method="post" action="#">
			<table class="table table-bordered">
		    <tr>
		    	<th class="text-center"><i class="fa-regular fa-address-card fa-2x"></i></th>
		      <td><input type="text" name="mid" id="mid" class="form-control" placeholder="아이디를 입력하세요" autofocus required /></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-key fa-2x"></i></th>
		      <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control" required></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-user-pen fa-2x"></i></th>
		      <td><input type="text" name="nickName" id="nickName" placeholder="닉네임을 입력하세요" class="form-control" required /></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-user fa-2x"></i></th>
		      <td><input type="text" name="name" id="name" placeholder="성명을 입력하세요" class="form-control" required /></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-venus-mars fa-2x"></i></th>
		      <td>
		      	<input type="radio" name="gender" id="male" value="남자"/><label for="male">남자</label>
		      	<input type="radio" class="ml-2" name="gender" id="female" value="여자" checked/><label for="female">여자</label>
	      	</td> 
		    </tr>
	      	<tr>
	    	<th class="text-center"><i class="fa-solid fa-cake-candles fa-2x"></i></th>
		      <td>
		      	<input type="date" name="birthday" id="birthday" class="form-control" required />
	      	</td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-phone fa-2x"></i></th>
		      <td>
		      	<div class="input-group">
			      	<select class="form-control">
			      		<option value="010">010</option>
			      		<option value="011">011</option>
			      		<option value="016">016</option>
			      		<option value="017">017</option>
			      		<option value="018">018</option>
			      		<option value="019">019</option>
			      		<option value="031">031</option>
			      		<option value="032">032</option>
			      		<option value="033">033</option>
			      		<option value="041">041</option>
			      		<option value="042">042</option>
			      		<option value="043">043</option>
			      		<option value="044">044</option>
			      	</select>
			      	<input type="text" name="tel" id="tel1" maxlength="4" class="form-control" placeholder="전화번호 가운데자리를 입력하세요" required />
			      	<input type="text" name="tel" id="tel2" maxlength="4" class="form-control" placeholder="전화번호 끝자리를 입력하세요" required />
		      	</div>
	      	</td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-map-location fa-2x"></i></th>
		      <td><input type="text" name="address" id="address" class="form-control" placeholder="주소를 입력하세요" required /></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-regular fa-envelope-open fa-2x mt-2"></i></th>
		      <td>
		      	<div class="input-group">
			      	<input type="text" name="email" id="email" class="form-control mt-2" placeholder="이메일을 입력하세요" required />
			      	<span style="width: 10%"><p class="form-control text-center mt-2" style="background-color: #eee">@</p></span>
			      	<select class="form-control mt-2">
				      		<option>naver.com</option>
				      		<option>gmail.com</option>
				      		<option>hotmail.net</option>
				      		<option>nate.com</option>
				      		<option>nate.com</option>
				      	</select>
		      	</div>
	      	</td> 
		    </tr>
		    <tr>
		    	<th class="text-center" ><i class="fa-solid fa-circle-info fa-2x" style="padding-top: 50px"></i></th>
		      <td><textarea rows="5" class="form-control" placeholder="자기소개를 입력해주세요"></textarea></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-regular fa-image fa-2x"></i></th>
		      <td><input type="file" name="photo" id="photo" class="form-control" style="height: 43px"/></td> 
		    </tr>
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-unlock-keyhole fa-2x"></i></th>
		      <td>
		      	<input type="radio" name="userInfor" id="release" value="공개" checked/><label for="release">공개</label>
		      	<input class="ml-2" type="radio" name="userInfor" id="private" value="비공개"/><label for="private">비공개</label>
	      	</td> 
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