package seoulmate.boardcomment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class CommentDAO extends DBConnPool {

	// 댓글 추가 메서드
	public int insertComment(CommentDTO comment) {
		int result = 0;
		String sql = "INSERT INTO comments (idx, writer, content, createdAt) VALUES (?, ?, ?, ?)";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setLong(1, comment.getIdx());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());
			pstmt.setTimestamp(4, comment.getCreatedAt());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	
	 public List<CommentDTO> getCommentsByBoardIdx(int idx) {
	        List<CommentDTO> comments = new ArrayList<>();
	        String sql = "SELECT commentid, writer, content, createdat FROM comments WHERE idx = ?";

	        try (Connection conn = getDBConnection();
	             PreparedStatement pstmt = conn.prepareStatement(sql)) {

	            pstmt.setInt(1, idx);

	            try (ResultSet rs = pstmt.executeQuery()) {
	                while (rs.next()) {
	                    int commentId = rs.getInt("commentid");
	                    String writer = rs.getString("writer");
	                    String content = rs.getString("content");
	                    Timestamp createdAt = rs.getTimestamp("createdat");

	                    CommentDTO comment = new CommentDTO(commentId, idx, writer, content, createdAt);
	                    comments.add(comment);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("Failed to fetch comments for idx: " + idx, e);
	        }

	        return comments;
	    }
	
	
	

	// 게시글 번호에 해당하는 모든 댓글 조회 메서드

	// 특정 게시글 번호에 해당하는 모든 댓글 조회
	public List<CommentDTO> getAllCommentsByPostId(int postId) {
		List<CommentDTO> comments = new ArrayList<>();
		String sql = "SELECT commentid, writer, content, createdat FROM comments WHERE idx = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setLong(1, postId);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					int commentId = rs.getInt("commentid");
					String writer = rs.getString("writer");
					String content = rs.getString("content");
					Timestamp createdAt = rs.getTimestamp("createdat");

					CommentDTO comment = new CommentDTO(commentId, postId, writer, content, createdAt);
					comments.add(comment);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 예외 처리: 필요에 따라 RuntimeException 또는 다른 예외를 throw할 수 있음
			throw new RuntimeException("Failed to fetch comments for postId: " + postId, e);
		}

		return comments;
	}

	// 댓글 삭제 메서드
	public int deleteComment(Long comment_Id) {
		int result = 0;
		String sql = "DELETE FROM comments WHERE commentId = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setLong(1, comment_Id);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
