<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/review/header.jsp"%>
<%--deletePro.jsp --%>

<c:if test="${x==1}">
  <meta http-equiv="Refresh" content="0;url=${ctxpath}/review/list.do?pageNum=${pageNum}">
</c:if>

<c:if test="${x==0}">
암호가 틀립니다
  <a href="javaScript:history.back()">글삭제 폼으로 가기</a>
</c:if>
