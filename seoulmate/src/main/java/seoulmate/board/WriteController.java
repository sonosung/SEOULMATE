package seoulmate.board;

import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import seoulmate.membership.MemberDTO;
import utils.JSFunction;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 10,  // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

       
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
    	if (member == null) {
    		
            JSFunction.alertLocation(response, "로그인이 필요합니다.", "/admin/login.jsp");
            return;
        }
        request.getRequestDispatcher("/write.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBoardDTO dto = new UserBoardDTO();
        MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");

        if (member == null) {
            JSFunction.alertLocation(resp, "로그인이 필요합니다.", "/admin/login.jsp");
            return;
        }

        
        int user_Num = member.getUSER_NUM();
		String user_Numst = String.valueOf(user_Num);
		
        dto.setName(member.getUSER_ID());
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setFescate(req.getParameter("fescate"));
        dto.setFeslocation(req.getParameter("feslocation"));
        dto.setFesname(req.getParameter("fesname"));
        dto.setFesstart(req.getParameter("fesstart"));
        dto.setFesend(req.getParameter("fesend"));
        dto.setWriternum(user_Numst);
        
        Part mainimagePart = req.getPart("mainimage");
        if (mainimagePart != null && mainimagePart.getSize() > 0) {
            try (InputStream mainimageInputStream = mainimagePart.getInputStream()) {
                dto.setMainimage(mainimageInputStream.readAllBytes());
            }
        }

        Part secimagePart = req.getPart("secimage");
        if (secimagePart != null && secimagePart.getSize() > 0) {
            try (InputStream secimageInputStream = secimagePart.getInputStream()) {
                dto.setSecimage(secimageInputStream.readAllBytes());
            }
        }

        Part thiimagePart = req.getPart("thiimage");
        if (thiimagePart != null && thiimagePart.getSize() > 0) {
            try (InputStream thiimageInputStream = thiimagePart.getInputStream()) {
                dto.setThiimage(thiimageInputStream.readAllBytes());
            }
        }

        UserBoardDAO dao = new UserBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("userlist.do");
        } else {
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "write.do");
        }
    }
}
