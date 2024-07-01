package seoulmate.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/like.do")
public class FesLikeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO; // DAO 객체

    @Override
    public void init() throws ServletException {
        // Servlet 초기화 시 BoardDAO 객체 생성
        boardDAO = new BoardDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idx = request.getParameter("idx");

        try {
            if (idx != null && !idx.isEmpty()) {
                // 유효한 idx 값이 있는 경우 처리 로직
                boardDAO.updateLikeCount(idx);

                // 클라이언트에게 성공적인 응답 전송
                response.setContentType("text/plain");
                PrintWriter out = response.getWriter();
                out.print("success");
                out.flush();
            } else {
                // 잘못된 요청 처리
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid 'idx' parameter");
            }
        } catch (Exception e) {
            // 예외 처리
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request: " + e.getMessage());
        }
    }

    @Override
    public void destroy() {
        // Servlet 종료 시 DAO 리소스 해제
        boardDAO.close();
    }
}


