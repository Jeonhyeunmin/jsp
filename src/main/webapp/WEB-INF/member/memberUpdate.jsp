<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberUpdate.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js//woo.js"></script>
	<script>
		'use strict';
	
	    let regNickName = /^[가-힣]+$/;
	    let regName = /^[a-zA-Z가-힣0-9]+$/; 
		
		function fCheck() {
	    let nickName = document.getElementById("nickName").value;
	    let name = document.getElementById("name").value;
	
	    // 전화번호, 이메일, 주소 생성
	    let tel2 = myform.tel2.value.trim();
	    let tel3 = myform.tel3.value.trim();
	    let tel = myform.tel1.value + "-" + tel2 + "-" + tel3; 
	    let email = myform.email1.value + "@" + myform.email2.value; 
	    let address = myform.postcode.value + "/" + myform.address.value + " /" + myform.detailAddress.value + " /" + myform.extraAddress.value + " ";
	
	    myform.tel.value = tel;
	    myform.email.value = email;
	    myform.address2.value = address;
	
	    // 유효성 검사
	    if (!regNickName.test(nickName.trim())) {
	        alert("닉네임은 한글만 사용 가능합니다.");
	        document.getElementById("nickName").value = "";
	        document.getElementById("nickName").focus();
	        return false;
	    } else if (!regName.test(name.trim())) {
	        alert("성명은 한글, 영어, 숫자만 사용 가능합니다.");
	        document.getElementById("name").value = "";
	        document.getElementById("name").focus();
	        return false;
	    }
			if (myform.nickCk.value < 1) {
	        alert("닉네임 중복체크를 진행해주세요.");
	        return false;
	    }
	    myform.submit();
		}
		
