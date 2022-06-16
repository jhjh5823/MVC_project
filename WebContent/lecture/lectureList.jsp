<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lectureList.jsp</title>
	<link rel="stylesheet" type="text/css" href="aa.css">
	<style type="text/css">
	table {margin: auto;}
	</style>
</head>
<body>
  <table border="10" width="90%" bordercolor="gray">
    <tr>
      <td width="20%"><img src="../imgs/munjajava.JPG"></td>
      <td><a href="${ctxpath}lectureJava.do">&nbsp;자바 프로그래밍 강의 들으러 가기</a></td>
  </table>
  <br>
  <table border="10" width="90%" bordercolor="gray">
    <tr>
      <td width="20%"><img src="../imgs/munjapython.JPG"></td>
      <td><a href="${ctxpath}lecturePython.do">&nbsp;파이썬 프로그래밍 강의 들으러 가기</a></td>
  </table>
  <br>
  <table border="10" width="90%" bordercolor="gray">
    <tr>
      <td width="20%"><img src="../imgs/mundb.JPG"></td>
      <td><a href="${ctxpath}lectureDB.do">&nbsp;데이터 베이스 활용 강의 들으러 가기</a></td>
  </table>
  <br>
  <table border="10" width="90%" bordercolor="gray">
    <tr>
      <td width="20%"><img src="../imgs/munjabigdata.JPG"></td>
      <td><a href="${ctxpath}lectureBigdb.do">&nbsp;빅데이터 시스템 강의 들으러 가기</a></td>
  </table>
</body>
</html>