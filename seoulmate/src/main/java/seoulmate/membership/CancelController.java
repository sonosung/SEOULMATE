package seoulmate.membership;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/admin/Cancel.do")
public class CancelController  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
		 String USER_PASSWORD = request.getParameter("USER_PASSWORD");
		 String EMAIL = request.getParameter("EMAIL");
		 
	     String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	     String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
	     String dbId = "C##KEAM"; // DB 사용자 아이디
	     String dbPw = "1234"; // DB 사용자 비밀번호
	     
	     MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
	     MemberDTO member = dao.getMemberDTO_Cancel(USER_PASSWORD,EMAIL);
		 
		 if(member.getCANCEL() != null) {
			System.out.println("계삭완료");
			alertAndGo2(response, "회원탈퇴가 진행되었습니다.");
		 }else if(member.getCANCEL() == null) {
			 System.out.println("계삭실패");
			 alertAndGo(response, "비밀번호가 틀렸습니다." , "Cancel.jsp");
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
	 
	 public static void alertAndGo2(HttpServletResponse response, String message) {
	        try {
	            response.setContentType("text/html; charset=utf-8");
	            PrintWriter w = response.getWriter();
	            w.write("<script>alert('"+message+"');</script>");
	            w.write("<script>location.href = 'logout.jsp';</script>");
	            w.flush();
	            w.close();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
}
