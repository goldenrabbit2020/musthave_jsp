<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="smtp.NaverSMTP"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 폼값(이메일 내용) 저장
Map<String, String> emailInfo = new HashMap<String, String>();
emailInfo.put("from", request.getParameter("from"));  // 보내는 사람
emailInfo.put("to", request.getParameter("to"));      // 받는 사람
emailInfo.put("subject", request.getParameter("subject"));  // 제목

// 내용은 메일 포맷에 따라 다르게 처리
String content = request.getParameter("content");  // 내용
String format = request.getParameter("format");    // 메일 포맷(text 혹은 html)
if (format.equals("text")) {
    // 텍스트 포맷일 때는 그대로 저장
    emailInfo.put("content", content);
    emailInfo.put("format", "text/plain;charset=UTF-8");
}
else if (format.equals("html")) {
    // HTML 포맷일 때는 HTML 형태로 변환해 저장
    content = content.replace("\r\n", "<br/>");  // 줄바꿈을 HTML 형태로 수정

    String htmlContent = ""; // HTML용으로 변환된 내용을 담을 변수
    try {
        // HTML 메일용 템플릿 파일 읽기
        String templatePath = application.getRealPath("/16EmailSend/MailForm.html");
        BufferedReader br = new BufferedReader(new FileReader(templatePath));

        // 한 줄씩 읽어 htmlContent 변수에 저장
        String oneLine;
        while ((oneLine = br.readLine()) != null) {
            htmlContent += oneLine + "\n";
        }
        br.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }

    // 템플릿의 "__CONTENT__" 부분을 메일 내용 대체 (변환 완료)
    htmlContent = htmlContent.replace("__CONTENT__", content);
    // 변환된 내용을 저장
    emailInfo.put("content", htmlContent);
    emailInfo.put("format", "text/html;charset=UTF-8");
}

try {
    NaverSMTP smtpServer = new NaverSMTP();  // 메일 전송 클래스 생성
    smtpServer.emailSending(emailInfo);      // 전송
    out.print("이메일 전송 성공");
}
catch (Exception e) {
    out.print("이메일 전송 실패");
    e.printStackTrace();
}
%>
