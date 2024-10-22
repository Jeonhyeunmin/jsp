<%@page import="java.util.ArrayList"%>
<%@page import="study.j1018.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String str = "Welcome to My HomePage!!";
	pageContext.setAttribute("str", str);
	
	String cards[] = {"국민", "BC", "LG", "현대", "삼성", "농협", "신한"};
	pageContext.setAttribute("cards", cards);
	
	MemberVO vo = null;
	ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	vo = new MemberVO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("김말숙");
	vo.setAge(31);
	vo.setGender("여자");
	vo.setJob("주부");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
	
	String tel = "010-1234-5678";
	pageContext.setAttribute("tel", tel);
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl4_function.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
</head>
	<body>
	<jsp:include page="/include/Header.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
	<p><br/></p>
	<div class="container">
	<h2>JSTL Function 라이브러리</h2>
  <pre>
  	taglib에 등록 후 사용한다 : taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
  </pre>
		<hr>
		<div>
			str 변수의 값? ${str} <br>
			1-1. str 변수의 길이(length)
			<%=str.length() %> / ${fn: length(str)} <br>
			1-2 cards 배열의 길이(length) <%= cards.length %> / ${fn: length(cards)} <br>
			1-3 vos 배열의 길이(length) <%= vos.size() %> / ${fn: length(vos)}
			<hr>
			
			2-1 대문자 변환(toUpperCase()) : <%= str.toUpperCase() %> / ${fn: toUpperCase(str)} <br>
			2-2 소문자 변환(toLowerCase()) : <%= str.toLowerCase() %> / ${fn: toLowerCase(str)} <br>
			<hr>
			
			3-1 문자열 추출(substring()) : <%= str.substring(0, 5) %> / ${fn: substring(str, 0, 5)} <br> 
																	<%= str.substring(5) %> / ${fn: substring(str, 5, -1)}
			<hr>
			
			4-1 특정문자의 위치값(indexOf) : <%= str.indexOf("o") %> / ${fn: indexOf(str, 'o')}
			<hr>
			
			5-1 뒤에서부터 검색(lastIndexOf) : <%= str.lastIndexOf("o") %>  / <%-- ${fn: lastIndexOf(str, 'o')} --%> (X)
			5-2 특정위치의 문쟈열 모두 검색 : <br>
			'o'문자는<br>
			<c:set var="cnt" value="0"/>
			<c:forEach var="i" begin="0" end="${fn: length(str)-1}">
				<c:if test="${fn: substring(str, i, i+1) == 'o'}">${i+1}번째 있습니다.<br/> <c:set var="cnt" value="${cnt+1}"/> </c:if>
			</c:forEach>
			문자 'o'의 갯수는 ${cnt} 입니다.
			<hr>
			
			6-1 substringAfter() :
			${fn: substringAfter(str, 'o')}  / ${fn: substringBefore(str, 'o')}<br>
			<hr>
			6-2 ${str}문자의 2번째 'o'문자의 위치만 구하시오. <br>
			<c:set var="cnt" value="0"/>
			<c:forEach var="i" begin="0" end="${fn: length(str)-1}">
				<c:if test="${fn: substring(str, i, i+1) == 'o'}"><c:set var="cnt" value="${cnt+1}"/></c:if>
				<c:if test="${cnt == 2}">${i+1}번째 있습니다.<c:set var="cnt" value="${cnt+1}"/><br></c:if>
			</c:forEach>
			<hr>
			
			7-1 split 함수 : 예) 전화번소(tel변수)<br>
<%
	String tels[] = tel.split("-");
	for(String t : tels){
		out.println(t+ "/ ");
	}
%>
			<br>
			7-2 fn:split(변수명, "분리자"); ==> 반환값은 배열로 저장된다. <br>
			<c:set var="tels" value="${fn:split(tel, '-')}"/>
			<c:forEach var="tel" items="${tels}" varStatus="st">
				${st.count} :  ${tel} <br>
			</c:forEach>
			8. 치환(replace) <br>
			str변수의 'o'를 'O'로 치환 : 
			<%= str.replace("o", "O") %> / ${fn: replace(str, 'o', 'O')}
			<br>
			
<%-- 			9. 문자의 포함유무? contains() <br>
			str 변수의 'My'의 포함 유무 : ${fn: contains(str, "My"} <br>
			str 변수의 'my'의 포함 유무 : ${fn: contains(str, "my"} <br> --%>
			
			
		</div>
	</div>
	<p><br/></p>
	<jsp:include page="/include/Footer.jsp"/>
	</body>
</html>