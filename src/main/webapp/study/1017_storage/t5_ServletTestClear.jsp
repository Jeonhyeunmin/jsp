<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	application.removeAttribute("aMid");
%>
<script>
  location.href = "t5_ServletTest.jsp";
</script>