<%@ page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginId = CookieManager.readCookie(request, "loginId");

String cookieCheck = "";
if (!loginId.equals("")) {
    cookieCheck = "checked";
}
%>
<html>
<head><title>Cookie - 아이디 저장하기</title></head>
<body>
    <h2>로그인 페이지</h2>
    <form action="IdSaveProcess.jsp" method="post">
    아이디 : <input type="text" name="user_id" value="<%= loginId %>" />  
        <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> />
        아이디 저장하기
    <br />
    패스워드 : <input type="text" name="user_pw" />
    <br />
    <input type="submit" value="로그인하기" />
    </form>
</body>
</html>