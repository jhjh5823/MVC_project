<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<%--updatePro.jsp --%>
 
 <c:if test="${x==1}">
   <meta http-equiv="Refresh" content="0;url=${ctxpath}/board_QnA/list.do?pageNum=${pageNum}">
 </c:if>
 
 <c:if test="${x==0}">
   암호가 틀립니다.
   <br>
   <a href="javaScript:history.back()">수정 폼으로 가기</a>
 </c:if>