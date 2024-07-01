package seoulmate.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userlike.do")
public class UserLikeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserBoardDAO userBoardDAO;

    @Override
    public void init() throws ServletException {
        userBoardDAO = new UserBoardDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idx = request.getParameter("idx");

        try {
            if (idx != null && !idx.isEmpty()) {
                userBoardDAO.updateLikeCount(idx);

                response.setContentType("text/plain");
                PrintWriter out = response.getWriter();
                out.print("success");
                out.flush();
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid 'idx' parameter");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error processing request: " + e.getMessage());
        }
    }

    @Override
    public void destroy() {
        userBoardDAO.close();
    }
}
