package seoulmate.board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fesdelete.do")
public class FesDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 게시물 삭제 요청 시 처리할 코드

        // 1. 삭제할 게시물의 idx 파라미터 받기
        String idx = request.getParameter("idx");

        // 2. idx가 null인지 또는 숫자가 아닌지 검사
        if (idx == null || !idx.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }

        // 3. BoardDAO를 이용하여 게시물 삭제 수행
        BoardDAO dao = new BoardDAO();
        int result = dao.deletePost(idx); // deletePost 메서드 호출
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        // 4. DAO 작업 결과에 따라 응답 처리
        if (result == 1) {
            // 삭제 성공 시
        	out.println("<html><body>");
            out.println("<script>");
            out.println("alert('삭제가 완료되었습니다.');");
            out.println("location.href='feslist.do';");
            out.println("</script>");
            out.println("</body></html>");	
            
        } else {
            // 삭제 실패 시
        	out.println("<html><body>");
            out.println("<script>");
            out.println("alert('게시물 삭제에 실패했습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.println("</body></html>");
        }

        dao.close(); // DAO 리소스 정리
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // doPost에서 처리할 경우 doGet으로 전달
        doGet(request, response);
    }
}
