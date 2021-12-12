<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>JSTL - if</title></head>
<body>
    <!-- 변수 선언 --> 
    <c:set var="number" value="100" />
    <c:set var="string" value="JSP" />

    <h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
    <c:if test="${ number mod 2 eq 0 }" var="result">
        ${ number }는 짝수입니다. <br />
    </c:if>
    result : ${ result } <br />

    <h4>문자열 비교와 else 구문 흉내내기</h4>
    <c:if test="${ string eq 'Java' }" var="result2">
        문자열은 Java입니다. <br />
    </c:if>
    <c:if test="${ not result2 }">
        'Java'가 아닙니다. <br />
    </c:if>
 
    <h4>조건식 주의사항</h4>
    <c:if test="100" var="result3">
        EL이 아닌 정수를 지정하면 false
    </c:if>
    result3 : ${result3 } <br />
    <c:if test="tRuE" var="result4">
        대소문자 구분 없이 "tRuE"인 경우 true <br />
    </c:if>
    result4 : ${ result4 } <br />
    <c:if test=" ${ true } "  var="result5">
        EL 양쪽에 빈 공백이 있는 경우 false <br />
    </c:if>
    result5 : ${ result5 } <br />
</body>
</html>