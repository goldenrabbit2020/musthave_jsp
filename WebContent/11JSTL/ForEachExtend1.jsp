<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<html>
<head><title>JSTL - forEach2</title></head>
<body>
    <h4>향상된 for문 형태의 forEach 태그</h4>
    <%
    String[] cmyk = {"Cyan","Magenta","Yellow","Black"};
    %>    
    <c:forEach items="<%= cmyk %>" var="c">
        <span style="color:${ c };">${ c }</span>
    </c:forEach>
        
    <h4>varStatus 속성 살펴보기</h4>
    <table border="1">
    <c:forEach items="<%= cmyk %>" var="c" varStatus="loop">     
        <tr>
            <td>count : ${ loop.count }</td>
            <td>index : ${ loop.index }</td> 
            <td>current : ${ loop.current }</td> 
            <td>first : ${ loop.first }</td> 
            <td>last : ${ loop.last }</td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>