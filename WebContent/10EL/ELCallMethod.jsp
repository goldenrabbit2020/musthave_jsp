<%@ page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
<%
MyELClass myClass = new MyELClass(); // 객체 생성
pageContext.setAttribute("myClass", myClass); // page 영역에 저장
%>  
<html>
<head><title>표현 언어(EL) - 메서드 호출</title></head>
<body>
    <h3>영역에 저장 후 메서드 호출하기</h3>
    001225-3000000 => ${ myClass.getGender("001225-3000000") } <br />
    001225-2000000 => ${ myClass.getGender("001225-2000000") }

    <h3>클래스명을 통해 정적 메서드 호출하기</h3>
    ${ MyELClass.showGugudan(7) }
    
    <h3>TLD 파일 등록 후 정적 메서드 호출하기</h3>
    <ul>
        <li>mytag:isNumber("100") => ${ mytag:isNumber("100") }</li>
        <li>mytag:isNumber("이백") => ${ mytag:isNumber("이백") }</li>
    </ul> 
</body> 
</html>