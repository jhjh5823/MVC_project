<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- updateForm.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" type="text/css" href="aa.css">

	<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	function openDaumPostcode() {

		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('addr').value = data.address;
			}
		}).open();
	}//openDaumPostcode()-end
	</script>
	
	<script type="text/javascript" src="aa.js"></script>
</head>
<body>
	<h2>회원정보 수정</h2>
	<form method="post" action="${ctxpath}/member/updatePro.do" onSubmit="return updateCheck()">
		<table>
			<tr>
				<td>아이디</td>
				<td>
				${dto.id}
				<input type="hidden" name="id" id="id" value="${dto.id}">
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw" size="20"></td>
			</tr>
			
			<tr>
				<td>비밀번호 재확인</td>
				<td><input type="password" name="pw2" id="pw2" size="20"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" value="${dto.name}"size="20"></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="email" value="${dto.email}" size="40"></td>
			</tr>
			
			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="tel" id="tel" value="${dto.tel}" size="14"></td>
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>
				<input type="text" name="zipcode" id="zipcode" value="${dto.zipcode}" size="7" readonly>
				<input type="button" value="주소 찾기" onClick="openDaumPostcode()">
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id="addr" value="${dto.addr}" size="50" readonly></td>
			</tr>
			
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="addr2" id="addr2" value="${dto.addr2}" size="20"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="수정">
				<input type="reset" value="재입력">
				<input type="button" value="취소" onClick="location='${ctxpath}/member/main.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>