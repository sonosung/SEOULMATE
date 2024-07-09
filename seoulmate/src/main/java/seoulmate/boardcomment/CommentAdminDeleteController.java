package seoulmate.boardcomment;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admindelete.do")
public class CommentAdminDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        int commentId = Integer.parseInt(request.getParameter("id"));

        CommentDAO dao = new CommentDAO();
        boolean result = dao.deleteCommentById(commentId);

        if (result) {
        	response.sendRedirect("/seoulmate/admin/adminComments.jsp");
        } else {
            response.getWriter().write("error");
        }
    }
}
