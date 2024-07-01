package seoulmate.board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/seoulmatepass.do")
public class PassController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mode = req.getParameter("mode");
        String idx = req.getParameter("idx");

        // 디버그용 로그 추가
        System.out.println("Received mode: " + mode);
        System.out.println("Received idx: " + idx);
        
        if (idx == null || !idx.matches("\\d+")) {
            // idx가 null이거나 숫자가 아닐 경우 예외 처리
            System.out.println("Invalid idx parameter: " + idx);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }
        
        req.setAttribute("mode", mode);
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/Edit.jsp").forward(req, resp);
        
       
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idx = req.getParameter("idx");
        String mode = req.getParameter("mode");
        String userId = req.getParameter("user_id");

        // 디버그용 로그 추가
        System.out.println("Received mode: " + mode);
        System.out.println("Received idx: " + idx);
        System.out.println("Received user_id: " + userId);
       
        if (idx == null || !idx.matches("\\d+")) {
            // idx가 null이거나 숫자가 아닐 경우 예외 처리
            System.out.println("Invalid idx parameter: " + idx);
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }

        BoardDAO dao = new BoardDAO();
        boolean confirmed = dao.confirmUserId(userId, idx);
        
        if (confirmed) {
            if ("edit".equals(mode)) {
                String name = req.getParameter("name");
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                String fescate = req.getParameter("fescate");
                String feslocation = req.getParameter("feslocation");
                String fesname = req.getParameter("fesname");
                String fesstart = req.getParameter("fesstart");
                String fesend = req.getParameter("fesend");

                BoardDTO dto = new BoardDTO();
                dto.setIdx(idx);
                dto.setName(name);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setFescate(fescate);
                dto.setFeslocation(feslocation);
                dto.setFesname(fesname);
                dto.setFesstart(fesstart);
                dto.setFesend(fesend);

                int result = dao.updatePost(dto);
                dao.close();

                if (result == 1) {
                    JSFunction.alertLocation(resp, "수정되었습니다.", "/list.do");
                } else {
                    JSFunction.alertBack(resp, "게시물 수정에 실패하였습니다.");
                }
            } else if ("delete".equals(mode)) {
                BoardDTO dto = dao.selectView(idx);
                int result = dao.deletePost(idx);
                dao.close();

                if (result == 1) {
                    JSFunction.alertLocation(resp, "삭제되었습니다.", "/list.do");
                } else {
                    JSFunction.alertBack(resp, "게시물 삭제에 실패하였습니다.");
                }
            }
        } else {
            JSFunction.alertBack(resp, "유저 아이디 검증에 실패하였습니다.");
        }
    }
}

