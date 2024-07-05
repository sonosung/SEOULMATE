/*
 * package seoulmate.membership;
 * 
 * import java.io.IOException;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.MultipartConfig; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * @WebServlet("/membership/edit.do")
 * 
 * @MultipartConfig( maxFileSize = 1024 *1024 * 10, maxRequestSize = 1024 *1024
 * * 10 ) public class EditController extends HttpServlet{ private static final
 * long serialVersionUID = 1L;
 * 
 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
 * resp) throws ServletException, IOException {
 * 
 * String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
 * String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL String
 * dbId = "C##KEAM"; // DB 사용자 아이디 String dbPw = "1234"; // DB 사용자 비밀번호
 * 
 * String uid = req.getParameter("uid"); String upass =
 * req.getParameter("upass");
 * 
 * MemberDAO dao = new MemberDAO(jdbcDriver, dbUrl, dbId, dbPw); MemberDTO dto =
 * dao.getMemberDTO(uid, upass); req.setAttribute("dto", dto);
 * req.getRequestDispatcher("/userPage/profileEdit.jsp").forward(req, resp);
 * System.out.println("회원정보 변경 테스트"); } }
 */