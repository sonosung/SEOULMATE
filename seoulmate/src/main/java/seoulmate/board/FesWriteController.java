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
/**
 * Servlet implementation class WriteController
 */
@WebServlet("/feswrite.do")
public class FesWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/fes_write.jsp").forward(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 파일 업로드 처리====================================================
		// 업로드 디렉터리의 물리적 경로 확인
//		String saveDirectory = req.getServletContext().getRealPath("/Uploads");

		// 파일 업로드
//		String originalFileName = "";
//		try {
//			originalFileName = FileUtil.uploadFile(req, saveDirectory);
//		} catch (Exception e) {
		// 파일 업로드 실패
//			e.printStackTrace();
//			JSFunction.alertLocation(resp, "파일 업로드 오류입니다", "/write.do");
//			return;
//		}

		// 2. 파일 업로드 외 처리 ===========================================
		// 폼값을 DTO에 저장
		BoardDTO dto = new BoardDTO();
		MemberDTO member = (MemberDTO) req.getSession().getAttribute("user");

		String user_Id = member.getUSER_ID();
		int user_Num = member.getUSER_NUM();
		String user_Numst = String.valueOf(user_Num);
		dto.setName(user_Id); // 세션에 저장된 user_id를 name으로 설정
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
			InputStream mainimageInputStream = mainimagePart.getInputStream();
			byte[] mainimage = mainimageInputStream.readAllBytes();
			dto.setMainimage(mainimage);
		}

		// secimage 업로드 처리
		Part secimagePart = req.getPart("secimage");
		if (secimagePart != null && secimagePart.getSize() > 0) {
			InputStream secimageInputStream = secimagePart.getInputStream();
			byte[] secimage = secimageInputStream.readAllBytes();
			dto.setSecimage(secimage);
		}

		// thiimage 업로드 처리
		Part thiimagePart = req.getPart("thiimage");
		if (thiimagePart != null && thiimagePart.getSize() > 0) {
			InputStream thiimageInputStream = thiimagePart.getInputStream();
			byte[] thiimage = thiimageInputStream.readAllBytes();
			dto.setThiimage(thiimage);
		}

		// 원본 파일명과 저장된 파일 이름 설정
//		if (originalFileName != "") {
		// 첨부 파일이 있을 경우 파일명 변경
//			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

//			dto.setOfile(originalFileName); // 원래 파일 이름
//			dto.setSfile(savedFileName); // 서버에 저장된 파일 이름
//		}

		// DAO를 통해 DB에 게시 내용 저장
		BoardDAO dao = new BoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		// 성공 or 실패?
		if (result == 1) { // 글쓰기 성공
			resp.sendRedirect("feslist.do");

		} else {// 글쓰기 실패
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다", "fes_write.do");
		}

//		request.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}