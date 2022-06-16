<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="aa.css">
	<script>
	function check(){
	  if (document.updateForm.pw.value==''){
		alert("암호를 입력하세요");
		document.updateForm.pw.focus();
		return false;
	}
	  return true;
}
	</script>
</head>
<body>
  <h2>글수정</h2>
  <form name="updateForm" method="post" action="${ctxpath}/review/updatePro.do?pageNum=${pageNum}" onsubmit="return check()">
    <table>
      <tr>
        <td>이름</td>
        <td><input type="text" name="writer" id="writer" size="20" value="${dto.writer}">
        <input type="hidden" name="num" value="${dto.num}">
        </td>
      </tr>
      
      <tr>
		  <td>강좌명</td>
		  <td><select name="lecture">
		  <option selected></option>
		    <option value="java">java</option>
		    <option value="mysql">mysql</option>
		    <option value="javaScript">javaScript</option>
		    <option value="html">html</option>
		    </select>
		    </td>
      <tr>
        <td>글제목</td>
        <td><input type="text" name="subject" id="subject" size="50" value="${dto.subject}"></td>
      </tr>
      <tr>
        <td>글내용</td>
        <td>
        <textarea name="content" id="content" rows="10" cols="50" >${dto.content}</textarea>
        </td>
      </tr>
      <tr>
        <td>암호</td>
        <td><input type="password" name="pw" id="pw" size="10"></td>
      </tr>
      
      <tr>
        <td colspan="2" align="center">
         <input type="submit" value="글수정">
         <input type="reset" value="다시쓰기">
         <input type="button" value="리스트" onclick="location.href='${ctxpath}/review/list.do?pageNum=${pageNum}'">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>