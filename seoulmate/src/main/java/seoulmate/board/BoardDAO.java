
//관리자 게시판
package seoulmate.board;

import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {

	public BoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";

		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> board = new Vector<BoardDTO>();

		String query = " " + "SELECT * FROM (" + "	SELECT Tb.*, ROWNUM rNum FROM ( " + "		SELECT * FROM board ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " 		ORDER BY idx DESC " + " 	) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setLikecount(rs.getInt(7));
				dto.setFesname(rs.getString(8));
				dto.setFeslocation(rs.getString(9));
				dto.setFesstart(rs.getString(10));
				dto.setFesend(rs.getString(11));

				board.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return board; // 목록 반환
	}

	// 게시글 데이터를 받아 DB에 추가합니다.
	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO board ( "
					+ " idx, title, content, name, fesname, feslocation, fesstart, fesend, fescate, postdate, mainimage, secimage, thiimage) "
					+ " VALUES ( " + " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getFesname());
			psmt.setString(5, dto.getFeslocation());
			psmt.setString(6, dto.getFesstart());
			psmt.setString(7, dto.getFesend());
			psmt.setString(8, dto.getFescate());
			psmt.setBytes(9, dto.getMainimage()); // 이미지 데이터를 BLOB으로 저장
			psmt.setBytes(10, dto.getSecimage());
			psmt.setBytes(11, dto.getThiimage());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		} finally {
			try {
				if (psmt != null)
					psmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public BoardDTO selectView(String idx) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM board WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(idx)); // idx를 정수로 변환
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setLikecount(rs.getInt(7));
				dto.setFesname(rs.getString(8));
				dto.setFeslocation(rs.getString(9));
				dto.setFesstart(rs.getString(10));
				dto.setFesend(rs.getString(11));
				dto.setFescate(rs.getString(12));
				dto.setMainimage(rs.getBytes("mainimage"));
				dto.setSecimage(rs.getBytes("secimage"));
				dto.setThiimage(rs.getBytes("thiimage"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 추천수 증가
	public void updateLikeCount(String idx) {
		String query = "UPDATE board SET likecount = likecount + 1 WHERE idx = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 추천수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	// 조회수를 1 증가시킵니다.
	public void updateVisitCount(String idx) {
		String query = "UPDATE board SET " + " visitcount=visitcount+1 " + " WHERE idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}

	}

	// 다운로드 횟수를 1 증가시킵니다.
	public void downCountPlus(String idx) {
		String sql = "UPDATE board SET " + " downcount=downcount+1 " + " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
		}
	}

	// id 일치 확인
	public boolean confirmUserId(String user_id, String idx) {
		boolean isCorr = false;
		try {
			String sql = "SELECT COUNT(*) FROM board WHERE user_id=? AND idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				isCorr = true; // 일치하는 경우 true 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(); // 자원 해제
		}
		return isCorr;
	}

	// 자원 해제
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int deletePost(String idx) {
		int result = 0;

		try {

			String deleteCommentsQuery = "DELETE FROM comments WHERE idx=?";
			psmt = con.prepareStatement(deleteCommentsQuery);
			psmt.setString(1, idx); // 게시글의 idx를 사용하여 해당 게시글의 댓글을 모두 삭제
			psmt.executeUpdate();

			String query = "DELETE FROM board WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int updatePost(BoardDTO dto) {
		int result = 0;
		String sql = "UPDATE board SET title=?, content=?, fescate=?, feslocation=?, fesname=?, fesstart=?, fesend=?, mainimage=?, secimage=?, thiimage=? WHERE idx=?";
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFescate());
			pstmt.setString(4, dto.getFeslocation());
			pstmt.setString(5, dto.getFesname());
			pstmt.setString(6, dto.getFesstart());
			pstmt.setString(7, dto.getFesend());
			pstmt.setBytes(8, dto.getMainimage());
			pstmt.setBytes(9, dto.getSecimage());
			pstmt.setBytes(10, dto.getThiimage());
			pstmt.setString(11, dto.getIdx());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
