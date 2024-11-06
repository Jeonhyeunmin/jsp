<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
  <script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
  <style>
    .pagination-wrapper {
      display: flex;
      justify-content: space-between; /* 공간을 양쪽으로 분배 */
      align-items: center;
    }
    .pagination {
      display: flex;
      justify-content: center; /* 가운데 정렬 */
      flex: 1; /* 남은 공간을 모두 차지하게 함 */
    }
    .page-item {
      margin: 0 2px; /* 페이지 아이템 간격을 줄임 */
    }
  </style>
<script type="text/javascript">
  function levelViewCheck(){
    let level = document.getElementById("levelView").value;
    location.href = "BoardList.ad?&pageSize=${pageSize}&pag=${pag}&level="+level;      
  }
  
  function pageSizeChange(){
    let pageSize = document.getElementById("pageSize").value;
    location.href = "BoardList.ad?pageSize=" + pageSize + "&pag=1&level=${level}";
  }
  
  function cursorMove(){
  	document.getElementById("searchString").focus();
  }
  
  function contentView(content) {
  	$("#myModal #modalContent").html(content);
  	/* 
  	$("#myModal").modal({
      fadeDuration: 1000,
      fadeDelay: 0.5,
    });
  	*/
  }
  
  function allCheck() {
		for(let i = 0; i<myform.idxFlag.length; i++){
			myform.idxFlag[i].checked = true;
		}
	}
  
  function allReset() {
		for(let i = 0; i<myform.idxFlag.length; i++){
			myform.idxFlag[i].checked = false;
		}
	}
  
  function reverseCheck() {
		for(let i = 0; i<myform.idxFlag.length; i++){
			myform.idxFlag[i].checked = !myform.idxFlag[i].checked;
		}
	}
    
  function selectDeleteCheck() {
		let idxSelectArray = "";
		
		for(let i = 0; i < myform.idxFlag.length; i++){
			if(myform.idxFlag[i].checked){
				idxSelectArray += myform.idxFlag[i].value + "/";
			}
		}
		
		idxSelectArray = idxSelectArray.substring(0,idxSelectArray.length-1);
		if(idxSelectArray == ""){
			alert("삭제할 항목을 선택하세요.");
			return false;
		}
		
		let ans = confirm("선택 항목을 모두 삭제처리 하시겠습니까?");
		if(!ans) return false;		
		
		$.ajax({
			type : "post",
			url : "BoardSelectDelete.ad",
			data : {idxSelectArray : idxSelectArray},
			success: function(res) {
				if(res != "0"){
					alert("선택된 게시물들을 모두 삭제처리했습니다.");
					location.reload();
				}
				else {
					alert("게시물 삭제 실패");
				}
			},
			error: function() {
					alert("전송오류");
			}
		});
	}
