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
			
			String Email = member.getEMAIL();
	        String name = req.getParameter("USERNAME");
	        String user_id = req.getParameter("USER_ID");
	        String PHONENUM = req.getParameter("PHONENUM");
	        String USER_STREET = req.getParameter("USER_STREET");
	        String zip = req.getParameter("USER_ZIP");
	        String InputPass = req.getParameter("USER_PASS");
	        String pass = member.getUSER_PASSWORD();
	        Part mainimagePart = req.getPart("ofile");
	        String save_check = req.getParameter("save_check");
	        String photo_check = req.getParameter("photo_check");

	        HttpSession session = req.getSession();
	        //사진 기본으로 돌리기 체크시
	        if(save_check != null && save_check.equals("Y")) {
				if (pass.equals(InputPass)) {
			        MemberDAO dao = new MemberDAO();
			        member = dao.getMemberDTO_UPDATE_NOMAL(idx, name, user_id,PHONENUM,USER_STREET,zip,Email);
			        dao.close();
			        
			        if(member.getUD_NICK() == null) {
			            if(member.getUD() != null ) {
			   	    	 alertAndGo(resp, "회원 정보 수정이 완료되었습니다." , "myPage.jsp");
			 	        if (mainimagePart != null && mainimagePart.getSize() > 0) {
					           InputStream mainimageInputStream = mainimagePart.getInputStream();
					           byte[] mainimage = mainimageInputStream.readAllBytes();
					           member.setUSER_PHOTO(mainimage);
					        }	
				         session.removeAttribute("user");
				         session.setAttribute("user", member);
			   	     }else if(member.getUD() == null){
			   	    	 alertAndGo(resp, "회원정보 수정에 실패하였습니다." , "profileEdit.jsp?error=1");
			   	     }
			        }else {
			        	alertAndGo(resp, "중복된 닉네임입니다." , "profileEdit.jsp?error=1");
			        }
				}else {
		        	alertAndGo(resp, "현재 사용 중인 비밀번호가 틀렸습니다." , "profileEdit.jsp?error=1");
		        }
				
				//사진 업로드시
	        }else if(save_check == null && photo_check != null){
	        	if (pass.equals(InputPass)) {
			        MemberDAO dao = new MemberDAO();
			        member = dao.getMemberDTO_UPDATE(idx, name, user_id,PHONENUM,USER_STREET,zip, mainimagePart,Email);
			        
			        dao.close();

			        if(member.getUD_NICK() == null) {
			            if(member.getUD() != null ) {
			   	    	 alertAndGo(resp, "회원 정보 수정이 완료되었습니다." , "myPage.jsp");
			 	        if (mainimagePart != null && mainimagePart.getSize() > 0) {
					           InputStream mainimageInputStream = mainimagePart.getInputStream();
					           byte[] mainimage = mainimageInputStream.readAllBytes();
					           member.setUSER_PHOTO(mainimage);
					        }	
				         session.removeAttribute("user");
				         session.setAttribute("user", member);
			   	     }else if(member.getUD() == null){
			   	    	 alertAndGo(resp, "회원정보 수정에 실패하였습니다." , "profileEdit.jsp?error=1");
			   	     }
			        }else {
			        	alertAndGo(resp, "중복된 닉네임입니다." , "profileEdit.jsp?error=1");
			        }
				}else {
		        	alertAndGo(resp, "현재 사용 중인 비밀번호가 틀렸습니다." , "profileEdit.jsp?error=1");
		        }
	        	
	        	//사진 선택 X 체크박스 X 사진 아예 안건드리기
	        }else if(save_check == null && photo_check == null){
	        	if (pass.equals(InputPass)) {
			        MemberDAO dao = new MemberDAO();
			        member = dao.getMemberDTO_UPDATE_NOPHOTO(idx, name, user_id,PHONENUM,USER_STREET,zip,Email);
			        
			        dao.close();

			        if(member.getUD_NICK() == null) {
			            if(member.getUD() != null ) {
			   	    	 alertAndGo(resp, "회원 정보 수정이 완료되었습니다." , "myPage.jsp");
				         session.removeAttribute("user");
				         session.setAttribute("user", member);
			   	     }else if(member.getUD() == null){
			   	    	 alertAndGo(resp, "회원정보 수정에 실패하였습니다." , "profileEdit.jsp?error=1");
			   	     }
			        }else {
			        	alertAndGo(resp, "중복된 닉네임입니다." , "profileEdit.jsp?error=1");
			        }
				}else {
		        	alertAndGo(resp, "현재 사용 중인 비밀번호가 틀렸습니다." , "profileEdit.jsp?error=1");
		        }
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
