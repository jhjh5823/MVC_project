<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="boardmysql.*"
    import="java.util.*"
    %>
<%@ include file="header.jsp" %>
<%--list.jsp--%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>list.jsp</title>
  <link rel="stylesheet" type="text/css" href="aa.css">
</head>
<body>
  <h2>공지사항(전체글:${count})</h2>
  <c:if test="${count==0}">
     게시판에 저장된 글이 없습니다.
   <br> 
   <input type="button" value="공지사항 작성하기" onClick="location='${ctxpath}/notice_board/writeForm.do'">
  </c:if>
  <c:if test="${count>0}">
    <table border="1" width="90%">
    <tr>
      <td colspan="6" align="right">
        <a href="${ctxpath}/notice_board/writeForm.do">글쓰기</a>
      </td>
    </tr>
    <tr height="30" bgcolor="#83AEF4">
      <td>번호</td>
	  <td>글제목</td>
	  <td>작성자</td>
	  <td>작성일</td>
	  <td>조회수</td>
	  <td>IP</td>
    </tr>
    <c:forEach var="dto" items="${list}">
      <tr>
        <td>
          <c:out value="${number}"/>
          <c:set var="number" value="${number-1}"/>
        </td>
        <td>
          <%--답글--%>
          <c:if test="${dto.re_level>0}">
            <img src="../imgs/level.gif" width="${5*dto.re_level}" height="16">
            <img src="../imgs/re.gif">
          </c:if>
          <%--원글--%>
          <c:if test="${dto.re_level==0}">
            <img src="../imgs/level.gif" width="${5*dto.re_level}" height="16">
          </c:if>
          <%--글제목을 클릭하면 글내용보기로 가기--%>
          <a href="${ctxpath}/notice_board/content.do?num=${dto.num}&pageNum=${currentPage}">
          ${dto.subject}
          </a>
        </td>
        <td width="60">${dto.writer}</td>
        <td>${dto.regdate}</td>
        <td>${dto.readcount}</td>
        <td>${dto.ip}</td>
      </tr>
    </c:forEach>
  </table>
  </c:if>
  <%--블럭처리,페이지 처리 --%>
  <table class="wid">
    <tr>
      <td align="center">
        <c:if test="${count>0}">
          <%--에러방지--%>
          <c:if test="${endPage>pageCount}">
            <c:set var="endPage" value="${pageCount}"/>
          </c:if>
          <%--이전블럭--%>
          <c:if test="${startPage>10}">
            <a href="${ctxpath}/notice_board/list.do?pageNum=${startPage-10}">
             [이전블럭]
            </a>
          </c:if>
          <%--페이지 처리--%>
          <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="${ctxpath}/notice_board/list.do?pageNum=${i}">
            [${i}]
            </a>
          </c:forEach>
          <%--다음블럭--%>
          <c:if test="${endPage<pageCount}">
            <a href="${ctxpath}/notice_board/list.do?pageNum=${startPage+10}">
            [다음블럭]
            </a>
          </c:if>
        </c:if>
      </td>
    </tr>
  </table>
  <%--글검색 searchForm--%>
  <form name="searchForm" method="post" action="${ctxpath}/notice_board/list.do">
    <table border="1">
      <tr>
        <td align="center" valign="bottom">
          <select name="keyField">
            <option value="subject">제목</option>
            <option value="writer">작성자</option>
            <option value="content">글내용</option>
          </select>
          <input type="text" name="keyWord" size="16">
          <input type="hidden" name="page" value="0">
          <input type="submit" value="검색">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>