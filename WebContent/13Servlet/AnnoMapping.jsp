<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
    <h2>애너테이션으로 매핑하기</h2>
    <p>
        <strong>${ message }</strong>
        <br />        
        <a href="<%= request.getContextPath() %>/13Servlet/AnnoMapping.do">바로가기</a>
    </p>
</body>
</html>