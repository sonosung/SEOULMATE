package seoulmate.board;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import common.DBConnPool;

public class UserBoardDAO extends DBConnPool {

    public UserBoardDAO() {
        super();
    }
    
    //관리자 페이지 유저보드
    public List<UserBoardDTO> getAllUserBoardDetails() {
        List<UserBoardDTO> userBoardList = new ArrayList<>();
        String sql = "SELECT idx, fescate, name, title, content, fesname, postdate, likecount, visitcount, feslocation, fesstart, fesend, writernum FROM userboard";
        
        try (PreparedStatement psmt = con.prepareStatement(sql);
             ResultSet rs = psmt.executeQuery()) {
            
            while (rs.next()) {
                UserBoardDTO userBoard = new UserBoardDTO();
                userBoard.setIdx(rs.getString("idx"));
                userBoard.setFescate(rs.getString("fescate"));
                userBoard.setName(rs.getString("name"));
                userBoard.setTitle(rs.getString("title"));
                userBoard.setContent(rs.getString("content"));
                userBoard.setFesname(rs.getString("fesname"));
                userBoard.setPostdate(rs.getDate("postdate"));
                userBoard.setLikecount(rs.getInt("likecount"));
                userBoard.setVisitcount(rs.getInt("visitcount"));
                userBoard.setFeslocation(rs.getString("feslocation"));
                userBoard.setFesstart(rs.getString("fesstart"));
                userBoard.setFesend(rs.getString("fesend"));
                userBoard.setWriternum(rs.getString("writernum"));
                
                userBoardList.add(userBoard);
            }
            
        } catch (SQLException e) {
            e.printStackTrace(); // Proper error handling should be done in real application
        }
        
        return userBoardList;
    }
    
    
    

