package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setAttribute("mode", req.getParameter("mode"));
        req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 매개변수 저장
        String idx = req.getParameter("idx");
        String mode = req.getParameter("mode");
        String pass = req.getParameter("pass");

        // 비밀번호 확인
        MVCBoardDAO dao = new MVCBoardDAO();
        boolean confirmed = dao.confirmPassword(pass, idx);
        dao.close();

        if (confirmed) {  // 비밀번호 일치
            if (mode.equals("edit")) {  // 수정 모드
                HttpSession session = req.getSession();
                session.setAttribute("pass", pass);
                resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);
            }
            else if (mode.equals("delete")) {  // 삭제 모드
                dao = new MVCBoardDAO();
                MVCBoardDTO dto = dao.selectView(idx);
                int result = dao.deletePost(idx);  // 게시물 삭제
                dao.close();
                if (result == 1) {  // 게시물 삭제 성공 시 첨부파일도 삭제
                    String saveFileName = dto.getSfile();
                    FileUtil.deleteFile(req, "/Uploads", saveFileName);
                }
                JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
            }
        }
        else {  // 비밀번호 불일치
            JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
        }
    }
}
