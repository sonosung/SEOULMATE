package seoulmate.membership;

import common.DBConnPool;

public class UserInfoDAO extends DBConnPool {
	
	// 명시한 아이디/패스워드와 일치하는 회원정보 반환
    public MemberDTO getUserInfo(int idx) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM USERS WHERE user_num=?";
        System.out.println("맴버 DAO 값 들어오는지 확인" + idx);
        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, idx);
            rs = psmt.executeQuery();
            System.out.println("맴버 DAO 값 들어오는지 확인" + idx);

            if (rs.next()) {
            	
            	dto.setUSER_NUM(rs.getInt("USER_NUM"));
            	dto.setEMAIL(rs.getString("EMAIL"));
                dto.setUSER_ID(rs.getString("USER_ID"));
                dto.setPHONENUM(rs.getString("PHONENUM"));
                dto.setUSERNAME(rs.getString("USERNAME"));
                dto.setUSER_STREET(rs.getString("USER_STREET"));
                dto.setUSER_ZIP(rs.getString("USER_ZIP"));
                dto.setUSER_PHOTO(rs.getString("USER_PHOTO"));
                dto.setUSER_POST(rs.getString("USER_POST"));
                dto.setUSER_COMMENT(rs.getString("USER_COMMENT"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
	// 입력한 비밀번호가 지정한 일련번호의 게시물의 비밀번호와 일치하는지 확인합니다.
		public boolean confirmPassword(String pass, String email) {
			boolean isCorr = true;
			try {
				String sql = "SELECT COUNT(*) FROM users WHERE pass=? AND email=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, pass);
				psmt.setString(2, email);
				rs = psmt.executeQuery();
				rs.next();
				if (rs.getInt(1) == 0) {
					isCorr = false;
				}
			} catch (Exception e) {
				isCorr = false;
				e.printStackTrace();
			}

			return isCorr;

		}
		
//		public int updateProfile(MemberDTO dto) {
//			int result = 0;
//			try {
//				//쿼리문
//				String query = "UPDATE  users"
//							+ " SET USER_PHOTO=?, USERNAME=?, USER_ID=?, PHONENUM=?, USER_STREET=?, USER_ZIP=? "
//							+ " WHERE EMAIL=?";
//				
//				psmt = con.prepareStatement(query);
//				psmt.setString(1, dto.getUSER_PHOTO());
//				psmt.setString(2, dto.getUSERNAME());
//				psmt.setString(3, dto.getUSER_ID());
//				psmt.setString(4, dto.getPHONENUM());
//				psmt.setString(5, dto.getUSER_STREET());
//				psmt.setString(6, dto.getUSER_ZIP());
//				
//				result = psmt.executeUpdate();
//			}
//			catch (Exception e) {
//				System.out.println("회원정보 수정 중 예외 발생");
//				e.printStackTrace();
//			}
//			return result;
//		}
    public int updateProfile(MemberDTO dto) {
        int result = 0;
        try {
//        	USER_PHOTO=?,
            String query = "UPDATE users SET USERNAME=?, USER_ID=?, PHONENUM=?, USER_STREET=?, USER_ZIP=? WHERE EMAIL=?";
            psmt = con.prepareStatement(query);
//            psmt.setString(1, dto.getUSER_PHOTO());
            psmt.setString(1, dto.getUSERNAME());
            psmt.setString(2, dto.getUSER_ID());
            psmt.setString(3, dto.getPHONENUM());
            psmt.setString(4, dto.getUSER_STREET());
            psmt.setString(5, dto.getUSER_ZIP());
            psmt.setString(6, dto.getEMAIL());  // Add this line
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("회원정보 수정 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
}
