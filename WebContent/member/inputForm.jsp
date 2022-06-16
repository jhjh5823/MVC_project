<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- inputForm.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
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
	<h2>회원가입</h2>
	<form name="inputForm" method="post" action="${ctxpath}/member/inputPro.do" onSubmit="return check()">
		<table>
			<tr>
				<td>아이디</td>
				<td>
				<input type="text" name="id" id="id" size="20" placeholder="아이디 입력">
				<input type="button" value="중복 확인" onClick="confirmIDcheck()">
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw" size="12"></td>
			</tr>
			
			<tr>
				<td>비밀번호 재확인</td>
				<td><input type="password" name="pw2" id="pw2" size="12"></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" size="30"></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="email" size="40"></td>
			</tr>
			
			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="tel" id="tel" size=14></td>
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>
				<input type="text" name="zipcode" id="zipcode" size="7" readonly>
				<input type="button" value="주소 찾기" onClick="openDaumPostcode()">
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id="addr" size="50" readonly></td>
			</tr>
			
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="addr2" id="addr2" size="20"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시 입력">
				<input type="button" value="뒤로 가기" onClick="location='${ctxpath}/member/main.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>