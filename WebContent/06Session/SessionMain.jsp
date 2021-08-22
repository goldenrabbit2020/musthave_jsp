<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");  // 날짜 표시 형식

long creationTime = session.getCreationTime();  // 최초 요청(세션 생성) 시각
String creationTimeStr = dateFormat.format(new Date(creationTime));

long lastTime = session.getLastAccessedTime();  // 마지막 요청 시각
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>
<html>
<head><title>Session</title></head>
<body>
    <h2>Session 설정 확인</h2>
    <ul>
        <li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
        <li>세션 아이디 : <%= session.getId() %></li>
        <li>최초 요청 시각 : <%= creationTimeStr %></li>
        <li>마지막 요청 시각 : <%= lastTimeStr %></li>
    </ul>
</body>
</html>
