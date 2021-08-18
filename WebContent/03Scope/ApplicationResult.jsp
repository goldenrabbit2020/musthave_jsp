<%@ page import="java.util.Set"%>
<%@ page import="common.Person"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>application 영역</title></head>
<body>
    <h2>application 영역의 속성 읽기</h2>
    <%
    Map<String, Person> maps
            = (Map<String, Person>)application.getAttribute("maps");
    Set<String> keys = maps.keySet(); 
    for (String key : keys) {
        Person person = maps.get(key);
        out.print(String.format("이름 : %s, 나이 : %d<br/>", 
                person.getName(), person.getAge()));
    }  
    %>
</body>
</html>