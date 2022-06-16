<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>
<%--left.jsp--%>
<head>
<link rel="stylesheet" type="text/css" href="aa.css">
<style>
ul {
	font-size: 12;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
	background-color: #f1f1f1;
}

li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

li a.active {
	background-color: #4CAF50;
	color: white;
}

li a:hover:not (.active ) {
	background-color: #555;
	color: white;
}
</style>
</head>
<div id="divCategory">
  <ul>
    <li><a href="${ctxpath}/lecture/lectureList.do">강의목록</a></li>
    <li><a href="${ctxpath}/review/list.do">수강후기</a></li>
    <li><a href="${ctxpath}/notice_board/list.do">공지사항</a></li>
    <li><a href="${ctxpath}/board_QnA/list.do">Q&#38;A</a></li>
  </ul>
</div>