package seoulmate.admin;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/admin/out.do")
public class UserOutController extends HttpServlet {

	private static final long serialVersionUID = 1L;

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setAttribute("mode", req.getParameter("mode"));
			req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
		}
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// 매개변수 저장
			String user_num = req.getParameter("user_num");
//			String mode = req.getParameter("mode");
//			String pass = req.getParameter("pass");

			// 정보 검색
			AuthBoardDAO dao = new AuthBoardDAO();
			int result = dao.userOut(user_num);
			dao.close();

			if (result == 1) { // 유저정보 삭제
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../admin/userList.do");

			} else { // 삭제 실패
				JSFunction.alertBack(resp, "삭제에 실패했습니다.");
			}
		}

	}


