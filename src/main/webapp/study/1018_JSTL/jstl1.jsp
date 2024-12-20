<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl1.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSTL(Java Standard tag Library)</h2>
	<div>
	
	</div>
	<table class="table table-border">
		<tr>
			<th>라이브러리</th>
			<th>주소(URI)</th>
			<th>접두어</th>
			<th>기본문법</th>
		</tr>
		<tr>
			<td>Core</td>
			<td>http://java.sun.com/jsp/jstl/core</td>
			<td>c</td>
			<td>< c : 태그명... ></td>
		</tr>
		<tr>
			<td>Formating</td>
			<td>http://java.sun.com/jsp/jstl/fmt</td>
			<td>fmt</td>
			<td>< fmt : 태그명... ></td>
		</tr>
		<tr>
			<td>Function</td>
			<td>http://java.sun.com/jsp/jstl/function</td>
			<td>fn</td>
			<td>$ { fn : 태그명... }</td>
		</tr>
		<tr>
			<td>SQL</td>
			<td>http://java.sun.com/jsp/jstl/sql</td>
			<td>sql</td>
			<td>< sql : 태그명... ></td>
		</tr>
	</table>
	<hr>
	<div>
		앞의 기술된 라이브러리를 사용할 경우 반드시 상단에 jsp지시자 'taglib'를 사용하여 CDN을 기록해야한다.
	</div>
  <hr>
  <h2>Core 라이브러리 사용 예시</h2>
 	<pre>
 		<div style="font-size: 20px"><b>용도 : 변수제어(선언 / 값(일반, 객체)할당 / 출력 / 제거), 제어문(조건문, 반복문)</b></div>
 		변수선언 : < c : set var="변수명" value="값" />
 		변수출력 : < c : out value="값/변수/수식" />
 		변수제거 : < c : remove var="변수명"/>
 	</pre>
 	<hr>
 	
 	su1 변수를 선언 후 초기값으로 100을 할당? <c:set var="su1" value="100"></c:set><br>
 	값을 출력1? <c:out value="200"></c:out> <br>
 	값을 출력1? ${200} <br>
 	값을 출력2? <c:out value="${200}"></c:out> <br>
 	su1 변수 값을 출력? <c:out value="${su1}"/> <br>
 	su1 변수 값을 출력? ${su1} <br>
 	<%String name = "홍길동"; %>
 	문자열 출력1? <%= name %><br>
 	<% pageContext.setAttribute("name", name); %>
 	문자열 출력2? <c:out value="${name}"></c:out><br>
 	문자열 출력3? ${name} <br>
 	<hr>
	<div style="font-size: 20px"><b>JSTL 제어문(조건문: if, 반복문:foreach)</b></div>
 	<pre>
 	사용법 : < c : if test="$ {조건식}" > 조건식이 참일 때 수행내용< / c : if>
 	단점 : else문이 없다. 숫자 데이터라도 문자형식으로 비교한다.
 	</pre>
 	<p>su3=300, su4 = 400</p>
 	<c:set var="su3" value="${300}"/>
 	<c:set var="su4" value="400"/>
 	<div>su3 : ${su3} / su4 : ${su4}</div>
 	<div>1-1. su3 == su4 : <c:if test="${su3 == su4}">1-1. su3와 su4는 같다</c:if> </div>
 	<div>1-2. su3 eq su4 : <c:if test="${su3 eq su4}">1-2. su3와 su4는 같다</c:if> </div>
 	<div>2-1. su3 != su4 : <c:if test="${su3 != su4}">2-1. su3와 su4는 다르다</c:if> </div>
 	<div>2-2. su3 ne su4 : <c:if test="${su3 ne su4}">2-2. su3와 su4는 다르다</c:if> </div>
 	<div>3-1. su3 > su4 : <c:if test="${su3 > su4}">3-1. su3가 su4보다 크다</c:if> </div>
 	<div>3-2. su3 gt su4 : <c:if test="${su3 gt su4}">3-2. su3가 su4보다 크다</c:if> </div>
 	<div>4-1. su3 >= su4 : <c:if test="${su3 >= su4}">4-1. su3가 su4보다 크거나 같다</c:if> </div>
 	<div>4-2. su3 ge su4 : <c:if test="${su3 ge su4}">4-2. su3가 su4보다 크거나 같다</c:if> </div>
 	<div>5-1. su3 < su4 : <c:if test="${su3 < su4}">5-1. su3가 su4보다 작다</c:if> </div>
 	<div>5-2. su3 lt su4 : <c:if test="${su3 lt su4}">5-2. su3가 su4보다 작다</c:if> </div>
 	<div>6-1. su3 <= su4 : <c:if test="${su3 <= su4}">6-1. su3가 su4보다 작거나 같다</c:if> </div>
 	<div>6-2. su3 le su4 : <c:if test="${su3 le su4}">6-2. su3가 su4보다 작거나 같다</c:if> </div>
 	<br>
 	
 	<p>su5=500, su6 = 60</p>
 	<c:set var="su5" value="500"/>
 	<c:set var="su6" value="60"/>
 	<div>su5 : ${su5} / su6 : ${su6}</div>
 	<div>7. su5 > su6 : <c:if test="${su5 > su6}">7. su5가 su6보다 크다.</c:if> </div>
 	<div>8. su5 <= su6 : <c:if test="${su5 <= su6}">8. su5가 su6보다 작거나 같다.</c:if> </div>
 	
 	<br>
 	
 	<div>9. su5 > su6 : <c:if test="${su5+0 > su6+0}">9. su5가 su6보다 크다.</c:if> </div>
 	<div>10. su5 <= su6 : <c:if test="${su5+0 <= su6+0}">10. su5가 su6보다 작거나 같다.</c:if> </div>
 	
 	<br>
 	
 	<c:set var="su7" value="${500}"/>
 	<c:set var="su8" value="${60}"/>
 	<div>11. su7 > su8 : <c:if test="${su7 > su8}">11. su7가 su8보다 크다.</c:if> </div>
 	<div>12. su7 <= su8 : <c:if test="${su7 <= su8}">12. su7가 su8보다 작거나 같다.</c:if> </div>
 	<hr>
 	<div>예제 1 : URL에 점수jumsu)를 QuertString 방식으로 입력 후 학점을 구하시오.</div>
 	<div>변수명 : 입력점수는 jum, 학점은 grade로 처리</div>
 	<div>
 		<c:set var="jum" value="${param.jumsu}"/>
 		<c:if test="${jum >= 60}"><c:set var="grade" value="D"/></c:if>
 		<c:if test="${jum >= 70}"><c:set var="grade" value="C"/></c:if>
 		<c:if test="${jum >= 80}"><c:set var="grade" value="B"/></c:if>
 		<c:if test="${jum >= 90}"><c:set var="grade" value="A"/></c:if>
 		<c:if test="${jum < 60}"><c:set var="grade" value="F"/></c:if>
 		입력받은 점수 ${jum}의 학점은 ${grade} 입니다.
 	</div>
 	<br>
	<div style="font-size: 20px"><b>다중조건비교 : choose ~ when</b></div>
	<pre>
		사용법 :
		< c : choose >
			< c : when test="조건식1" > 수행할 내용1 < / c : when >
			< c : when test="조건식2" > 수행할 내용2 < / c : when >
			< c : when test="조건식3" > 수행할 내용3 < / c : when >
			< c : when test="조건식4" > 수행할 내용4 < / c : when >
			< c : otherwise > 기타 수행할 내용 < / c : otherwise>
		< / c : choose > 
	</pre>
	<div>
		학점은?
		<c:choose>
			<c:when test="${jum >= 90}"><c:set var="grade" value="A"/></c:when>
			<c:when test="${jum >= 80}"><c:set var="grade" value="B"/></c:when>
			<c:when test="${jum >= 70}"><c:set var="grade" value="C"/></c:when>
			<c:when test="${jum >= 60}"><c:set var="grade" value="D"/></c:when>
			<c:otherwise><c:set var="grade" value="F"/></c:otherwise>
		</c:choose>
		${grade} 입니다. (점수 : ${jum}점)
	</div>
	
	<br>
	<div>예제 2 : URL에 직급코드(code)를 QueryString 방식으로 입력 후 직급명을 출력하시오</div>
	<div>직급코드(kCode) : B(부장), K(과장), D(대리), S(사원) / 직급명(kName)</div>
	<div>직급코드가 앞의 코드 외의 값이 들어오면 "파견근로자"라고 출력된다</div>
	<div>
	<c:set var="kCode" value="${param.kCode}"/>
		<c:choose>
			<c:when test="${kCode eq 'B' || kCode eq 'b'}"><c:set var="kName" value="부장"/></c:when>
			<c:when test="${kCode eq 'K' || kCode eq 'k'}"><c:set var="kName" value="과장"/></c:when>
			<c:when test="${kCode eq 'D' || kCode eq 'd'}"><c:set var="kName" value="대리"/></c:when>
			<c:when test="${kCode eq 'S' || kCode eq 's'}"><c:set var="kName" value="사원"/></c:when>
			<c:otherwise><c:set var="kName" value="파견근로자"/></c:otherwise>
		</c:choose>
		<b>입력하신 직급코드의 직급은 <span style="color: red">${kName}</span> 입니다. (입력 : ${kCode})</b>
	</div>
</div>
<p><br/></p>
</body>
</html>