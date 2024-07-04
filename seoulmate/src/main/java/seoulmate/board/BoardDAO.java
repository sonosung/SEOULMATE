
//관리자 게시판
package seoulmate.board;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
					+ " idx, title, content, name, fesname, feslocation, fesstart, fesend, fescate, postdate, mainimage, secimage, thiimage, writernum) "
					+ " VALUES ( " + " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, ?, ?)";

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
			psmt.setString(12, dto.getWriternum());
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
				dto.setWriternum(rs.getString("writernum"));

			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 추천수 증가
	public boolean hasUserLiked(int boardIdx, int likeUserNum) {
		String query = "SELECT COUNT(*) FROM LIKECHECK WHERE boardidx = ? AND likeusernum = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, boardIdx);
			psmt.setInt(2, likeUserNum);
			rs = psmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeResources(rs, psmt);
		}
		return false;
	}

	public void updateLikeCount(int boardIdx, int likeUserNum) {
		String updateQuery = "UPDATE board SET likecount = likecount + 1 WHERE idx = ?";
		String insertQuery = "INSERT INTO LIKECHECK (boardidx, likeusernum) VALUES (?, ?)";
		try {
			con.setAutoCommit(false); // 트랜잭션 시작

			psmt = con.prepareStatement(updateQuery);
			psmt.setInt(1, boardIdx);
			psmt.executeUpdate();
			psmt.close();

			psmt = con.prepareStatement(insertQuery);
			psmt.setInt(1, boardIdx);
			psmt.setInt(2, likeUserNum);
			psmt.executeUpdate();

			con.commit(); // 트랜잭션 커밋
		} catch (Exception e) {
			try {
				con.rollback(); // 트랜잭션 롤백
			} catch (Exception rollbackEx) {
				rollbackEx.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			closeResources(null, psmt);
		}
	}
	
	 private void closeResources(ResultSet rs, PreparedStatement psmt) {
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	        } catch (Exception e) {
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

	// 현재 날짜 기준으로 축제 정보 기간이 들어가 있으면서 추천수가 높은 순으로 3개를 반환하는 메서드 만약 같은 조건이 있는 축제 2개가
	// 있으면 축제 개최 기간이 작은 걸로 추출
	public List<BoardDTO> getTopRecommendedFestivalsCurrent() {
		List<BoardDTO> board = new Vector<BoardDTO>();
		Date currentDate = new Date(System.currentTimeMillis()); // 현재 날짜를 가져옵니다.

		// SQL 쿼리를 통해 현재 날짜 기준으로 축제 정보를 조회합니다.
		String query = "SELECT * FROM ("
				+ "SELECT * FROM board WHERE MAINIMAGE IS NOT NULL AND FESSTART <= ? AND FESEND >= ? "
				+ "ORDER BY likecount DESC, FESSTART ASC) " + "WHERE ROWNUM <= 3";

		try {
			psmt = con.prepareStatement(query);
			psmt.setDate(1, currentDate); // 현재 날짜를 첫 번째 매개변수로 설정합니다.(쿼리에서 현재 날짜를 사용하여 축제 기간을 필터링)
			psmt.setDate(2, currentDate); // 현재 날짜를 두 번째 매개변수로 설정합니다.(쿼리에서 현재 날짜를 사용하여 축제 기간을 필터링)
			rs = psmt.executeQuery(); // 쿼리를 실행하고 결과를 반환합니다.

			// 결과 집합을 반복하면서 BoardDTO 객체를 생성하고 리스트에 추가합니다.
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getString("IDX"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setFescate(rs.getString("FESCATE"));
				dto.setFesname(rs.getString("FESNAME"));
				dto.setFeslocation(rs.getString("FESLOCATION"));
				dto.setFesstart(rs.getString("FESSTART"));
				dto.setFesend(rs.getString("FESEND"));
				dto.setMainimage(rs.getBytes("MAINIMAGE"));
				dto.setLikecount(rs.getInt("LIKECOUNT"));

				board.add(dto); // 리스트에 추가합니다.
			}

		} catch (Exception e) {
			System.out.println("추천 수가 높은 축제 정보 조회 중 예외 발생");
			e.printStackTrace(); // 예외 발생 시 스택 트레이스를 출력합니다.
		} finally {
			close(); // 자원을 해제합니다.
		}

		return board; // 추천 축제 정보를 반환합니다.
	}
}
