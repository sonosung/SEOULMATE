package seoulmate.membership;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/register.do")
public class RegisterController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
		 System.out.println("회원가입 .do 실행");
		 String USERNAME = request.getParameter("USERNAME");
	     String EMAIL = request.getParameter("EMAIL");
	     String USER_ID = request.getParameter("USER_ID");
	     String PHONENUM = request.getParameter("PHONENUM");
	     String USER_PASSWORD = request.getParameter("USER_PASSWORD");
	     String USER_STREET = request.getParameter("USER_STREET");
	     String USER_ZIP = request.getParameter("USER_ZIP");
	     
	     System.out.println("콘트롤러 값 확인" + USERNAME + EMAIL + USER_ID + PHONENUM + USER_PASSWORD + USER_STREET + USER_ZIP);
	     
	     String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	     String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
	     String dbId = "C##KEAM"; // DB 사용자 아이디
	     String dbPw = "1234"; // DB 사용자 비밀번호
	     
	     MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
	     MemberDTO member = dao.getMemberDTO(USERNAME, EMAIL,USER_ID,PHONENUM,USER_PASSWORD,USER_STREET,USER_ZIP);
	     
	     if(member.getUSER_EMAIL_ERROR() == null && member.getUSER_ID_ERROR() == null ) {
	    	 alertAndGo(response, "회원가입이 완료되었습니다." , "login.jsp");
	     }else if(member.getUSER_EMAIL_ERROR() != null){
	    	 alertAndGo(response, "이메일이 중복되었습니다." , "register.jsp?error=1");
	     }else if(member.getUSER_ID_ERROR() != null) {
	    	 alertAndGo(response, "닉네임이 중복되었습니다." , "register.jsp?error=1");
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
