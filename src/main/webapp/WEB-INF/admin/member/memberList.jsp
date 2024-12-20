<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp(admin)</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script type="text/javascript">
		'use strict';
		
		function nameSearch(){
			let name = document.getElementById("name").value;
			if(name.trim()==""){
				alert("검색할 성명을 입력하세요.");
				document.getElementById("name").focus();
			}
			else{
				location.href = "MemberList.mem?name=" + name;
			}
		}
		
		function levelChange(e) {
	    	//let level = document.getElementById("level").value;
	    	let ans = confirm("선택한 회원의 등급을 변경하시겠습니까?");
	    	if(!ans) {
	    		location.reload();
	    		return false;
	    	}
	    	//alert("레벨 : " + e.value);
	    	let items = e.value.split("/");
	    	
	    	$.ajax({
	    		type : "post",
	    		url  : "MemberLevelChange.ad",
	    		data : {
	    			level : items[0],
	    			idx   : items[1]
	    		},
	    		success:function(res) {
	    			if(res != 0) {
	    				alert("등급 수정 완료!!");
	    				location.reload();
	    			}
	    			else alert("등급 수정 실패~~");
	    		},
	    		error : function() {
	    			alert("전송오류!");
	    		}
	    	});
    }
		
		function levelViewCheck(){
			let level = document.getElementById("levelView").value;
			location.href = "MemberList.ad?&pageSize=${pageSize}&pag=${pag}&level="+level;			
		}
		
		function pageSizeChange(){
			let pageSize = document.getElementById("pageSize").value;
			location.href = "MemberList.ad?pageSize=" + pageSize + "&pag=${pag}&level=${level}";
		}
		
		function memberDelete(idx) {
			let ans = confirm("탈퇴 신청 30일 지난 회원입니다 정보 삭제하시겠습니까?");
			if(ans){
				location.href="MemberDelete.ad?idx=" + idx + "&pag=${pag}";
			}
			else{
				location.href="MemberList.ad";
			}
			
		}
	</script>
