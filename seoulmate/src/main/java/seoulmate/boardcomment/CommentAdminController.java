package seoulmate.boardcomment;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/commentsadmin.do")
public class CommentAdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CommentDAO commentDAO;

    public CommentAdminController() {
        super();
        commentDAO = new CommentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<CommentDTO> comments = commentDAO.getAllComments();
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("/admin/cards.jsp").forward(request, response);
        } catch (RuntimeException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching comments.");
        }
    }
}



