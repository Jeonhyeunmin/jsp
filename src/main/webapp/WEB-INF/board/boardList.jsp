<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
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
      location.href = "BoardList.bo?pageSize=" + pageSize + "&pag=${pag}&level=${level}";
    }
  </script>
</head>
<jsp:include page="/include/Header.jsp"/>
<jsp:include page="/include/nav.jsp"/>
<body>
  <p><br/></p>
  <div class="container">
    <h2>게 시 판 리 스 트</h2>
    <table class="table table-borderless">
      <tr>
        <td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
      </tr>
    </table>
    <table class="table table-hover text-center">
      <tr>
        <th>글번호</th>
        <th>글 제목</th>
        <th>글쓴이</th>
        <th>글쓴 날짜</th>
        <th>조회수(좋아요)</th>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo}"/>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <c:if test="${vo.openSw == '공개' || sMid == vo.mid || sLevel == 0}">
          <tr>
            <td>${curScrStartNo}</td>
            <td class="text-left"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}">${vo.title}</a></td>
            <td>${vo.nickName}</td>
            <td>${vo.wDate}</td>
            <td>${vo.readNum}</td>
          </tr>
        </c:if>
        <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
      </c:forEach>
      <tr><td colspan="5" class="m-0 p-0"></td></tr>
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
  <p><br/></p>
  <jsp:include page="/include/Footer.jsp"/>
</body>
</html>
