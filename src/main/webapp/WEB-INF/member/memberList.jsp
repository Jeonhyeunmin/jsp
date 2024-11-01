<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	
	<style>
    th, td {
      text-align: center;
    }
  </style>
	
	<script type="text/javascript">
		'use strict';
		
		function contentView(content){
			/* alert(content); */
			$("#myModal #modalContent").text(content);
		}
		
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
	</script>
</head>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<body>
	<p><br/></p>
	<<div class="container">
  	<h2 class="text-center">회 원 리 스 트</h2>
  <hr/>
  	<div>
  		<table class="table table-hover text-center">
  			<tr class="table-secondary">
  				<th>번호</th>
  				<th>등급</th>
  				<th>아이디</th>
  				<th>성명</th>
  				<th>별명</th>
  				<th>성별</th>
  				<th>생일</th>
  				<th>이메일</th>
  				<th>최근 방문일</th>
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
	  			<tr>
	  				<td>${st.count}</td>
	  				<td>
		  				<c:if test="${vo.level == 0}">관리자</c:if>
		  				<c:if test="${vo.level == 1}">준회원</c:if>
		  				<c:if test="${vo.level == 2}">정회원</c:if>
		  				<c:if test="${vo.level == 3}">우수회원</c:if>
		  				<c:if test="${vo.level == 99}"><font color="red">탈퇴예정회원</font></c:if>
	  				</td>
	  				<td><a href="#" onclick="contentView('${vo.content}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td>
	  				<%-- <td><a href="#" onclick="contentView('${vo.content}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td> --%>
	  				<td>${vo.name}</td>
	  				<td>${vo.nickName}</td>
		  				<c:if test="${vo.userInfor == '공개'}">
			  				<td>${vo.gender}</td>
			  				<td>${fn:substring(vo.birthday,0,10)}</td>
			  				<td>${vo.email}</td>
			  				<td>
			  					<c:if test="${sMid != vo.mid}">${fn:substring(vo.lastDate,0,16)}</c:if>
			  					<c:if test="${sMid eq vo.mid}">${fn:substring(sLastDate,0,16)}</c:if>
	  					</td>
	  				</c:if>
	  				<c:if test="${vo.userInfor != '공개'}">
	  					<td colspan="6" class="text-center">비 공 개</td>
	  				</c:if>
					</tr>
				</c:forEach>
				<tr><td colspan="8" class="m-0 p-0"></td></tr>
  		</table>
  		<!-- 블록페이지 시작 -->
  	<ul class="pagination justify-content-center">
  	  <li class="page-item">
        
    </li>
			<li class="page-item">
				<c:if test="${pag > 1}"><a class="page-link" href="MemberList.mem?pag=1">첫 페이지</a></c:if>
        <c:if test="${pag <= 1}"><span class="page-link disabled">첫페이지</span></c:if>
      </li>
			<li class="page-item">
				<c:if test="${curBlock > 0}"><a class="page-link" href="MemberList.mem?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if>
				<c:if test="${curBlock <= 0}"><span class="page-link disabled">이전블록</span></c:if>
      </li>
			
			<li class="page-item"><c:if test="${curBlock > 0}"><a class="page-link" href="MemberList.mem?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if></li>
			
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
			  <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link" href="MemberList.mem?pag=${i}"><b>${i}</b></a></li></c:if>
			  
		  	<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link" href="MemberList.mem?pag=${i}">${i}</a></li></c:if>
		  </c:forEach>
		  
		  
		  <li class="page-item">
				<c:if test="${curBlock >= lastBlock}"><span class="page-link disabled">다음블록</span></c:if>
				<c:if test="${curBlock < lastBlock}"><a class="page-link" href="MemberList.mem?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></c:if>
      </li>
      
		  <li class="page-item">
				<c:if test="${pag >= totPage}"><span class="page-link disabled">마지막 페이지</span></c:if>
				<c:if test="${pag < totPage}"><a class="page-link" href="MemberList.mem?pag=${totPage}">마지막 페이지</a></c:if>
      </li>
		</ul>
  	<!-- 블록페이지 끝 -->
  	
  	<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title">자기소개</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <span id="modalContent">${vo.content}</span>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

  	</div>
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
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>