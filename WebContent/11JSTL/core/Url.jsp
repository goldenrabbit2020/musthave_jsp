<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head><title>JSTL - url</title></head>
<body>
    <h4>url 태그로 링크 걸기</h4>
    <c:url value="/11JSTL/inc/OtherPage.jsp" var="url"> 
        <c:param name="user_param1" value="Must" /> 
        <c:param name="user_param2">Have</c:param> 
    </c:url>
    <a href="${url }">OtherPage.jsp 바로가기</a> 
</body>
</html>