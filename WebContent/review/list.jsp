<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<%--list.jsp --%>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="aa.css">


</head>
<body>
	<h2>수강후기(전체글:${count})</h2>
	<c:if test="${count==0}">
	게시판에 저장된 글이 없습니다.
	<table border="1" class="wid">
	    <tr>
	      <td colspan="6" align="center">
	        <a href="${ctxpath}/review/writeForm.do">글쓰기</a>
	      </td>
	    </tr>
	</c:if>
	
	<c:if test="${count>0}">
	  <table border="1" class="wid">
	    <tr>
	      <td colspan="6" align="center">
	        <a href="${ctxpath}/review/writeForm.do">글쓰기</a>
	      </td>
	    </tr>
	    
	    <tr height="30" bgcolor="ivory">
	      <td>번호</td>
	      <td>글제목</td>
	      <td>작성자</td>
	      <td>강좌명</td>
	      <td>작성일</td>
	      <td>조회수</td>
	      
	    </tr>
	    <c:forEach var="dto" items="${list}">
	      <tr>
	        <td>
	          <c:out value="${number}"/>
	          <c:set var="number" value="${number-1}"/>
	        </td>
	        
	        <td>
	        <%--답글처리 --%>
	          <c:if test="${dto.re_level>0}">
	            <img src="../imgs/level.gif" width="${5*dto.re_level}" height="16">
	            <img src="../imgs/re.gif">
	          </c:if>
	         <%--답글처리 --%>
	          <c:if test="${dto.re_level==0}">
	            <img src="../imgs/level.gif" width="${5*dto.re_level}" height="16">
	          </c:if>
	          <%--글제목을 클릭하면 글내용 보기로 가기 --%>
	          <a href="${ctxpath}/review/content.do?num=${dto.num}&pageNum=${currentPage}">
	          ${dto.subject}
	          </a>
	          
	          <%--조회수가 10번 이상이면 hot.gif표시 --%>
	          <c:if test="${dto.readcount>=10}">
	            <img src="../imgs.gif">
	          </c:if>
	        </td>
	        
	        <td>${dto.writer}</td>
	        <td>${dto.lecture}</td>
	        <td>${dto.regdate}</td>
	        <td>${dto.readcount}</td>
	        
	      </tr>
	    
	    </c:forEach>
	  </table>
	</c:if>
	
	<%--블럭처리 페이지처리 --%>
	<table class="wid">
	  <tr>
	    <td align="center">
	      <c:if test="${count>0}">
	      <%--에러방지 --%>
	        <c:if test="${endPage>pageCount}">
	          <c:set var="endPage" value="${pageCount}"/>
	        </c:if>
	        <%--이전블럭 --%>
	        <c:if test="${startpage>10}">
	          <a href="${ctxpath}/review/list.do?pageNum=${startPage-10}">
	           [이전블럭]
	           </a>
	        </c:if>
	        <%--페이지처리 --%>
	        <c:forEach var="i" begin="${startPage}" end="${endPage}">
	          <a href="${ctxpath}/review/list.do?pageNum=${i}">
	          [${i}]
	          </a>
	        </c:forEach>
	        
	        <%--다음블럭 --%>
	        <c:if test="${endPage<pageCount}">
	          <a href="${ctxpath}/review/list.do?pageNum=${startPage+10}">
	          [다음블럭]
	          </a>
	        </c:if>
	      </c:if>
	    </td>
	  </tr>
	</table>
	
	<%--글검색searchForm --%>
   <form name="searchForm" method="post" action="${ctxpath}/review/list.do" onSubmit="return check()">
    <table border="1">
      <tr>
        <td align="center" valign="bottom">
          <select name="keyField">
            <option value="subject">제목</option>
            <option value="name">이름</option>
            <option value="content">글내용</option>
          </select>
          
          <input type="text" name="keyWord" size="16">
          <input type="hidden" name="page" value="0">
          <input type="button" value="검색" >
        </td>
      </tr>
    </table>
  </form>
  
  <%--listForm --%>
  <form name="listForm" method="post">
    <input type="hidden" name="reLoad" value="true">
    <input type="hidden" name="page" value="0">
    <input type="hidden" name="nowBlock" value="0">
  </form>
  </form>
</body>
</html>