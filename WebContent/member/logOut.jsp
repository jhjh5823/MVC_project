<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%-- logOut.jsp --%>

<%-- 로그아웃 = 변수 제거 --%>
<c:remove var="id" scope="session"/>

<meta http-equiv="Refresh" content="0;url=${ctxpath}/member/main.do">