<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- deletePro.jsp --%>

<%-- 세션 무효화 --%>
<c:remove var="id" scope="session"/>

<%-- 삭제 성공 --%>
<c:if test="${x==1}">
	<h2>회원탈퇴 성공</h2>
	<meta http-equiv="Refresh" content="2;url=${ctxpath}/member/main.do">
</c:if>

<%-- 암호가 틀렸을 때 --%>
<c:if test="${x==-1}">
	<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
</c:if>