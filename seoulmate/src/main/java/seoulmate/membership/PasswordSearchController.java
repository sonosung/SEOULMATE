package seoulmate.membership;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/forgot-password.do")
public class PasswordSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
		String EMAIL = request.getParameter("EMAIL");
        String NAME = request.getParameter("NAME");
        String PHONENUM = request.getParameter("PHONENUM");
        
	     String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	     String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
	     String dbId = "C##KEAM"; // DB 사용자 아이디
	     String dbPw = "1234"; // DB 사용자 비밀번호
	     
	     MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
	     MemberDTO member = dao.getMemberDTO(EMAIL , NAME , PHONENUM);
	     
	     if (member.getUSER_PASSWORD() != null) {
	    	 System.out.println("유효한 정보들 : ");
	    	 alertAndGo(response, member.getUSER_PASSWORD() , "login.jsp");
	     }else if(member.getUSER_PASSWORD() == null) {
	    	 System.out.println("유효하지 않은 정보");
	    	 alertAndGo(response, "유효하지 않은 정보입니다." , "forgot-password.jsp");
	     }
	}
	
    public static void alertAndGo(HttpServletResponse response, String message, String url) {
        try {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter w = response.getWriter();
            w.write("<script>alert('"+message+"');location.href='"+url+"';</script>");
            w.flush();
            w.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
