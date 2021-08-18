<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 폼값 처리</title></head>
<body>
    <h3>EL로 폼값 받기</h3>
    <ul>
        <li>이름 : ${ param.name }</li>
        <li>성별 : ${ param.gender }</li>
        <li>학력 : ${ param.grade }</li>
        <li>관심사항 : ${ paramValues.inter[0] } 
            ${ paramValues.inter[1] }
            ${ paramValues.inter[2] }
            ${ paramValues.inter[3] }</li> 
    </ul>
</body>
</html>