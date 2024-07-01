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

@WebServlet("/fesedit.do")

@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)

public class FesEditController extends HttpServlet {
	// private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");

		// 디버깅을 위한 로그 추가
		System.out.println("Edit.do - Received idx in doGet: " + idx);

		if (idx == null || !idx.matches("\\d+")) {
			// idx가 null이거나 숫자가 아닐 경우 예외 처리

			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid idx parameter");
			return;
		}

		int idxInt = Integer.parseInt(idx);

		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.selectView(String.valueOf(idxInt)); // 숫자를 문자열로 변환하여 전달
		dao.close();
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/FesEdit.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

		request.setCharacterEncoding("UTF-8");

		String idx = request.getParameter("idx");
		System.out.println("Edit.do - Received idx in doPost: " + idx);

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String fescate = request.getParameter("fescate");
		String feslocation = request.getParameter("feslocation");
		String fesname = request.getParameter("fesname");
		String fesstart = request.getParameter("fesstart");
		String fesend = request.getParameter("fesend");

		Part mainimagePart = request.getPart("mainimage");
		byte[] mainimage = null;
		if (mainimagePart != null && mainimagePart.getSize() > 0) {
			try (InputStream mainimageInputStream = mainimagePart.getInputStream()) {
				mainimage = mainimageInputStream.readAllBytes();
			}
		}

		Part secimagePart = request.getPart("secimage");
		byte[] secimage = null;
		if (secimagePart != null && secimagePart.getSize() > 0) {
			try (InputStream secimageInputStream = secimagePart.getInputStream()) {
				secimage = secimageInputStream.readAllBytes();
			}
		}

		Part thiimagePart = request.getPart("thiimage");
		byte[] thiimage = null;
		if (thiimagePart != null && thiimagePart.getSize() > 0) {
			try (InputStream thiimageInputStream = thiimagePart.getInputStream()) {
				thiimage = thiimageInputStream.readAllBytes();
			}
		}

		BoardDTO dto = new BoardDTO();

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
		dto.setIdx(idx);

		BoardDAO dao = new BoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		
		

		if (result == 1) {
			response.sendRedirect("feslist.do"); // Redirect to view post page
			JSFunction.alertLocation(response, "게시글 수정에 성공했습니다.", "feslist.do");
		} else {
			JSFunction.alertLocation(response, "게시글 수정에 실패했습니다.", "festivalList.jsp?idx=" + idx);
		}
	}
}
