<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page session="false"%> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  //	1. 이곳은 자바스크립트 한줄 주석입니다.
  /*
  	2. 이곳은 자바스크립트 여러줄 주석입니다.
  */
  </script>
  <!-- 3. 이곳은 HTML 주석입니다. -->
  <style>
  	/* 4. 이곳은 CSS 주석입니다. */
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>각 언어별 주석 예제</h2>
  <div>JSP 코드(scriptlet)를 적어봅니다.</div>
  <%
  	// 6. 자바 주석 (한줄)
	  /* 7. 자바 주석(여러줄) */
  	int i = 0;
  	int tot = 0;
  	while(i < 100){
  		i++;
  		tot += i;
  	}
  %>
  <div>
  	1~100까지의 합은 <font color="red"><b><%=tot %></b></font> 입니다.
  </div>
  <hr>
  <%!
  	public int hap(int su){
  	int hap = 0;
  	for(int i = 1; i <= su; i++){
  		hap += i;  		
  	}  	
  	return hap;
  }
  %>
  <h3>1~? 까지의 합을 출력</h3>
  <div>1에서 50까지의 합은?<%=hap(50) %></div>
  <div>작업을 끝냅니다.</div>
</div>
<p><br/></p>
</body>
</html>