    // 게시물 개수 조회
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM userboard";
        
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " LIKE ?";
        }

        try (PreparedStatement psmt = con.prepareStatement(query)) {
            if (map.get("searchWord") != null) {
                psmt.setString(1, "%" + map.get("searchWord") + "%");
            }
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    totalCount = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return totalCount;
    }

    // 게시물 리스트 조회
    public List<UserBoardDTO> selectListPage(Map<String, Object> map) {
        List<UserBoardDTO> board = new ArrayList<>();
        String query = "SELECT * FROM ("
                     + " SELECT tb.*, ROWNUM rNum FROM ("
                     + " SELECT * FROM userboard";
        
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                  + " LIKE ?";
        }

        query += " ORDER BY idx DESC"
               + ") tb"
               + ")"
               + " WHERE rNum BETWEEN ? AND ?";

        try (PreparedStatement psmt = con.prepareStatement(query)) {
            int paramIndex = 1;
            if (map.get("searchWord") != null) {
                psmt.setString(paramIndex++, "%" + map.get("searchWord") + "%");
            }
            // 기본값 설정
            int start = (map.get("start") != null) ? (int) map.get("start") : 1;
            int end = (map.get("end") != null) ? (int) map.get("end") : 10;

            psmt.setInt(paramIndex++, start);
            psmt.setInt(paramIndex, end);
            
            try (ResultSet rs = psmt.executeQuery()) {
                while (rs.next()) {
                    UserBoardDTO dto = new UserBoardDTO();
                    dto.setIdx(rs.getString("idx"));
                    dto.setName(rs.getString("name"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setFescate(rs.getString("fescate"));
                    dto.setFeslocation(rs.getString("feslocation"));
                    dto.setFesname(rs.getString("fesname"));
                    dto.setFesstart(rs.getString("fesstart"));
                    dto.setFesend(rs.getString("fesend"));
                    dto.setMainimage(rs.getBytes("mainimage"));
                    dto.setSecimage(rs.getBytes("secimage"));
                    dto.setThiimage(rs.getBytes("thiimage"));
                    dto.setVisitcount(rs.getInt("visitcount"));
                    dto.setLikecount(rs.getInt("likecount"));
                    dto.setPostdate(rs.getDate("postdate"));
                    board.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return board;
    }

    // 게시물 조회
    public UserBoardDTO selectView(String idx) {
        UserBoardDTO dto = new UserBoardDTO();
        String query = "SELECT * FROM userboard WHERE idx=?";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, idx);
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    dto.setIdx(rs.getString("idx"));
                    dto.setName(rs.getString("name"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    dto.setFescate(rs.getString("fescate"));
                    dto.setFeslocation(rs.getString("feslocation"));
                    dto.setFesname(rs.getString("fesname"));
                    dto.setFesstart(rs.getString("fesstart"));
                    dto.setFesend(rs.getString("fesend"));
                    dto.setMainimage(rs.getBytes("mainimage"));
                    dto.setSecimage(rs.getBytes("secimage"));
                    dto.setThiimage(rs.getBytes("thiimage"));
                    dto.setVisitcount(rs.getInt("visitcount"));
                    dto.setLikecount(rs.getInt("likecount"));
                    dto.setPostdate(rs.getDate("postdate"));
                    dto.setWriternum(rs.getString("writernum"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return dto;
    }

    // 게시물 삭제
    public int deletePost(String idx) {
        int result = 0;
        String query = "DELETE FROM userboard WHERE idx=?";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, idx);
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    // 게시물 수정
    public int updatePost(UserBoardDTO dto) {
        int result = 0;
        String query = "UPDATE userboard SET title=?, content=?, fescate=?, feslocation=?, "
                     + "fesname=?, fesstart=?, fesend=?, mainimage=?, secimage=?, thiimage=? "
                     + "WHERE idx=?";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getFescate());
            psmt.setString(4, dto.getFeslocation());
            psmt.setString(5, dto.getFesname());
            psmt.setString(6, dto.getFesstart());
            psmt.setString(7, dto.getFesend());
            psmt.setBytes(8, dto.getMainimage());
            psmt.setBytes(9, dto.getSecimage());
            psmt.setBytes(10, dto.getThiimage());
            psmt.setString(11, dto.getIdx());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    // 게시물 작성
    public int insertWrite(UserBoardDTO dto) {
        int result = 0;
        String query = "INSERT INTO userboard (idx, name, title, content, fescate, feslocation, "
                     + "fesname, fesstart, fesend, mainimage, secimage, thiimage, visitcount, "
                     + "likecount, postdate, writernum) "
                     + "VALUES (userboard_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, SYSDATE, ?)";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getFescate());
            psmt.setString(5, dto.getFeslocation());
            psmt.setString(6, dto.getFesname());
            psmt.setString(7, dto.getFesstart());
            psmt.setString(8, dto.getFesend());
            psmt.setBytes(9, dto.getMainimage());
            psmt.setBytes(10, dto.getSecimage());
            psmt.setBytes(11, dto.getThiimage());
            psmt.setString(12, dto.getWriternum());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return result;
    }

    // 조회수 증가
    public void updateVisitCount(String idx) {
        String query = "UPDATE userboard SET visitcount = visitcount + 1 WHERE idx=?";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, idx);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 추천수 증가
    public boolean hasUserLiked(int boardIdx, int likeUserNum) {
        String query = "SELECT COUNT(*) FROM USERLIKECHECK WHERE boardidx = ? AND likeusernum = ?";
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
        String updateQuery = "UPDATE userboard SET likecount = likecount + 1 WHERE idx = ?";
        String insertQuery = "INSERT INTO USERLIKECHECK (boardidx, likeusernum) VALUES (?, ?)";
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
    
    public String getPostAuthor(String idx) {
        String query = "SELECT writernum FROM userboard WHERE idx = ?";
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, idx);
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("writernum");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
 // 추가된 메서드: 월별 유저 게시물 수를 조회
    public Map<String, Integer> getUserBoardCountByMonth() {
        Map<String, Integer> boardCountByMonth = new HashMap<>();
        Calendar cal = Calendar.getInstance();
        int currentMonth = cal.get(Calendar.MONTH) + 1; // 현재 월
        int currentYear = cal.get(Calendar.YEAR);

        for (int i = -2; i <= 2; i++) {
            int month = currentMonth + i;
            int year = currentYear;
            if (month < 1) {
                month += 12;
                year -= 1;
            } else if (month > 12) {
                month -= 12;
                year += 1;
            }
            String monthKey = year + "-" + (month < 10 ? "0" + month : month);
            boardCountByMonth.put(monthKey, 0); // 초기화
        }

        String query = "SELECT TO_CHAR(postdate, 'YYYY-MM') AS month, COUNT(*) AS count "
                     + "FROM userboard "
                     + "WHERE postdate BETWEEN ADD_MONTHS(SYSDATE, -2) AND ADD_MONTHS(SYSDATE, 2) "
                     + "GROUP BY TO_CHAR(postdate, 'YYYY-MM')";

        try (PreparedStatement psmt = con.prepareStatement(query);
             ResultSet rs = psmt.executeQuery()) {
            while (rs.next()) {
                boardCountByMonth.put(rs.getString("month"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boardCountByMonth;
    }
}

/*
 // 추가된 메서드: 조회수 상위 3개 게시물 조회 public List<UserBoardDTO> getTopVisitedPosts() {
 List<UserBoardDTO> topVisitedPosts = new ArrayList<>(); String query =
 "SELECT * FROM userboard ORDER BY visitcount DESC FETCH FIRST 3 ROWS ONLY";
 
 try (PreparedStatement psmt = con.prepareStatement(query); ResultSet rs =
 psmt.executeQuery()) { while (rs.next()) { UserBoardDTO dto = new
 UserBoardDTO(); dto.setIdx(rs.getString("idx"));
 dto.setName(rs.getString("name")); dto.setTitle(rs.getString("title"));
 dto.setContent(rs.getString("content"));
 dto.setVisitcount(rs.getInt("visitcount")); topVisitedPosts.add(dto); } }
 catch (SQLException e) { e.printStackTrace(); } return topVisitedPosts; }
 
 // 추가된 메서드: 추천수 상위 3개 게시물 조회 public List<UserBoardDTO> getTopLikedPosts() {
 List<UserBoardDTO> topLikedPosts = new ArrayList<>(); String query =
 "SELECT * FROM userboard ORDER BY likecount DESC FETCH FIRST 3 ROWS ONLY";
 
 try (PreparedStatement psmt = con.prepareStatement(query); ResultSet rs =
 psmt.executeQuery()) { while (rs.next()) { UserBoardDTO dto = new
 UserBoardDTO(); dto.setIdx(rs.getString("idx"));
 dto.setName(rs.getString("name")); dto.setTitle(rs.getString("title"));
 dto.setContent(rs.getString("content"));
 dto.setLikecount(rs.getInt("likecount")); topLikedPosts.add(dto); } } catch
 (SQLException e) { e.printStackTrace(); } return topLikedPosts; } }
 */