/* 		//	닉네임 중복체크
		function nickCheck() {
	    let nickName = myform.nickName.value;
	    
	    if (nickName.trim() === "") {
	        alert("닉네임을 입력하세요");
	        myform.nickName.focus();
	    } else {
	        let url = "MemberNickNameCheck.mem?nickName=" + nickName;
	        window.open(url, "nickNameCheckWindow", "width=500px, height=400px, left=2500px, top=250px");
	        myform.nickCk.value = 1; // 중복 체크 완료
	    }
		} */

		function moveFocus(event) {
	    const tel2 = document.getElementById('tel2');
	    const tel3 = document.getElementById('tel3');
	    
	    if (tel2.value.length >= 4) {
	        tel3.focus();
	    }
		}
		
		function nickNameAjaxCheck() {
	    	let nickName = myform.nickName.value;
	    	if(!regNickName.test(nickName)) {
	        alert("닉네임은 2자리 이상 한글만 사용가능합니다.");
	        myform.nickName.focus();
	        return false;
	      }
	    	else if(nickName == '${sNickName}'){
	    		alert("현재 닉네임을 그대로 사용합니다.");
		    	myform.nickCk.value = 1;
	    		return false;
	    	}
	    	
	    	myform.nickCk.value = 1;
	    	
	    	$.ajax({
	    		type : "get",
	    		url  : "NickNameAjaxCheck.mem",
	    		data : {nickName : nickName},
	    		success:function(res) {
	    			if(res != "0") alert("닉네임이 중복되었습니다.\n다른 닉네임을 사용하세요.");
	    			else alert("사용가능한 닉네임 입니다.\n계속 처리해 주세요.");
	    		},
	    		error : function() {
	    			alert("전송오류!");
	    		}
	    	});
	    }
	</script>
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
	<h2 class="text-center">회원 정보 수정</h2>
		<form name="myform" method="post" action="MemberUpdateOk.mem" onsubmit="return fCheck()">
			<table class="table table-bordered">
			
				<!-- 아이디 -->
		    <tr>
		    	<th class="text-center"><i class="fa-regular fa-address-card fa-2x"></i></th>
		      <td>
			      <div class="input-group">
			      	<input type="text" name="mid" id="mid" value="${sMid}" class="form-control" readonly />
			      	<div class="input-group-append">
			      	</div>
		      	</div>
		      </td> 
		    </tr>
		    
		    <!-- 성명 -->
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-user fa-2x"></i></th>
		      <td><input type="text" name="name" id="name" value="${vo.name}" class="form-control" required /></td> 
		    </tr>
		    
		    <!-- 닉네임 -->
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-user-pen fa-2x"></i></th>
		      <td>
			      <div class="input-group">
			      	<input type="text" name="nickName" id="nickName" value="${vo.nickName}" class="form-control" required />
			      	<div class="input-group-append">
				      		<input type="button" value="닉네임 중복체크" onclick="nickNameAjaxCheck()" class="btn btn-outline-success ml-2">
			      	</div>
		      	</div>
	      	</td> 
		    </tr>
		    
		    <!-- 성별 -->
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-venus-mars fa-2x"></i></th>
		      <td>
		      	<input type="radio" name="gender" id="male" value="남자" <c:if test="${vo.gender == '남자'}">checked</c:if>/><label for="male">남자</label>
		      	<input type="radio" name="gender" id="female" value="여자" class="ml-2" <c:if test="${vo.gender == '여자'}">checked</c:if>/><label for="female">여자</label>
	      	</td> 
		    </tr>
		    
		    <!-- 생일 -->
      	<tr>
	    	<th class="text-center"><i class="fa-solid fa-cake-candles fa-2x"></i></th>
		      <td>
		      	<%-- <input type="date" name="birthday" id="birthday" value="${vo.birthday.substring(0,10)}" class="form-control"/> --%>
		      	<input type="date" name="birthday" id="birthday" value="${fn: substring(vo.birthday,0,10)}" class="form-control"/>
	      	</td> 
		    </tr>
		    
		    <!-- 전화번호 -->
		    <tr>
		    	<th class="text-center" style="height: 30px"><i class="fa-solid fa-phone fa-2x" style="padding-top: 10px"></i></th>
		      <td>
		      	<div class="input-group">
			      	<select class="form-control mt-2" id="tel1" name="tel1">
			      		<option ${tel1 == '010' ? 'selected' : ''} value="010">010</option>
			      		<option ${tel1 == '02' ? 'selected' : ''} value="02">02</option>
			      		<option ${tel1 == '011' ? 'selected' : ''} value="011">011</option>
			      		<option ${tel1 == '016' ? 'selected' : ''} value="016">016</option>
			      		<option ${tel1 == '017' ? 'selected' : ''} value="017">017</option>
			      		<option ${tel1 == '018' ? 'selected' : ''} value="018">018</option>
			      		<option ${tel1 == '019' ? 'selected' : ''} value="019">019</option>
			      		<option ${tel1 == '031' ? 'selected' : ''} value="031">031</option>
			      		<option ${tel1 == '032' ? 'selected' : ''} value="032">032</option>
			      		<option ${tel1 == '033' ? 'selected' : ''} value="033">033</option>
			      		<option ${tel1 == '041' ? 'selected' : ''} value="041">041</option>
			      		<option ${tel1 == '042' ? 'selected' : ''} value="042">042</option>
			      		<option ${tel1 == '043' ? 'selected' : ''} value="043">043</option>
			      		<option ${tel1 == '044' ? 'selected' : ''} value="044">044</option>
			      	</select>
			      	<span style="width: 5%"><p class="form-control text-center mt-2" style="background-color: #eee">-</p></span>
			      	<input type="text" name="tel2" id="tel2" value="${tel2}" maxlength="4" class="form-control mt-2" onkeyup="moveFocus(event)" placeholder="가운데자리를 입력하세요" required />
			      	<span style="width: 5%"><p class="form-control text-center mt-2" style="background-color: #eee">-</p></span>
			      	<input type="text" name="tel3" id="tel3" value="${tel3}" maxlength="4" class="form-control mt-2" placeholder="끝자리를 입력하세요" required />
		      	</div>
	      	</td> 
		    </tr>
		    
				<!-- 주소 -->		    
				<tr>
					<th class="text-center" style="padding-top: 55px"><i class="fa-solid fa-map-location fa-2x"></i></th>
					<td>
						<div class="input-group mb-1">
							<input type="text" name="postcode" id="sample6_postcode" value="${postcode}" placeholder="우편번호" onclick="sample6_execDaumPostcode()" class="form-control" readonly>
							<div class="input-group-append" style="display: flex; align-items: center; margin-right: 70%">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-secondary" style="margin-left: 10px;">
							</div>
						</div>
						<input type="text" name="address" id="sample6_address" size="50" value="${address}" onclick="sample6_execDaumPostcode()" placeholder="주소" class="form-control mb-1" readonly>
						<div class="input-group mb-1">
							<input type="text" name="detailAddress" id="sample6_detailAddress" value="${detailAddress}" placeholder="상세주소" class="form-control">
							<div class="input-group-append">
								<input type="text" name="extraAddress" id="sample6_extraAddress" value="${extraAddress}" onclick="sample6_execDaumPostcode()" placeholder="참고항목" class="form-control ml-2" readonly>
							</div>
						</div>
					</td> 
				</tr>

		    
		    <!-- 이메일 -->
		    <tr>
		    	<th class="text-center" style="padding-top: 20px"><i class="fa-regular fa-envelope-open fa-2x"></i></th>
		      <td>
		      	<div class="input-group">
			      	<input type="text" name="email1" id="email1" class="form-control mt-2" value="${email1}" placeholder="이메일을 입력하세요" required />
			      	<span style="width: 5%"><p class="form-control text-center mt-2" style="background-color: #eee">@</p></span>
			      	<select class="form-control mt-2" name="email2" id="email2">
				      		<option ${email2 == 'naver.com' ? 'selected' : ''} value="naver.com">naver.com</option>
				      		<option ${email2 == 'gmail.com' ? 'selected' : ''} value="gmail.com">gmail.com</option>
				      		<option ${email2 == 'honmail.net' ? 'selected' : ''} value="honmail.net">honmail.net</option>
				      		<option ${email2 == 'nate.com' ? 'selected' : ''} value="nate.com">nate.com</option>
				      	</select>
		      	</div>
	      	</td> 
		    </tr>
		    
		    <!-- 자기소개 -->
		    <tr>
		    	<th class="text-center" ><i class="fa-solid fa-circle-info fa-2x" style="padding-top: 50px"></i></th>
		      <td><textarea rows="5" name="content" id="content" class="form-control">${vo.content}</textarea></td> 
		    </tr>
		    
		    <!-- 사진 -->
		    <tr>
		    	<th class="text-center"><i class="fa-regular fa-image fa-2x"></i></th>
		      <td>
		      	<img src="${ctp}/images/member/${vo.photo}" width="100px"/>
		      	<input type="file" name="photo" id="photo" class="form-control-file border" style="height: 43px"/>
	      	</td> 
		    </tr>
		    
		    <!-- 공개/비공개 -->
		    <tr>
		    	<th class="text-center"><i class="fa-solid fa-unlock-keyhole fa-2x"></i></th>
		      <td>
		      	<input type="radio" name="userInfor" id="release" value="공개" <c:if test="${vo.userInfor == '공개'}">checked</c:if>/><label for="release">공개</label>
		      	<input type="radio" name="userInfor" id="private" value="비공개" <c:if test="${vo.userInfor == '비공개'}">checked</c:if> class="ml-2"/><label for="private">비공개</label>
	      	</td> 
		    </tr>
	    </table>
	    <table class="table table-borderless">
    		<tr>
	        <td>
				    <button type="submit" class="btn btn-success mb-2">회원정보수정</button>
				    <button type="reset" class="btn btn-warning mb-2">다시입력</button>
				  </td>
				  <td class="text-right">
			    	<button type="button" onclick="location.href='MemberMain.mem'" class="btn btn-info mb-2">돌아가기</button>
			    	<!-- <button type="button" onclick="history.back()" class="btn btn-info mb-2">돌아가기</button> -->
	        </td>
     		</tr>
     </table>
		  <input type="hidden" name="tel" id="tel"/>
	    <input type="hidden" name="email" id="email"/>
	    <input type="hidden" name="address2" id="address2"/>
	    <input type="hidden" name="idCk" id="idCk" value="0"/>
			<input type="hidden" name="nickCk" id="nickCk" value="0"/>
  	</form>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>