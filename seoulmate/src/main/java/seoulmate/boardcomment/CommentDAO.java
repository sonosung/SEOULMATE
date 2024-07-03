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
		String sql = "INSERT INTO comments (idx, writer, content, createdAt, writernum) VALUES (?, ?, ?, ?, ?)";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setLong(1, comment.getIdx());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());
			pstmt.setTimestamp(4, comment.getCreatedAt());
			pstmt.setInt(5, comment.getWriternum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); // 작업 종료 후 자원 반납
		}
		return result;
	}

	public List<CommentDTO> getCommentsByBoardIdx(int idx) {
		List<CommentDTO> comments = new ArrayList<>();
		String sql = "SELECT commentid, writer, content, createdat, writernum FROM comments WHERE idx = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, idx);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					int commentId = rs.getInt("commentid");
					String writer = rs.getString("writer");
					String content = rs.getString("content");
					Timestamp createdAt = rs.getTimestamp("createdat");
					int writernum = rs.getInt("writernum");
					CommentDTO comment = new CommentDTO(commentId, idx, writer, content, createdAt, writernum);
					comments.add(comment);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to fetch comments for idx: " + idx, e);
		} finally {
			close(); // 작업 종료 후 자원 반납
		}

		return comments;
	}

	// 게시글 번호에 해당하는 모든 댓글 조회 메서드

	// 특정 게시글 번호에 해당하는 모든 댓글 조회
	public List<CommentDTO> getAllCommentsByPostId(int postId) {
		List<CommentDTO> comments = new ArrayList<>();
		String sql = "SELECT commentid, writer, content, createdat, writernum FROM comments WHERE idx = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, postId);

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					int commentId = rs.getInt("commentid");
					String writer = rs.getString("writer");
					String content = rs.getString("content");
					Timestamp createdAt = rs.getTimestamp("createdat");
					int writernum = rs.getInt("writernum");

					CommentDTO comment = new CommentDTO(commentId, postId, writer, content, createdAt, writernum);
					comments.add(comment);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to fetch comments for postId: " + postId, e);
		} finally {
			close(); // 작업 종료 후 자원 반납
		}

		return comments;
	}

	// 댓글 삭제 메서드
	public boolean deleteComment(int commentId) {
		boolean result = false;
		String sql = "DELETE FROM comments WHERE commentId = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, commentId);
			result = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); // 작업 종료 후 자원 반납
		}
		return result;
	}

	// 댓글 수정 메서드

	// 댓글 수정 메서드
	public boolean updateComment(int commentId, String content) {
		boolean result = false;
		String sql = "UPDATE comments SET content = ? WHERE commentid = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, content);
			pstmt.setInt(2, commentId);
			result = pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public CommentDTO getCommentById(int commentId) {
		CommentDTO comment = null;
		String sql = "SELECT idx, writer, content, createdAt, writernum FROM comments WHERE commentid = ?";

		try (Connection conn = getDBConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, commentId);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					int postId = rs.getInt("idx");
					String writer = rs.getString("writer");
					String content = rs.getString("content");
					Timestamp createdAt = rs.getTimestamp("createdAt");
					int writernum = rs.getInt("writernum");

					comment = new CommentDTO(commentId, postId, writer, content, createdAt, writernum);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("Failed to fetch comment with id: " + commentId, e);
		} finally {
			close(); // 작업 종료 후 자원 반납
		}

		return comment;
	}

}
