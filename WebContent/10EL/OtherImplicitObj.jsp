<%@ page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 그 외 내장 객체</title></head>
<body>
    <h3>쿠키값 읽기</h3>
    <li>ELCookie값 : ${ cookie.ELCookie.value }</li>
    
    <h3>HTTP 헤더 읽기</h3>
    <ul>
        <li>host : ${ header.host }</li>
        <li>user-agent : ${ header['user-agent'] }</li>
        <li>cookie : ${ header.cookie }</li>
    </ul>
    
    <h3>컨텍스트 초기화 매개변수 읽기</h3>
    <li>OracleDriver : ${ initParam.OracleDriver }</li>

    <h3>컨텍스트 루트 경로 읽기</h3>
    <li>${ pageContext.request.contextPath }</li>
</body>
</html>