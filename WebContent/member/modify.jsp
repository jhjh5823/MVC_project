<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- modify.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="aa.css">
</head>
<body>
	<table>
		<tr>
			<td>
				<form name="updateForm" method="post" action="${ctxpath}/member/updateForm.do">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<input type="submit" value="회원정보 수정">
				</form>
			</td>

			<td>
				<form name="delForm" method="post" action="${ctxpath}/member/deleteForm.do">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<input type="submit" value="회원탈퇴">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>