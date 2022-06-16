<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>
<%--writeForm.jsp --%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" type="text/css" href="aa.css">
   
   <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
   
   <script type="text/javascript" src="aa.js"></script>
   
   
</head>
<body>
  <h2>
  <c:if test="${num==0}">
      문의하기       
  </c:if>
  <c:if test="${num!=0}">
      답변하기
  </c:if>
 </h2>
 
  <form name="writeForm" method="post" action="${ctxpath}/board_QnA/writePro.do" onSubmit="return check()">
    <input type="hidden" name="num" value="${num}">
    <input type="hidden" name="ref" value="${ref}">
    <input type="hidden" name="re_step" value="${re_step}">
    <input type="hidden" name="re_level" value="${re_level}">
    
    <table>
    
       <tr>
         <td colspan="2" align="right">
           <a href="${ctxpath}/board_QnA/list.do">목록</a>
         </td>
       </tr>
       
       <tr>
         <td>*작성자</td>
         <td><input type="text" name="writer" id="writer" size="20"  placeholder="작성자를 입력해 주세요"></td>
       </tr>
       
       <tr>
         <td>*제목</td>
         <td>
           <c:if test="${num==0}">
             <input type="text" name="subject" id="subject" size="50" placeholder="제목을 입력해 주세요">
           </c:if>
           
           <c:if test="${num!=0}">
             <input type="text" name="subject" id="subject" size="50" value="[답글]">
           </c:if>
         </td>
       </tr>
       
       <tr>
         <td>*내용</td>
         <td>
         <textarea name="content" id="content" rows="10" cols="50" placeholder="불건전한 내용 (예: 개인정보보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방 등) 또는 광고성 게시물은 사전 통보 없이 삭제 처리될 수 있으며, 등록된 의견은 수정이 불가하오니 이 점 양지하여 주시기 바랍니다." cols="20" style="width:553px; height:200px"></textarea>
         </td>
       </tr>
       
       <tr>
         <td>*암호</td>
         <td><input type="password" name="pw" id="pw" size="10"></td>
       </tr>
       
       
    </table>
    <div align="center">
         <br>
           <c:if test="${num==0 }">
             <input type="submit" value="문의하기">
           </c:if>
           
           <c:if test="${num!=0}">
             <input type="submit" value="답변하기">
          </c:if>
           
           <input type="reset" value="취소하기">
        
    </div>
  </form>
</body>
</html>