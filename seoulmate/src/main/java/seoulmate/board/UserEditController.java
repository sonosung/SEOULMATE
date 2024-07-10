package seoulmate.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import seoulmate.membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/useredit.do")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 10,  // 10MB
	    maxRequestSize = 1024 * 1024 * 50 // 50MB
	)
public class UserEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	  MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
          if (member == null) {
              // 유저 정보가 없는 경우 로그인 페이지로 리디렉션
              JSFunction.alertBack(response, "로그인이 필요한 기능입니다. 해당 게시물은 작성자 및 관리자만 수정 할 수 있습니다.");
              return;
          }
          
          
        String idx = request.getParameter("idx");

        if (idx == null || !idx.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
            return;
        }

        UserBoardDAO dao = new UserBoardDAO();
        UserBoardDTO dto = dao.selectView(idx); // 숫자를 문자열로 변환하여 전달
        
        String postAuthor = dao.getPostAuthor(idx);
        
        int UN = member.getUSER_NUM();
        String UNST = Integer.toString(UN);
        System.out.println("(디버그)작성자 번호 = " + postAuthor);

        // 유저 권한 확인
        if (member.getUSER_NUM() > 4 && !UNST.equals(postAuthor)) {
            JSFunction.alertBack(response, "게시글 삭제 권한이 없습니다. 해당 게시물은 작성자 및 관리자만 수정 할 수 있습니다.");
            return;
        }
        
        dao.close();
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("/Edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        MemberDTO member = (MemberDTO) request.getSession().getAttribute("user");
        if (member == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if (member.getUSER_NUM() > 4) {
            JSFunction.alertBack(response, "게시글 수정 권한이 없습니다.");
            return;
        }

        String idx = request.getParameter("idx");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String fescate = request.getParameter("fescate");
        String feslocation = request.getParameter("feslocation");
        String fesname = request.getParameter("fesname");
        String fesstart = request.getParameter("fesstart");
        String fesend = request.getParameter("fesend");

        String existingMainImage = request.getParameter("existingMainImage");
        String existingSecImage = request.getParameter("existingSecImage");
        String existingThiImage = request.getParameter("existingThiImage");

        Part mainimagePart = request.getPart("mainimage");
        byte[] mainimage = null;
        if (mainimagePart != null && mainimagePart.getSize() > 0) {
            try (InputStream mainimageInputStream = mainimagePart.getInputStream()) {
                mainimage = mainimageInputStream.readAllBytes();
            }
        } else if (existingMainImage != null && !existingMainImage.isEmpty()) {
            mainimage = Base64.getDecoder().decode(existingMainImage);
        }

        Part secimagePart = request.getPart("secimage");
        byte[] secimage = null;
        if (secimagePart != null && secimagePart.getSize() > 0) {
            try (InputStream secimageInputStream = secimagePart.getInputStream()) {
                secimage = secimageInputStream.readAllBytes();
            }
        } else if (existingSecImage != null && !existingSecImage.isEmpty()) {
            secimage = Base64.getDecoder().decode(existingSecImage);
        }

        Part thiimagePart = request.getPart("thiimage");
        byte[] thiimage = null;
        if (thiimagePart != null && thiimagePart.getSize() > 0) {
            try (InputStream thiimageInputStream = thiimagePart.getInputStream()) {
                thiimage = thiimageInputStream.readAllBytes();
            }
        } else if (existingThiImage != null && !existingThiImage.isEmpty()) {
            thiimage = Base64.getDecoder().decode(existingThiImage);
        }

        UserBoardDTO dto = new UserBoardDTO();
        dto.setIdx(idx);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setFescate(fescate);
        dto.setFeslocation(feslocation);
        dto.setFesname(fesname);
        dto.setFesstart(fesstart);
        dto.setFesend(fesend);
        dto.setMainimage(mainimage);
        dto.setSecimage(secimage);
        dto.setThiimage(thiimage);

        UserBoardDAO dao = new UserBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) {
            JSFunction.alertLocation(response, "게시글 수정에 성공했습니다.", "userlist.do");
        } else {
            JSFunction.alertLocation(response, "게시글 수정에 실패했습니다.", "view.jsp?idx=" + idx);
        }
    }
}
