package seoulmate.admin;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import seoulmate.membership.MemberDTO;

public class AuthBoardDAO extends DBConnPool {

	public AuthBoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM users";

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
	
	public List<MemberDTO> selectUserListPage(Map<String, Object> map) {
	    List<MemberDTO> board = new Vector<MemberDTO>();

	    String query = " " + "SELECT * FROM (" + "	SELECT Tb.*, ROWNUM rNum FROM ( "
	            + "		SELECT * FROM users ";

	    if (map.get("searchWord") != null) {
	        query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
	    }

	    query += " 		ORDER BY USER_NUM DESC " + " 	) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, map.get("start").toString());
	        psmt.setString(2, map.get("end").toString());
	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            MemberDTO dto = new MemberDTO();

	            dto.setUSER_NUM(rs.getInt("USER_NUM"));
	            dto.setUSER_ID(rs.getString("USER_ID"));
	            dto.setEMAIL(rs.getString("EMAIL"));
	            dto.setPHONENUM(rs.getString("PHONENUM"));
	            dto.setUSERNAME(rs.getString("USERNAME"));
	            dto.setUSER_STREET(rs.getString("USER_STREET"));
	            dto.setUSER_ZIP(rs.getString("USER_ZIP"));
//	            dto.setUSER_PHOTO(rs.getBytes("USER_PHOTO"));
	            dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));

	            board.add(dto);
	        }

	    } catch (Exception e) {
	        System.out.println("게시물 조회 중 예외 발생");
	        e.printStackTrace();
	    }

	    return board; // 목록 반환
	}

}
