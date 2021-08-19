<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
String str1 = "JSP";
String str2 = "안녕하세요..";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP</title>
</head>
<body>
    <h2>처음 만들어보는 <%= str1 %></h2>
    <p>
        <%
        out.println(str2 + str1 + "입니다. 열공합시다^^*");
        %>
    </p>
</body>
</html>
