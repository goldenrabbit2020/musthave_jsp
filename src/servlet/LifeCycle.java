package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {

    @PostConstruct
    public void myPostConstruct() {
        System.out.println("myPostConstruct() 호출");
    }

    @Override
    public void init() throws ServletException {
        System.out.println("init() 호출");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("service() 호출");
        super.service(req, resp);
    }        

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        System.out.println("doGet() 호출");
        req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        System.out.println("doPost() 호출");
        req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        System.out.println("destroy() 호출");
    }

    @PreDestroy
    public void myPreDestroy() {
        System.out.println("myPreDestroy() 호출");
    }
}
