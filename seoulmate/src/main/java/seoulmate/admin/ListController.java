package seoulmate.admin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import seoulmate.admin.AuthBoardDAO;
import seoulmate.membership.MemberDAO;
import seoulmate.membership.MemberDTO;
import utils.authBoardPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/userList.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AuthBoardDAO dao = new AuthBoardDAO();

		Map<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		int totalCount = 0;
		
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		if (searchWord == null) {
			totalCount = dao.selectCount(map);
		}
		
		totalCount = dao.selectCount(map);

		/* 페이지 처리 시작 */
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

		// 목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1; // 첫 게시물 번호
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		/* 페이지 처리 끝 */

		List<MemberDTO> boardLists = dao.selectUserListPage(map);
		// 게시물 목록 받기
//		dao.close(); // DB연결 닫기

		// 뷰에 전달할 매개변수 추가
		String pagingImg = authBoardPage.uListPagingStr(totalCount, pageSize, blockPage, pageNum,
				"../admin/userList.do");

		// 바로가기 영역 HTML 문자열
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);

		// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("../admin/userList.jsp").forward(req, resp);
	}
}