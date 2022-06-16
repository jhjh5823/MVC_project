<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>    
<%--deletePro.jsp --%>
 
 <c:if test="${x==1}">
 <script>
 alert("삭제가 완료되었습니다.")
 </script>
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/board_QnA/list.do?pageNum=${pageNum}">
 </c:if>
 
 <c:if test="${x==0}">
 <h2>암호가 틀립니다.</h2>
  <a href="javaScript:history.back()">글삭제 폼으로 가기</a>
 </c:if>