</head>
	<body>
	<p><br/></p>
	<div class="container">
  	<h2 class="text-center">회 원 리 스 트</h2>
  	<form action="">
  		<table class="table table-borderless m-0">
	  		<tr>
	  			<td>
	  				<select class="form-control float-right" style="width: 150px;" name="levelView" id="levelView" onchange="levelViewCheck()">
	  					<option value=""		<c:if test="${empty level}">selected</c:if> >전체회원</option>
	  					<option value="0"		<c:if test="${level == 0}">selected</c:if>>관리자</option>
	  					<option value="1"		<c:if test="${level == 1}">selected</c:if>>준회원</option>
	  					<option value="2"		<c:if test="${level == 2}">selected</c:if>>정회원</option>
	  					<option value="3"		<c:if test="${level == 3}">selected</c:if>>우수회원</option>
	  					<option value="99"	<c:if test="${level == 99}">selected</c:if>>탈퇴예정</option>
	  				</select>
	  			</td>
	  		</tr>
	  	</table>
  	</form>
  		<table class="table table-hover text-center">
  			<tr class="table-secondary">
  				<th>번호</th>
  				<th>아이디</th>
  				<th>성명</th>
  				<th>별명</th>
  				<th>성별</th>
  				<th>생일</th>
  				<th>이메일</th>
  				<th>최근 방문일</th>
  				<th>활동여부</th>
  				<th>등급</th>
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
	  			<tr <c:if test="${vo.userInfor != '공개'}">style="background-color: pink;"</c:if>>
	  				<td>${st.count}</td>
	  				<td><a href="MemberDetailView.ad?idx=${vo.idx}">${vo.mid}</a></td>
	  				<td>${vo.name}</td>
	  				<td>${vo.nickName}</td>
	  				<td>${vo.gender}</td>
	  				<td>${fn:substring(vo.birthday,0,10)}</td>
	  				<td>${vo.email}</td>
	  				<td>
	  					<c:if test="${sMid != vo.mid}">${fn:substring(vo.lastDate,0,16)}</c:if>
	  					<c:if test="${sMid eq vo.mid}">${fn:substring(sLastDate,0,16)}</c:if>
  					</td>
	  				<td>
		  				<c:if test="${vo.userDel == 'NO'}">활동 중</c:if>
		  				<c:if test="${vo.userDel != 'NO'}"><font color="red">탈퇴 신청(${vo.elapsed_date}일)</font></c:if>
		  				<c:if test="${vo.userDel != 'NO' && vo.elapsed_date >= 30}">
		  					<input type="button" value="회원삭제" class="btn btn-outline-danger" onclick="memberDelete(${vo.idx})">
							</c:if>
	  				</td>
	  				<td>
	  					<select name="level" id="level" onchange="levelChange(this)">
	  						<option value="0/${vo.idx}" ${vo.level == 0 ? 'selected' : ''}>관리자</option>
	  						<option value="1/${vo.idx}" ${vo.level == 1 ? 'selected' : ''}>준회원</option>
	  						<option value="2/${vo.idx}" ${vo.level == 2 ? 'selected' : ''}>정회원</option>
	  						<option value="3/${vo.idx}" ${vo.level == 3 ? 'selected' : ''}>우수회원</option>
	  						<option value="99/${vo.idx}" ${vo.level == 99 ? 'selected' : ''}>탈퇴예정회원</option>
	  					</select>
	  				</td>
					</tr>
				</c:forEach>
				<tr><td colspan="9" class="m-0 p-0"></td></tr>
  		</table>
  		
  	<!-- 블록페이지 시작 -->
  	<ul class="pagination justify-content-center">
			<li class="page-item">
				<c:if test="${pag > 1}"><a class="page-link  text-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=1">첫 페이지</a></c:if>
        <c:if test="${pag <= 1}"><span class="page-link disabled  text-secondary">첫페이지</span></c:if>
      </li>
			<li class="page-item">
				<c:if test="${curBlock > 0}"><a class="page-link  text-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if>
				<c:if test="${curBlock <= 0}"><span class="page-link disabled text-secondary">이전블록</span></c:if>
      </li>
			
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  	</c:forEach>
		  
		  
		  <li class="page-item">
				<c:if test="${curBlock >= lastBlock}"><span class="page-link disabled  text-secondary">다음블록</span></c:if>
				<c:if test="${curBlock < lastBlock}"><a class="page-link text-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></c:if>
      </li>
      
		  <li class="page-item">
				<c:if test="${pag >= totPage}"><span class="page-link disabled text-secondary">마지막 페이지</span></c:if>
				<c:if test="${pag < totPage}"><a class="page-link  text-secondary" href="MemberList.ad?level=${level}&pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></c:if>
      </li>
		
  	<!-- 블록페이지 끝 -->
			<!-- 사용자 페이지 설정 -->  		
  	<li class="float-right" style="float: right;">
    <form action="#">
        <select class="form-control" style="width: 150px;" name="pageSize" id="pageSize" onchange="pageSizeChange()">
            <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
            <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
            <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
            <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
            <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
            <option <c:if test="${pageSize == 30}">selected</c:if>>30</option>
        </select>
    </form>
		</li>
	</ul>
  	
  	
  	<div class="input-group mt-1 mb-3">
      <div class="input-group-prepend">
      	<div class="input-group-text">성명검색</div>
    	</div>
      <input type="text" name="name" id="name" class="form-control" />
      <div class="input-group-append">
      	<input type="button" value="검색" onclick="nameSearch()" class="btn btn-outline-success ml-2" />
      	<a href="MemberList.mem" class="btn btn-outline-primary ml-2">전체검색</a>
    	</div>
   </div>
	</div>
	<p><br/></p>
	</body>
</html>