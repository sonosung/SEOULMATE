package seoulmate.membership;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import seoulmate.membership.*;
import utils.JSFunction;

@WebServlet("/membership/profileEdit.do")
@MultipartConfig(maxFileSize = 1024 *1024 * 10, maxRequestSize = 1024 *1024 * 10)
public class UserInfoEditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");
		HttpSession session = req.getSession();
        session.setAttribute("user", member);

	    int idx = member.getUSER_NUM(); //수정할 사용자의 email 받아옴.
	    System.out.println("idx : " + idx);
//	    String upass = req.getParameter("upass");
		
	    UserInfoDAO dao = new UserInfoDAO();
	    MemberDTO dto = dao.getUserInfo(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../userPage/profileEdit.jsp").forward(req, resp);
		System.out.println("회원정보 변경 테스트");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		
//	        // 1. 파일 업로드 처리 =============================
//	        // 업로드 디렉터리의 물리적 경로 확인
//	        String saveDirectory = req.getServletContext().getRealPath("/Uploads");
//	      
//	        // 파일 업로드
//	        String originalFileName = "";
//	        try {
//	           originalFileName = FileUtil.uploadFile(req, saveDirectory);
//	        }
////		Part filePart = req.getPart("ofile"); // Retrieves <input type="file" name="ofile">
////	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
////	    File uploads = new File("E:/KDTFullStackClass/JSPWebProgramming/uploads");
////	    if (!uploads.exists()) {
////	        uploads.mkdirs(); // Ensure the upload directory exists
////	    }
////	    File file = new File(uploads, fileName);
////
////	    try (InputStream input = filePart.getInputStream()) {
////	        Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
////	    }
//	        catch (Exception e) {
//	           JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
//	           e.printStackTrace();
//	           return;
//	      }

	        // 2. 파일 업로드 외 처리 =============================
	        // 수정 내용을 매개변수에서 얻어옴
	        
//	        String idx = req.getParameter("user_num");
//	        int idx = req.getParameter("idx");
//	        String prevOfile = req.getParameter("prevOfile");
//	        String prevSfile = req.getParameter("prevSfile");
			MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");
			int idx = member.getUSER_NUM();
	    
	        String email = req.getParameter("email");
	        String name = req.getParameter("name");
	        String title = req.getParameter("title");
	        String content = req.getParameter("content");
	        String zip = req.getParameter("zip");
	            
	        // 비밀번호는 session에서 가져옴
	        HttpSession session = req.getSession();
	        String pass = (String)session.getAttribute("pass");

	        // DTO에 저장
	        MemberDTO dto = new MemberDTO();
	        dto.setUSER_NUM(idx);
	        dto.setEMAIL(email);
	        dto.setUSERNAME(name);
	        dto.setUSER_ID(title);
	        dto.setPHONENUM(content);
	        dto.setUSER_STREET(pass);
	        dto.setUSER_ZIP(zip);
	            
//	        // 원본 파일명과 저장된 파일 이름 설정
//	        if (originalFileName != "") {             
//	           String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
//	           
//	            dto.setUSER_PHOTO(originalFileName);  // 원래 파일 이름
//	            dto.setUSER_PHOTO(savedFileName);  // 서버에 저장된 파일 이름
//
//	            // 기존 파일 삭제
//	            FileUtil.deleteFile(req, "/Uploads", prevSfile);
//	        }
//	        else {
//	            // 첨부 파일이 없으면 기존 이름 유지
//	            dto.setUSER_PHOTO(prevOfile);
//	            dto.setUSER_PHOTO(prevSfile);
//	        }

	        // DB에 수정 내용 반영
	        UserInfoDAO dao = new UserInfoDAO();
	        int result = dao.updateProfile(dto);
	        dao.close();

	        // 성공 or 실패?
//	        if (result == 1) {  // 수정 성공
//	            session.removeAttribute("pass");
//	            resp.sendRedirect("../membership/profileEdit.do?idx=" + idx);
	            resp.sendRedirect("../userPage/profileEdit.jsp?idx=" + idx);
	            System.out.println("수정호출");
//	        }
//	        else {  // 수정 실패
//	            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
//	                "../membership/profileEdit.do?idx=" + idx);
//	        }
	    }
}
