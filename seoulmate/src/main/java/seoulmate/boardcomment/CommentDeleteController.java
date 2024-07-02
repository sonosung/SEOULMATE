package seoulmate.boardcomment;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/commentdelete.do")
public class CommentDeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int commentId = Integer.parseInt(request.getParameter("commentId"));

        CommentDAO dao = new CommentDAO();
        boolean result = dao.deleteComment(commentId);

        if (result) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}
