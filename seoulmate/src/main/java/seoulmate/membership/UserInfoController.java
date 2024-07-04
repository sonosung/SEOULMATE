package seoulmate.membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/membership/userinfo.do")
public class UserInfoController extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();
        session.setAttribute("user", member);

	    int idx = member.getUSER_NUM(); //수정할 사용자의 email 받아옴.
	    System.out.println("idx : " + idx);
	
	    UserInfoDAO dao = new UserInfoDAO();
	    MemberDTO dto = dao.getUserInfo(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../userPage/myPage.jsp").forward(req, resp);
		System.out.println("회원정보 조회 테스트");
	}
}
