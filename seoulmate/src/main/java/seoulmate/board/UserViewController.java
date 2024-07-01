package seoulmate.board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/view.do")
public class UserViewController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBoardDAO dao = new UserBoardDAO();
        String idx = req.getParameter("idx");
        dao.updateVisitCount(idx);
        UserBoardDTO dto = dao.selectView(idx);
        dao.close();

//		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>/"));

//		String ext = null, fileName = dto.getSfile();
//		if (fileName!=null) {
//			ext = fileName.substring(fileName.lastIndexOf(".")+1);
//		}
//		String[] mimeStr = {"png", "jpg", "gif"};
//		List<String> mimeList = Arrays.asList(mimeStr);
//		boolean isImage = false;
//		if (mimeList.contains(ext)) {
//			isImage = true;
//		}

		req.setAttribute("dto", dto);
//		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("view.jsp").forward(req, resp);
	}

}
