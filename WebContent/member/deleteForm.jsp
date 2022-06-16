<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- deleteForm.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="aa.css">
	<script type="text/javascript">
	function delcheck() {
		if(document.delForm.pw.value()=='') {
			alert("비밀번호를 입력하세요.");
			document.delForm.pw.focus();
			return false;
		}
		return true;
	}
	</script>
</head>
<body>
	<h2>회원탈퇴</h2>
	<form name="delForm" method="post" action="${ctxpath}/member/deletePro.do" onSubmit="return delcheck()">
		<table>
			<tr>
				<td>비밀번호</td>
				<td>
				<input type="password" name="pw" id="pw" size="20">
				<input type="hidden" name="id" value="${sessionScope.id}">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="회원탈퇴">
				<input type="button" value="취소" onClick="location='${ctxpath}/member/main.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>