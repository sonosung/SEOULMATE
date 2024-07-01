package seoulmate.board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userdelete.do")
public class UserDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idx = request.getParameter("idx");
        if (idx == null || !idx.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }

        UserBoardDAO dao = new UserBoardDAO();
        int result = dao.deletePost(idx);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (result == 1) {
            out.println("<html><body>");
            out.println("<script>");
            out.println("alert('삭제가 완료되었습니다.');");
            out.println("location.href='userlist.do';");
            out.println("</script>");
            out.println("</body></html>");    
        } else {
            out.println("<html><body>");
            out.println("<script>");
            out.println("alert('게시물 삭제에 실패했습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.println("</body></html>");
        }

        dao.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