</script>
</head>
<body>
  <p><br/></p>
  <div class="container-xl">
    <h2 class="text-center">게 시 판 리 스 트</h2>
    <table class="table table-borderless">
      <tr>
        <td class="p-0 m-0"><a href="BoardInput.bo" class="btn btn-outline-success btn-sm">글쓰기</a></td>
      </tr>
    </table>
    <form name="myform">
	    <table class="table table-hover text-center">
	    	<tr>
	    		<td class="text-left" colspan="7">
	    			<input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1">
	    			<input type="button" value="전체취소" onclick="allReset()" class="btn btn-warning btn-sm mr-1">
	    			<input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-info btn-sm mr-1">
	    		</td>
	    	</tr>
	      <tr>
	        <th><input type="checkBox" onclick="reverseCheck()"></th>
	        <th style="width: 100px;">글번호</th>
	        <th style="width: 500px;">글 제목</th>
	        <th style="width: 80px;">글쓴이</th>
	        <th>글쓴 날짜</th>
	        <th>조회수</th>
	        <th>좋아요</th>
	      </tr>
	      <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	      <c:forEach var="vo" items="${vos}" varStatus="st">
	        <c:if test="${vo.openSw == '공개' || sMid == vo.mid || sLevel == 0}">
	          <tr>
	          	<td><input type="checkBox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}"></td>
	            <td>${curScrStartNo}</td>
	            <td class="text-left">
	            	<c:if test="${vo.claim == 'NO' || sMid == vo.mid || sLevel == 0}"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}">${vo.title}</a></c:if>
	            	<c:if test="${vo.claim != 'NO' && sMid != vo.mid && sLevel != 0}"><a href="javascript:alert('현재 글은 신고된 글입니다.')">${vo.title}</a></c:if>
	            	<c:if test="${vo.time_diff <= 24}"><img src="${ctp}/images/new.gif"></c:if>
	            	<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
	          	</td>
	  		      <td><a href="#" onclick='contentView("${vo.content}")' data-toggle="modal" data-target="#myModal">${vo.nickName}</a></td>
	            <td>	<!-- 24시간이 넘으면 날짜만, 24시간 이내라도 오늘날짜는 시간만, 어제날짜는 날짜와시간을 출력 -->
			        	${vo.time_diff > 24 ? fn:substring(vo.wDate,0,10) : vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,19)}
			      	</td>
	            <td>${vo.readNum}</td>
	            <td><i class="fa-regular fa-heart" style="color: red;"></i> ${vo.good}</td>
	          </tr>
	        </c:if>
	        <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
	      </c:forEach>
	      <tr><td colspan="6" class="m-0 p-0"></td></tr>
	    </table>
    </form>
    
    <!-- 블록페이지 시작 -->
    <div class="pagination-wrapper">
      <ul class="pagination mt-3">
        <li class="page-item">
          <c:if test="${pag > 1}"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=1">첫 페이지</a></c:if>
          <c:if test="${pag <= 1}"><span class="page-link disabled text-secondary">첫페이지</span></c:if>
        </li>
        <li class="page-item">
          <c:if test="${curBlock > 0}"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if>
          <c:if test="${curBlock <= 0}"><span class="page-link disabled text-secondary">이전블록</span></c:if>
        </li>
        
        <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
          <c:if test="${i <= totPage && i == pag}">
            <li class="page-item active"><a class="page-link bg-secondary border-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
          </c:if>
          <c:if test="${i <= totPage && i != pag}">
            <li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li>
          </c:if>
        </c:forEach>
        
        <li class="page-item">
          <c:if test="${curBlock >= lastBlock}"><span class="page-link disabled text-secondary">다음블록</span></c:if>
          <c:if test="${curBlock < lastBlock}"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></c:if>
        </li>
        
        <li class="page-item">
          <c:if test="${pag >= totPage}"><span class="page-link disabled text-secondary">마지막 페이지</span></c:if>
          <c:if test="${pag < totPage}"><a class="page-link text-secondary" href="BoardList.ad?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></c:if>
        </li>
      </ul>
      
      <!-- 사용자 페이지 설정 -->
          <select class="form-control" style="width: 100px; display: inline-block;" name="pageSize" id="pageSize" onchange="pageSizeChange()">
            <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
            <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
            <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
            <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
            <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
            <option <c:if test="${pageSize == 30}">selected</c:if>>30</option>
          </select>
    </div>
    <!-- 블록페이지 끝 -->
  </div>
  
    
    <br>
    <!-- 검색기 시작 -->
    <div class="container text-center">
    	<form name="searchForm" method="post" action="BoardSearchList.bo">
    		<div class="input-group">
	    		<select name="search" id="search" onchange="cursorMove()" class="form-control mr-2" style="background-color: #eee;">
	    			<option value="title">글제목</option>
	    			<option value="nickName">글쓴이</option>
	    			<option value="content">글내용</option>
	    		</select>
	    		<input type="text" name="searchString" id="searchString" class="form-control" style="width: 700px;" required/>
	    		<input type="submit" value="검색" class="btn btn-outline-success ml-2" style="width: 100px;"/>
      	</div>
    	</form>
    </div>
    
    <!-- 검색기 끝 -->
    
    <!-- The Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">자기소개</h3>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      <div class="modal-body">
	        <span id="modalContent"></span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
  <p><br/></p>
</body>
</html>
