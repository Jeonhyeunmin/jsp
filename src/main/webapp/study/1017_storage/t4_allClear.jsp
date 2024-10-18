<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();
	application.removeAttribute("aCount");
%>
<script>
  alert("모든 카운트 초기화");
  location.href = "t4_StorageTest.jsp";
</script>