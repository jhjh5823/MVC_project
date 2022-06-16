<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/header.jsp" %>

<head>
	<link rel="stylesheet" type="text/css"  href="aa.css">
</head>

<%--template.jsp 동적배치--%>
<html>
  <body>
    <table width="90%" height="90%">
      <tr>
        <td colspan="2" align="right">
          <jsp:include page="/module/top.jsp" flush="false"/>
        </td>
	  </tr>
	  
	  <tr>
      	<td colspan="2" align="center" height="20%" bgcolor="#9999CC">
          <a href="${ctxpath}/member/main.do"><img src="../imgs/javalogo.png"></a>
        </td>
      </tr>
      
      <tr>
        <td width="15%" valign="top"><%--왼쪽메뉴--%>
          <jsp:include page="/module/left.jsp" flush="false"/>
        </td>
        
        <td width="70%" height="90%" valign="top"><%--중앙에표시--%>
          <jsp:include page="${CONTENT}" flush="false"/>
        </td>
      </tr>
      
      <tr>
        <td colspan="2" width="700" align="center" valign="top">
          <jsp:include page="/module/bottom.jsp" flush="false"/>
        </td>
      </tr>
    </table>
  </body>
</html>