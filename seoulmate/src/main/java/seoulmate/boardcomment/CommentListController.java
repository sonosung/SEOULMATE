package seoulmate.boardcomment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/commentlist.do")
public class CommentListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            int idx = Integer.parseInt(request.getParameter("idx"));

            CommentDAO commentDAO = new CommentDAO();
            List<CommentDTO> commentList = commentDAO.getCommentsByBoardIdx(idx);

            out.print(buildJsonResponse(commentList)); // buildJsonResponse 메서드로 JSON 응답 생성
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.println("Invalid idx parameter");
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private String buildJsonResponse(List<CommentDTO> commentList) {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < commentList.size(); i++) {
            CommentDTO comment = commentList.get(i);
            sb.append("{");
            sb.append("\"id\":").append(comment.getCommentId()).append(",");
            sb.append("\"writer\":\"").append(comment.getWriter()).append("\",");
            sb.append("\"content\":\"").append(comment.getContent()).append("\",");
            sb.append("\"createdat\":\"").append(comment.getCreatedAt()).append("\",");
            sb.append("\"writernum\":").append(comment.getWriternum()); // writernum 추가
            sb.append("}");
            if (i < commentList.size() - 1) {
                sb.append(",");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
