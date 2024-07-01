package seoulmate.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class UserBoardDAO extends DBConnPool {

    public UserBoardDAO() {
        super();
    }

    // 게시물 개수 조회
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM userboard";
        
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try (PreparedStatement psmt = con.prepareStatement(query); 
             ResultSet rs = psmt.executeQuery()) {
            if (rs.next()) {
                totalCount = rs.getInt(1);
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
                  + " LIKE '%" + map.get("searchWord") + "%'";
        }

        query += " ORDER BY idx DESC"
               + ") tb"
               + ")"
               + " WHERE rNum BETWEEN ? AND ?";

        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setInt(1, (int) map.get("start"));
            psmt.setInt(2, (int) map.get("end"));
            
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
                     + "likecount, postdate) "
                     + "VALUES (userboard_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, SYSDATE)";
        
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
    public void updateLikeCount(String idx) {
        String query = "UPDATE userboard SET likecount = likecount + 1 WHERE idx=?";
        
        try (PreparedStatement psmt = con.prepareStatement(query)) {
            psmt.setString(1, idx);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
