<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 예시에서 사용할 변수 선언
int num1 = 3;
pageContext.setAttribute("num2", 4);
pageContext.setAttribute("num3", "5");  
pageContext.setAttribute("num4", "8");  
%>    
<html>
<meta charset="UTF-8">
<head><title>표현 언어(EL) - 연산자</title></head>
<body>
    <h3>변수 선언 및 할당</h3> 
    스크립틀릿에서 선언한 변수 : ${ num1 } <br />
    page 영역에 저장된 변수 : ${ num2 } <br />
    변수 할당 및 즉시 출력 : ${ num1 = 7 } <br />
    변수 할당 및 별도 출력 : ${ num2 = 8;'' } => ${ num2 } <br />
    num1 = ${ num1 }, num2 = ${ num2 }, num3 = ${ num3 }, num4 = ${ num4 }
    
    <h3>산술 연산자</h3>
    num1 + num2 : ${ num1 + num2 } <br />
    num1 - num2 : ${ num1 - num2 } <br />
    num1 * num2 : ${ num1 * num2 } <br />
    num3 / num4 : ${ num3 / num4 } <br />
    num3 div num4 : ${ num3 div num4 } <br />
    num3 % num4 : ${ num3 % num4 } <br />
    num3 mod num4 : ${ num3 mod num4 }
   
    <h3>+ 연산자는 덧셈만 가능</h3>  
    num1 + "34" : ${ num1 + "34" } <br /> 
    num2 + "이십" : \${num2 + "이십" }<!-- 에러 발생(주석 처리) --> <br />
    "삼십" + "사십" : \${"삼십" + "사십" }<!-- 에러 발생(주석 처리) -->
    
    <h3>비교 연산자</h3>
    num4 > num3 : ${ num4 gt num3 } <br />
    num1 < num3 : ${ num1 lt num3 } <br />
    num2 >= num4 : ${ num2 ge num4 } <br />
    num1 == num4 : ${ num1 eq num4 } 

    <h3>논리 연산자</h3>
    num3 <= num4 && num3 == num4 : ${ num3 le num4 and num3 eq num4 } <br />
    num3 >= num4 || num3 != num4 : ${ num3 ge num4 or num3 ne num4 }
</body>
</html>