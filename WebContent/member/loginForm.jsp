<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- loginForm.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link rel="stylesheet" type="text/css" href="aa.css">
	
	<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript" src="aa.js"></script>
</head>
<body>
	<h2>로그인</h2>
	<form name="loginForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return loginCheck()">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id" size="20"></td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw" size="20"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="reset" value="재입력">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>