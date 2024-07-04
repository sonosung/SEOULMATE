package seoulmate.boardcomment;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/commentdelete.do")
public class CommentDeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
        int commentId = Integer.parseInt(request.getParameter("commentId"));

        if(member==null) {
        	JSFunction.alertBack(response, "로그인이 필요한 기능입니다.");
        	return;
        }
        
        
        CommentDAO dao = new CommentDAO();
        boolean result = dao.deleteComment(commentId, member.getUSER_NUM());
        

        if (result) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
    }
}
