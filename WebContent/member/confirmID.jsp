<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="member.*"
    %>
<%-- confirmID.jsp --%>
<%
String id=request.getParameter("id"); // Ajax에서 보내 주는 데이터 받기
MemberDAO dao=MemberDAO.getDao(); // dao 객체 얻기
int x=dao.confirmID(id); // dao 메서드 호출, x값 받음
%>

{
"x":<%=x %>
}