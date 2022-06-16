<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%--inputPro.jsp--%>
<html>
<head>
<style type="text/css">
h2 {text-align: center;}
</style>
</head>

<body>
	<table>
		<tr>
			<td>
			<h3>회원가입 성공</h3>
			</td>
		</tr>
		
		<tr>
			<td>
				<form>
				<input type="button" value="메인으로" onClick="location='${ctxpath}/member/main.do'">
				</form>
			</td>
		</tr>
	</table>
	
	<meta http-equiv="Refresh" content="5;url=${ctxpath}/member/main.do">
</body>
</html>