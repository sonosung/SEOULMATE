package seoulmate.membership;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/userPage/profileEdit.do")
@MultipartConfig(maxFileSize = 1024 *1024 * 10, maxRequestSize = 1024 *1024 * 10)
public class UserInfoEditController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

			MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");
			int idx = member.getUSER_NUM();
	    
	        String email = req.getParameter("EMAIL");
	        String name = req.getParameter("USERNAME");
	        String user_id = req.getParameter("USER_ID");
	        String PHONENUM = req.getParameter("PHONENUM");
	        String USER_STREET = req.getParameter("USER_STREET");
	        String zip = req.getParameter("USER_ZIP");
	        String InputPass = req.getParameter("USER_PASS");
	        String NewPass = req.getParameter("NEW_USER_PASS");
	        String pass = member.getUSER_PASSWORD();
	        Part mainimagePart = req.getPart("ofile");
	        
	        
	        if (mainimagePart != null && mainimagePart.getSize() > 0) {
		           InputStream mainimageInputStream = mainimagePart.getInputStream();
		           byte[] mainimage = mainimageInputStream.readAllBytes();
		           member.setUSER_PHOTO(mainimage);
		        }	
	        
	        
	        
	        String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
		    String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
		    String dbId = "C##KEAM"; // DB 사용자 아이디
		    String dbPw = "1234"; // DB 사용자 비밀번호
		   
	            
	        // 비밀번호는 session에서 가져옴
	        HttpSession session = req.getSession();
//	        String pass = (String)session.getAttribute("pass");
	        
	        //새 비밀번호 설정 안 함
	        if(pass.equals(InputPass) && NewPass == null) {
		        MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
		        member = dao.getMemberDTO_UPDATE(idx,email, name, user_id,PHONENUM,USER_STREET,zip, mainimagePart);
		        
		        dao.close();

		            if(member.getUD() != null ) {
		   	    	 alertAndGo(resp, "회원 정보 수정이 완료되었습니다." , "myPage.jsp");
			         session.removeAttribute("user");
			         session.setAttribute("user", member);
		   	     }else if(member.getUD() == null){
		   	    	 alertAndGo(resp, "회원정보 수정에 실패하였습니다." , "profileEdit.jsp?error=1");
		   	     }
		    //새 비밀번호 설정 함
	        }else if(pass.equals(InputPass) && NewPass != null) {
	        	MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw);
		        member = dao.getMemberDTO_UPDATE(idx,email, name, user_id,PHONENUM,USER_STREET,zip, mainimagePart, NewPass);
		        
		        dao.close();

		            if(member.getUD() != null ) {
		   	    	 alertAndGo(resp, "회원 정보 수정이 완료되었습니다." , "myPage.jsp");
			         session.removeAttribute("user");
			         session.setAttribute("user", member);
		   	     }else if(member.getUD() == null){
		   	    	 alertAndGo(resp, "회원정보 수정에 실패하였습니다." , "profileEdit.jsp?error=1");
		   	     }
	        }else {
	        	alertAndGo(resp, "현재 사용 중인 비밀번호가 틀렸습니다." , "profileEdit.jsp?error=1");
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
