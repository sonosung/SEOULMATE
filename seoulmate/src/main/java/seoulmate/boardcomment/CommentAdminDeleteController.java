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

    private CommentDAO commentDAO;

    public CommentAdminDeleteController() {
        super();
        commentDAO = new CommentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentIdString = request.getParameter("id");
        if (commentIdString != null && !commentIdString.isEmpty()) {
            try {
                int commentId = Integer.parseInt(commentIdString);
                commentDAO.admindeleteCommentById(commentId); // DAO에서 댓글 삭제 메서드 호출
                response.sendRedirect(request.getContextPath() + "/commentsadmin.do"); // 삭제 후 목록 페이지로 redirect
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid comment ID format");
            } catch (RuntimeException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete comment");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Comment ID parameter is missing");
        }
    }
}
