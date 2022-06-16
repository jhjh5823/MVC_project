<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- loginPro.jsp --%>

<%
// 회원가입 후 자동 로그인 될 때
// session.setAttribute("id", (String)request.getAttribute("id"));
%>

<%--
x=1; 로그인 성공
x=0; 암호가 일치하지 않음
x=-1; 없는 아이디
 --%>

<%-- 로그인 --%>
<c:if test="${x==1}">
	<c:set var="id" value="${id}" scope="session"/>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/main.do">
</c:if>

<%-- 암호가 일치하지 않을 때 --%>
<c:if test="${x==0}">
	<script>
	alert("비밀번호가 틀렸습니다.");
	history.back();
	</script>
</c:if>

<%-- 없는 아이디 --%>
<c:if test="${x==-1}">
	<script>
	alert("존재하지 않는 아이디입니다.");
	history.back();
	</script>
</c:if>