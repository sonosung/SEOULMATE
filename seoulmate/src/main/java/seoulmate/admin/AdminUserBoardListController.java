package seoulmate.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.board.UserBoardDAO;
import seoulmate.board.UserBoardDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminUserBoardListController.do")
public class AdminUserBoardListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBoardDAO dao = new UserBoardDAO();
        List<UserBoardDTO> userBoardList = dao.getAllUserBoardDetails();
        
        request.setAttribute("userBoardList", userBoardList);
        request.getRequestDispatcher("/admin/adminUserFesList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
