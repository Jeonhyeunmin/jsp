<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardSearchList.jsp</title>
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
      location.href = "BoardList.bo?&pageSize=${pageSize}&pag=${pag}&level="+level;      
    }
    
    function pageSizeChange(){
      let pageSize = document.getElementById("pageSize").value;
      location.href = "BoardList.bo?pageSize=" + pageSize + "&pag=1&level=${level}";
    }
    
    function cursorMove(){
    	document.getElementById("searchString").focus();
    }
  </script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
  <p><br/></p>
  <div class="container">
    <h2 class="text-center">게 시 판 리 스 트</h2>
    <div class="text-center">
    	(<font color="blue">${searchTitle}</font>을 통해 <font color="red"><b>${searchString}</b></font>을 검색한 결과는 총 <font color="red"><b>${searchCnt}</b></font>건 입니다)
    </div>
    <table class="table table-borderless">
      <tr>
        <td class="p-0 m-0"><a href="BoardList.bo" class="btn btn-success btn-sm">돌아가기</a></td>
      </tr>
    </table>
    <table class="table table-hover text-center">
      <tr>
        <th>글번호</th>
        <th>글 제목</th>
        <th>글쓴이</th>
        <th>글쓴 날짜</th>
        <th>조회수</th>
        <th>좋아요</th>
      </tr>
      <%-- <c:set var="curScrStartNo" value="${curScrStartNo}"/> --%>
      <c:set var="curScrStartNo" value="${searchCnt}"/>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <c:if test="${vo.openSw == '공개' || sMid == vo.mid || sLevel == 0}">
          <tr>
            <td>${curScrStartNo}</td>
            <td class="text-left">
            	<c:if test="${vo.claim == 'NO' || sMid == vo.mid || sLevel == 0}"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}">${vo.title}</a></c:if>
            	<c:if test="${vo.claim != 'NO' && sMid != vo.mid && sLevel != 0}"><a href="javascript:alert('현재 글은 신고된 글입니다.')">${vo.title}</a></c:if>
          	</td>
            <td>${vo.nickName}</td>
            <td>${vo.wDate}</td>
            <td>${vo.readNum}</td>
            <td><i class="fa-regular fa-heart" style="color: red;"></i> ${vo.good}</td>
          </tr>
        </c:if>
        <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
        <%-- <c:set var="curScrStartNo" value="${curScrStartNo-1}"/> --%>
      </c:forEach>
      <tr><td colspan="6" class="m-0 p-0"></td></tr>
    </table>
    
    <!-- 블록페이지 시작 -->
    <div class="pagination-wrapper">
      <ul class="pagination mt-3">
        <li class="page-item">
          <c:if test="${pag > 1}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=1">첫 페이지</a></c:if>
          <c:if test="${pag <= 1}"><span class="page-link disabled text-secondary">첫페이지</span></c:if>
        </li>
        <li class="page-item">
          <c:if test="${curBlock > 0}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></c:if>
          <c:if test="${curBlock <= 0}"><span class="page-link disabled text-secondary">이전블록</span></c:if>
        </li>
        
        <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
          <c:if test="${i <= totPage && i == pag}">
            <li class="page-item active"><a class="page-link bg-secondary border-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
          </c:if>
          <c:if test="${i <= totPage && i != pag}">
            <li class="page-item"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
          </c:if>
        </c:forEach>
        
        <li class="page-item">
          <c:if test="${curBlock >= lastBlock}"><span class="page-link disabled text-secondary">다음블록</span></c:if>
          <c:if test="${curBlock < lastBlock}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></c:if>
        </li>
        
        <li class="page-item">
          <c:if test="${pag >= totPage}"><span class="page-link disabled text-secondary">마지막 페이지</span></c:if>
          <c:if test="${pag < totPage}"><a class="page-link text-secondary" href="BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막 페이지</a></c:if>
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
  <p><br/></p>
  <jsp:include page="/include/Footer.jsp"/>
</body>
</html>
