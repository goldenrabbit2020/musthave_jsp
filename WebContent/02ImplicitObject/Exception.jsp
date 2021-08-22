<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - exception</title></head>
<body>
<%
int status = response.getStatus();  // response 내장 객체로부터 에러 코드 확인

// 에러 코드에 따라 적절한 메시지 출력
if (status == 404) {
    out.print("404 에러가 발생하였습니다.");
    out.print("<br/>파일 경로를 확인해주세요.");
}
else if (status == 405) {
    out.print("405 에러가 발생하였습니다.");
    out.print("<br/>요청 방식(method)을 확인해주세요.");
}
else if (status == 500) {
    out.print("500 에러가 발생하였습니다.");
    out.print("<br/>소스 코드에 오류가 없는지 확인해주세요.");
}
%>
</body>
</html>
