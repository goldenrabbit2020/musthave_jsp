<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");  // 일련번호 얻기 

BoardDTO dto = new BoardDTO();             // DTO 객체 생성
BoardDAO dao = new BoardDAO(application);  // DAO 객체 생성
dto = dao.selectView(num);  // 주어진 일련번호에 해당하는 기존 게시물 얻기

// 로그인된 사용자 ID 얻기
String sessionId = session.getAttribute("UserId").toString(); 

int delResult = 0;

if (sessionId.equals(dto.getId())) {  // 작성자가 본인인지 확인 
    // 작성자가 본인이면...
    dto.setNum(num);
    delResult = dao.deletePost(dto);  // 삭제!!! 
    dao.close();

    // 성공/실패 처리
    if (delResult == 1) { 
        // 성공 시 목록 페이지로 이동
        JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out); 
    } else {
        // 실패 시 이전 페이지로 이동
        JSFunction.alertBack("삭제에 실패하였습니다.", out);
    } 
} 
else { 
    // 작성자 본인이 아니라면 이전 페이지로 이동
    JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);

    return;
}
%>