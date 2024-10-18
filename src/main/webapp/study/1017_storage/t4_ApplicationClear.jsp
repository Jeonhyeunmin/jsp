<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	application.removeAttribute("aCount");
%>

<script>
  alert("어플리케이션 카운트 초기화");
  location.href = "t4_StorageTest.jsp";
</script>