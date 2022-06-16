<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/review/header.jsp" %>

<%--content.jsp --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stlyesheet" type="text/css" href="aa.css">
</head>
<body>
<h2>수강 후기</h2>
  <table border="1">
    <tr>
      <td>글번호</td>
      <td>${dto.num}</td>
      <td>조회수</td>
      <td>${dto.readcount}</td>
    </tr>
    
    <tr>
      <td>작성자</td>
      <td>${dto.writer}</td>
      <td>작성일</td>
      <td>${dto.regdate}</td>
     </tr>
     <tr>
      <td>강좌명</td>
      <td>${dto.lecture}</td>
    </tr>
    <tr>
      <td>글제목</td>
      <td colspan="3">
        ${dto.subject}
      </td>
    </tr>
    
    <tr>
      <td>글내용</td>
      <td colspan="3">
        <pre>${dto.content}</pre>
      </td>
    </tr>
    
    <tr>
      <td colspan="4" align="center">
        <input type="button" value="글수정" onclick="location.href='${ctxpath}/review/updateForm.do?num=${num}&pageNum=${pageNum}'">
        <input type="button" value="글삭제" onclick="location.href='${ctxpath}/review/deleteForm.do?num=${num}&pageNum=${pageNum}'">
        <input type="button" value="답글쓰기" onclick="location.href='${ctxpath}/review/writeForm.do?num=${num}&pageNum=${pageNum}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
        <input type="button" value="리스트" onclick="location.href='${ctxpath}/review/list.do?pageNum=${pageNum}'">
      </td>
      <td></td>
    </tr>
  </table>
</body>
</html>