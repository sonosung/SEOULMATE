package seoulmate.membership;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;

@WebServlet("/admin/login.do")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String EMAIL = request.getParameter("EMAIL");
        String USER_PASSWORD = request.getParameter("USER_PASSWORD");
        String save_check = request.getParameter("save_check");
        String prevPage = request.getParameter("prevPage");

        // DB 연결 정보
        String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
        String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
        String dbId = "C##KEAM"; // DB 사용자 아이디
        String dbPw = "1234"; // DB 사용자 비밀번호

        MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
        MemberDTO member = dao.getMemberDTO(EMAIL, USER_PASSWORD);

        if (member != null && member.getUSER_ID() != null) {
            if (save_check != null && save_check.equals("Y")) {
                System.out.println(save_check);
                CookieManager.makeCookie(response, "loginEmail", EMAIL, 1342000);
            } else {
                CookieManager.deleteCookie(response, "loginEmail");
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", member);
            System.out.println("prevPage: " + prevPage);
            
            if(member.getUSER_NUM() <= 4) {
            	response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp");
            }else {
                if (prevPage == null || prevPage.equals("null") || prevPage.trim().isEmpty()) {
                    System.out.println("prevPage is null or empty");
                    response.sendRedirect(request.getContextPath() + "/MainContent/index.jsp");
                } else if (prevPage.contains(".do")) {
                    response.sendRedirect(request.getContextPath() + "/MainContent/index.jsp");
                } else {
                    System.out.println("prevPage is not empty: " + prevPage);
                    response.sendRedirect(prevPage);
                }
            }
        } else {
            alertAndGo(response, "로그인 정보가 일치하지 않습니다.", "login.jsp?error=");
        }
        
    }
    
    public static void alertAndGo(HttpServletResponse response, String message, String url) {
        try {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter w = response.getWriter();
            w.write("<script>alert('" + message + "');location.href='" + url + "';</script>");
            w.flush();
            w.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}