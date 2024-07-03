package seoulmate.board;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/userdelete.do")
public class UserDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
        if (member == null) {
            // 유저 정보가 없는 경우 로그인 페이지로 리디렉션
            JSFunction.alertBack(response, "로그인이 필요한 기능입니다. 해당 게시물은 작성자 및 관리자만 삭제 할 수 있습니다.");
            return;
        }

        String idx = request.getParameter("idx");
        if (idx == null || !idx.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }

        UserBoardDAO dao = new UserBoardDAO();
        String postAuthor = dao.getPostAuthor(idx);
        int UN = member.getUSER_NUM();
        String UNST = Integer.toString(UN);
        
        
        // 유저 권한 확인
        if (member.getUSER_NUM() > 4 && !UNST.equals(postAuthor)) {
            JSFunction.alertBack(response, "게시글 삭제 권한이 없습니다. 해당 게시물은 작성자 및 관리자만 삭제 할 수 있습니다.");
            return;
        }

        int result = dao.deletePost(idx);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (result == 1) {
            out.println("<html><body>");
            out.println("<script>");
            out.println("alert('삭제가 완료되었습니다.');");
            out.println("location.href='userlist.do';");
            out.println("</script>");
            out.println("</body></html>");    
        } else {
            out.println("<html><body>");
            out.println("<script>");
            out.println("alert('게시물 삭제에 실패했습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.println("</body></html>");
        }

        dao.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
