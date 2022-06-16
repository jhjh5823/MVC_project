<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%--list.jsp --%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" type="text/css" href="aa.css">
	  <script>
    function check(){
       if($('#keyWord').val=''){
          alert("검색어를 입력하세요.");
          $('#keyWord').focus();
          return false;
       }
       return true;
    }//check()-end========================
   </script>
	
</head>
<body>
  <h2> 문의내역 (전체글: ${count})</h2><br>
    <table class="wid">
      <tr>
        <td>
  		  <a href="${ctxpath}/board_QnA/writeForm.do">
             <input type="button" value="글쓰기">
          </a>
       </td>
	 </tr>
	</table>
      
      
  <c:if test="${count==0}">
  <table class="wid">
  	 
  <colgroup>
              <col width="7%">
              <col width="15%">
              <col width="">
              <col width="15%">
              <col width="7%">
              </colgroup>
              <tr bgcolor="#f1f1f1">
                <td scope="col">번호</td>
                <td scope="col">작성자</td>
                <td scope="col">질문</td>
                <td scope="col">문의일자</td>
                <td scope="col">조회수</td>
              </tr>
              
              <tr>
                <td colspan="5" align="center"><strong>문의내역이 없습니다.</strong></td>
              </tr>
  </table>
  </c:if>
  
  <c:if test="${count>0}">
    <table class="wid">
      
  <colgroup>
              <col width="7%">
              <col width="15%">
              <col width="">
              <col width="15%">
              <col width="7%">
              </colgroup>
              <tr bgcolor="ivory" align="center">
                <td scope="col">번호</td>
                <td scope="col">작성자</td>
                <td scope="col">질문</td>
                <td scope="col">문의일자</td>
                <td scope="col">조회수</td>
              </tr>
      
      <c:forEach var="dto" items="${list}">
        <tr align="center" >
          <td>
           <c:out value="${number}"/>
           <c:set var="number" value="${number-1}"/>
          </td>
          
          <td>${dto.writer}</td>
          <td>
            <%--답글 --%>
            <c:if test="${dto.re_level>0}">
              <img src="../imgs/level.gif" width="${3*dto.re_level}" height="16">
              <img src="../imgs/re.gif">
            </c:if>
            
            <%--원글 --%>
            <c:if test="${dto.re_level==0}">
              <img src="../imgs/level.gif" width="${5*dto.re_level}" height="16">
            </c:if>
            
            <%--글제목을 클릭하면 글내용 보기로 가기  --%>
            <a href="${ctxpath}/board_QnA/content.do?num=${dto.num}&pageNum=${currentPage}">
            ${dto.subject}
            </a>
            
            <%--조회수가10번 이상이면 hot.gif 표시 --%>
            <c:if test="${dto.readcount>=10}">
              <img src="../imgs/hot.gif">
            </c:if>
          </td>
          
          
          <td>${dto.regdate}</td>
          <td>${dto.readcount}</td>
        </tr>
      </c:forEach>
    </table>
  </c:if>

  <%--블럭 처리 , 페이지 처리  --%>
  <table style="border:solid 1px #FFF" class="wid" >
    <tr>
     <td align="center">
       <c:if test="${count>0}">
       
         <%--에러 방지 --%>
         <c:if test="${endPage>pageCount}">
           <c:set var="endPage" value="${pageCount}"/>
         </c:if>
       
         <%--이전블럭 --%>
         <c:if test="${startPage>10}">
           <a href="${ctxpath}/board_QnA/list.do?pageNum=${startPage-10}">
             [이전 블럭]
           </a>
         </c:if>
         
         <%--페이지 처리 --%>
         <c:forEach var="i" begin="${startPage}" end="${endPage}">
           <a href="${ctxpath}/board_QnA/list.do?pageNum=${i}">
           [${i}]
           </a>
         </c:forEach>
         
         <%--다음블럭 --%>
         <c:if test="${endPage<pageCount}">
           <a href="${ctxpath}/board_QnA/list.do?pageNum=${startPage+10}">
           [다음 블럭]
           </a>
         </c:if>
       </c:if>
     </td>
    </tr>   
  </table>
   <%--글검색 searchForm--%>
  <form name="searchForm" method="post" action="${ctxpath}/board_QnA/list.do" >
    <table align="center">
      <tr>
        <td valign="bottom">
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
