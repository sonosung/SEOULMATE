package seoulmate.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.membership.MemberDTO;

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
        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
        String idxParam = request.getParameter("idx");

        if (member == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
            return;
        }

        int userNum = member.getUSER_NUM();
        System.out.println("debug unum = " + userNum);
        System.out.println("debug bidx = " + idxParam);

        try {
            if (idxParam != null && !idxParam.isEmpty()) {
                int idx = Integer.parseInt(idxParam);

                if (!userBoardDAO.hasUserLiked(idx, userNum)) {
                    userBoardDAO.updateLikeCount(idx, userNum);
                    response.setContentType("text/plain");
                    PrintWriter out = response.getWriter();
                    out.print("success");
                    out.flush();
                } else {
                    response.setContentType("text/plain");
                    PrintWriter out = response.getWriter();
                    out.print("duplicate");
                    out.flush();
                }
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid parameters");
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
