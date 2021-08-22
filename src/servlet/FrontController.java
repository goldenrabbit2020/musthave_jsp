package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        int lastSlash = uri.lastIndexOf("/");
        String commandStr = uri.substring(lastSlash);

        if (commandStr.equals("/regist.one"))
            registFunc(req);
        else if (commandStr.equals("/login.one"))
            loginFunc(req);
        else if (commandStr.equals("/freeboard.one"))
            freeboardFunc(req);

        req.setAttribute("uri", uri);
        req.setAttribute("commandStr", commandStr); 
        req.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(req, resp);
    }

    // 페이지별 처리 메서드
    void registFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>회원가입</h4>");
    }

    void loginFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>로그인</h4>");
    }

    void freeboardFunc(HttpServletRequest req) {
        req.setAttribute("resultValue", "<h4>자유게시판</h4>");
    }
}
