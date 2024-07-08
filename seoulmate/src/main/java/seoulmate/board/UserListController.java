package seoulmate.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;
@WebServlet("/userlist.do")
public class UserListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBoardDAO dao = new UserBoardDAO();
        
        Map<String, Object> map = new HashMap<>();
        
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        
        if (searchWord != null && !searchWord.isEmpty()) {
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        
        int totalCount = dao.selectCount(map);

        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.isEmpty()) {
            pageNum = Integer.parseInt(pageTemp);
        }

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        map.put("start", start);
        map.put("end", end);
        
        List<UserBoardDTO> boardLists = dao.selectListPage(map);
        dao.close(); 
        
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "userlist.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);
        
        req.setAttribute("boardLists", boardLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("./list.jsp").forward(req, resp);
    }
}