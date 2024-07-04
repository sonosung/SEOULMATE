package seoulmate.boardcomment;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/commentupdate.do")
public class CommentUpdateController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        
        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
        
        int commentId = Integer.parseInt(request.getParameter("commentId"));
        
        String content = request.getParameter("content");
        
        if(member==null) {
        	JSFunction.alertBack(response, "로그인이 필요한 기능입니다.");
        	return;
        }
        
        System.out.println("댓글 번호: " + commentId); // 디버깅용 로그
        System.out.println("수정할 내용: " + content); // 디버깅용 로그
        
        CommentDAO dao = new CommentDAO();
        boolean result = dao.updateComment1(commentId, content, member.getUSER_NUM());
        
        String writernum = request.getParameter("writernum");
        System.out.println("작성자 번호: " + writernum); // 디버깅용 로그

        int user_num = member != null ? member.getUSER_NUM() : -1;
        System.out.println("사용자 번호: " + user_num); // 디버깅용 로그

        if (result) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}