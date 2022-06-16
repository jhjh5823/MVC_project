<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- main.jsp --%>

<%-- 로그인 전 --%>
<c:if test="${empty sessionScope.id}">
	<table width="100%" align="right">
		<tr>
			<td align="right">
			<input type="button" value="로그인" onClick="location='${ctxpath}/member/loginForm.do'">
			<input type="button" value="회원가입" onClick="location='${ctxpath}/member/inputForm.do'">
			<img src="../imgs/javajava.png" width="100%">
			</td>
		</tr>
	</table>
</c:if>

<%-- 로그인 후 --%>
<c:if test="${!empty sessionScope.id}">
	<table width="100%">
		<tr>
			<td align="right">
			${sessionScope.id} 님 방문을 환영합니다.
			<br>
			<form method="post" action="${ctxpath}/member/logOut.do">
			<input type="button" value="마이페이지" onClick="location.href='${ctxpath}/member/modify.do'">
			<input type="submit" value="로그아웃">
			</form>
			<img src="../imgs/javajava.png" width="100%">
			</td>
		</tr>
	</table>
</c:if>