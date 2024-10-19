<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/include/bs4.jsp"/>
<script type="text/javascript">
	alert("사용할 수 없는 아이디입니다.");
	location.href = "<%=request.getContextPath()%>/study/exam/t02_login/t02_login.jsp";
</script>