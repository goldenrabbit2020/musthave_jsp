<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>인클루드된 페이지에서 매개변수 확인</h2>
<%= request.getParameter("loc1") %>에
<%= request.getParameter("loc2") %>이 있습니다.