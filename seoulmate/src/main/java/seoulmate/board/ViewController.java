//package seoulmate.board;
//
//import java.io.IOException;
//import java.util.Arrays;
//import java.util.List;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/view.do")
//public class ViewController extends HttpServlet {
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		BoardDAO dao = new BoardDAO();
//		String idx = req.getParameter("idx");
//		dao.updateVisitCount(idx);
//		BoardDTO dto = dao.selectView(idx);
//		dao.close();
//
////		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>/"));
//
////		String ext = null, fileName = dto.getSfile();
////		if (fileName!=null) {
////			ext = fileName.substring(fileName.lastIndexOf(".")+1);
////		}
////		String[] mimeStr = {"png", "jpg", "gif"};
////		List<String> mimeList = Arrays.asList(mimeStr);
////		boolean isImage = false;
////		if (mimeList.contains(ext)) {
////			isImage = true;
////		}
//
//		req.setAttribute("dto", dto);
////		req.setAttribute("isImage", isImage);
//		req.getRequestDispatcher("view.jsp").forward(req, resp);
//	}
//
//}
