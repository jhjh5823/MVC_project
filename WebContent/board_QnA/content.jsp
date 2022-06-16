<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%--content.jsp --%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="aa.css">
</head>
<body class="wid">
  <h2>질문내용</h2>
  <table style="border:solid 1px #FFF">
     <tr>
       <td>글번호:&nbsp;</td>
       <td>
       <pre>${dto.num}</pre>
       </td>
     </tr>
     <tr></tr>
     <tr>      
       <td>작성자: </td>
       <td>
       <pre>${dto.writer}</pre>
       </td>
      </tr> 
     <tr>
       <td>작성일: </td>
       <td>
       <pre>${dto.regdate}</pre>
     	</td>
     </tr>
     
     <tr>
       <td>글제목: </td>
       <td colspan="3">
        <pre>${dto.subject}</pre>
       </td>    
     </tr>

     <tr>
       <td>글내용: </td>
       <td colspan="3">
          <pre>${dto.content}</pre>
       </td>
     </tr>
  </table>
  <div>
  <br>
  </div>
  <table style="border:solid 1px #FFF">
  <tr>
       <td colspan="4" align="center">
         <input type="button" value="수정하기" onClick="location.href='${ctxpath}/board_QnA/updateForm.do?num=${num}&pageNum=${pageNum}'">
         <input type="button" value="삭제하기" onClick="location.href='${ctxpath}/board_QnA/deleteForm.do?num=${num}&pageNum=${pageNum}'">
         <input type="button" value="답변하기" onClick="location.href='${ctxpath}/board_QnA/writeForm.do?num=${num}&pageNum=${pageNum}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
         
       </td>
     </tr>
  </table>
</body>
</html>