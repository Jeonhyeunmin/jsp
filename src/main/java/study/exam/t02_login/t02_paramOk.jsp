<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t02_paramOk.jsp -->
<%
	String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
	
	pageContext.setAttribute("mid", mid);
	pageContext.setAttribute("pwd", pwd);
%>
<h2>회원정보</h2>
<p>아이디 : ${mid}</p>
<p>비밀번호 : ${pwd}</p>
<hr/>
<%!
	String idList[] = {"hkd1234S", "kms1234C", "lkj1234J", "adminI", "atom1234I", "btom1234J", "ctom1234C"};
%>
<%
	for(int i = 0; i < mid.length(); i++){
		if(idList[i].equals(mid) && pwd.equals("1234")){
			%>
			alert("회원입니다.");
			<%
		}
	}
%>
<%
	if(mid.substring(mid.length()-1).equals("I")){
%>
	<jsp:forward page="t08_resI.jsp">
		<jsp:param value="${mid}" name="mid"/>
		<jsp:param value="${pwd}" name="pwd"/>
	</jsp:forward>
<%	
	}
	else if(mid.substring(mid.length()-1).equals("J")){
%>
	<jsp:forward page="t08_resJ.jsp">
		<jsp:param value="${mid}" name="mid"/>
		<jsp:param value="${pwd}" name="pwd"/>
	</jsp:forward>
<%	
	}
	else if(mid.substring(mid.length()-1).equals("S")){
%>
	<jsp:forward page="t08_resS.jsp">
		<jsp:param value="${mid}" name="mid"/>
		<jsp:param value="${pwd}" name="pwd"/>
	</jsp:forward>
<%	
	}
	else if(mid.substring(mid.length()-1).equals("C")){
%>
	<jsp:forward page="t08_resC.jsp">
		<jsp:param value="${mid}" name="mid"/>
		<jsp:param value="${pwd}" name="pwd"/>
	</jsp:forward>
<%	
	}
%>