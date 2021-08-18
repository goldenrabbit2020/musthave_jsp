<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>Cookie</title></head>
<body>
    <h2>1. 쿠키(Cookie) 설정</h2>
    <%
    Cookie cookie = new Cookie("myCookie", "쿠키맛나요");  // 쿠키 생성
    cookie.setPath(request.getContextPath());  // 경로를 컨텍스트 루트로 설정
    cookie.setMaxAge(3600);  // 유지 기간을 1시간으로 설정
    response.addCookie(cookie);  // 응답 헤더에 쿠키 추가
    %>

    <h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
    <%
    Cookie[] cookies = request.getCookies();  // 요청 헤더의 모든 쿠키 얻기
    if (cookies!=null) {
        for (Cookie c : cookies) {  // 쿠키 각각의
            String cookieName = c.getName();  // 쿠키 이름 얻기
            String cookieValue = c.getValue();  // 쿠키 값 얻기
            // 화면에 출력
            out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
        }
    }
    %>

    <h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
    <a href="CookieResult.jsp">
        다음 페이지에서 쿠키값 확인하기
    </a>
</body>
</html>