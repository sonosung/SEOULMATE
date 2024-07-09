package seoulmate.membership;

import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Base64;

import common.DBConnPool;
import common.JDBConnect;
import jakarta.servlet.http.Part;

/*public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        try {
            Class.forName(drv);
            con = DriverManager.getConnection(url, id, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
     public class MemberDAO extends DBConnPool {

    	public MemberDAO() {
    		super();
    	}


    // 명시한 아이디/패스워드와 일치하는 회원정보 반환
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM users WHERE EMAIL=? AND USER_PASSWORD=?";
        System.out.println("맴버 DAO 값 들어오는지 확인" + uid + upass);
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setUSER_NUM(rs.getInt("USER_NUM"));
                dto.setUSER_ID(rs.getString("USER_ID"));
                dto.setEMAIL(rs.getString("EMAIL"));
                dto.setPHONENUM(rs.getString("PHONENUM"));
                dto.setUSERNAME(rs.getString("USERNAME"));
                dto.setUSER_STREET(rs.getString("USER_STREET"));
                dto.setUSER_ZIP(rs.getString("USER_ZIP"));
                dto.setUSER_PHOTO(rs.getBytes("USER_PHOTO"));
                dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
    
            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    //비밀번호 찾기 
    public MemberDTO getMemberDTO(String uemail, String uname, String uphone) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "SELECT USER_PASSWORD FROM users WHERE EMAIL=? AND USERNAME=? AND PHONENUM=? ";
        System.out.println("맴버 DAO 값 들어오는지 확인" + uemail + uname + uphone);
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, uemail);
            psmt.setString(2, uname);
            psmt.setString(3, uphone);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    
    //회원 가입
    public MemberDTO getMemberDTO(String USERNAME, String EMAIL, String USER_ID,String PHONENUM, String USER_PASSWORD,String USER_STREET, String USER_ZIP) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "SELECT EMAIL FROM user_save WHERE EMAIL=? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, EMAIL);
            rs = psmt.executeQuery();
            
            if (rs.next()) {
                dto.setEMAIL(rs.getString("EMAIL"));
            }
            
            if(dto.getEMAIL() == null) {
               System.out.println("이메일 중복 없음");
               try {
                  query = "SELECT USER_ID FROM users WHERE USER_ID=? ";
                    psmt = con.prepareStatement(query);
                    psmt.setString(1, USER_ID);
                    rs = psmt.executeQuery();
                    
                    if (rs.next()) {
                        dto.setUSER_ID(rs.getString("USER_ID"));
                    }
                    
                    if(dto.getUSER_ID() == null) {
                       System.out.println("닉네임 중복 없음");
                       try {
                          query = "INSERT INTO users(USER_NUM,USERNAME,EMAIL,USER_ID,PHONENUM,USER_PASSWORD,USER_ZIP,USER_STREET) "
                                + "VALUES (LOGINNUMBER3.NEXTVAL , ?, ?, ?, ?, ?, ?, ? ) ";
                            psmt = con.prepareStatement(query);
                            psmt.setString(1, USERNAME);
                            psmt.setString(2, EMAIL);
                            psmt.setString(3, USER_ID);
                            psmt.setString(4, PHONENUM);
                            psmt.setString(5, USER_PASSWORD);
                            psmt.setString(6, USER_ZIP);
                            psmt.setString(7, USER_STREET);
                            rs = psmt.executeQuery();
                            
                            
                       } catch (Exception e) {
                            e.printStackTrace();
                        }
                        return dto;
                        
                    }else {
                       dto.setUSER_ID_ERROR("닉네임중복");
                       System.out.println("닉네임이 중복 됨");
                    }
               }catch (Exception e) {
                        e.printStackTrace();
                    }
                    return dto;

            }else {
               dto.setUSER_EMAIL_ERROR("이메일이 중복되었습니다.");
               System.out.println("이메일 중복 됨");
            }
            rs.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    //계삭빵
    public MemberDTO getMemberDTO_Cancel(String USER_PASSWORD , String EMAIL ,int idx) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = " DELETE FROM USERS WHERE USER_PASSWORD = ? AND EMAIL= ? ";
        String query_board_cancel = " DELETE FROM userboard WHERE WRITERNUM = ? ";
        String query_comment_cancel = " DELETE FROM COMMENTS WHERE WRITERNUM = ? ";
        System.out.println("계삭빵 맴버 DAO 값 들어오는지 확인" + USER_PASSWORD + EMAIL);
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, USER_PASSWORD);
            psmt.setString(2, EMAIL);
            rs = psmt.executeQuery();
            
            if (rs.next()) {
                dto.setCANCEL("uCancel");
            }
            
            query = " DELETE FROM user_save WHERE EMAIL= ? ";
            psmt = con.prepareStatement(query);
            psmt.setString(1, EMAIL);
            rs = psmt.executeQuery();
            
            psmt = con.prepareStatement(query_board_cancel);
            psmt.setInt(1, idx);
            rs = psmt.executeQuery();
            
            psmt = con.prepareStatement(query_comment_cancel);
            psmt.setInt(1, idx);
            rs = psmt.executeQuery();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
    
    //프사 변경
    public MemberDTO getMemberDTO_UPDATE(int idx, String N, String Id, String P, String St, String zip, Part mainimagePart,String Email) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "UPDATE users SET  USERNAME = ?, USER_ID = ?, PHONENUM = ?, USER_STREET = ?, USER_ZIP = ?, USER_PHOTO = ? WHERE USER_NUM = ?";
        String query2 = "SELECT * FROM users WHERE USER_NUM = ?";
        String query_nick_check = "SELECT EMAIL FROM users WHERE USER_ID = ? ";
        
        try {
        	psmt = con.prepareStatement(query_nick_check);
        	psmt.setString(1, Id);
        	rs = psmt.executeQuery();
        	
        	if (rs.next()) {
        		dto.setEMAIL(rs.getString("EMAIL"));
        	}
        	
        	if(dto.getEMAIL() == null || dto.getEMAIL().equals(Email)) {
			        try {
			            // 사진 업로드 처리
			            if (mainimagePart != null && mainimagePart.getSize() > 0) {
			                InputStream mainimageInputStream = mainimagePart.getInputStream();
			                byte[] mainimage = mainimageInputStream.readAllBytes();
			                dto.setUSER_PHOTO(mainimage); // DTO에 사진 데이터 설정
			
			            }
			
			            psmt = con.prepareStatement(query);
			            psmt.setString(1, N);
			            psmt.setString(2, Id);
			            psmt.setString(3, P);
			            psmt.setString(4, St);
			            psmt.setString(5, zip);
			            // 사진 데이터를 byte 배열로 업데이트
			            if (mainimagePart != null && mainimagePart.getSize() > 0) {
			                psmt.setBytes(6, dto.getUSER_PHOTO());
			            } else {
			                psmt.setNull(6, Types.BLOB); // 사진이 업데이트되지 않을 경우 NULL 처리
			            }
			            psmt.setInt(7, idx);
			            psmt.executeUpdate();         
			            
			            dto.setUD("UD");
			          		       
			            psmt = con.prepareStatement(query2);
			            psmt.setInt(1, idx);
			            rs = psmt.executeQuery();
			
			            if (rs.next()) {
			                dto.setUSER_NUM(rs.getInt("USER_NUM"));
			                dto.setUSER_ID(rs.getString("USER_ID"));
			                dto.setEMAIL(rs.getString("EMAIL"));
			                dto.setPHONENUM(rs.getString("PHONENUM"));
			                dto.setUSERNAME(rs.getString("USERNAME"));
			                dto.setUSER_STREET(rs.getString("USER_STREET"));
			                dto.setUSER_ZIP(rs.getString("USER_ZIP"));
			                dto.setUSER_PHOTO(rs.getBytes("USER_PHOTO")); // 사진 데이터를 DTO에 설정
			                dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
			            }
			            
			
			        } catch (Exception e) {
			            e.printStackTrace();
			        } finally {
			            // 리소스 해제
			            try {
			                if (rs != null) rs.close();
			                if (psmt != null) psmt.close();
			                if (con != null) con.close();
			            } catch (SQLException e) {
			                e.printStackTrace();
			            }
			        }
			        return dto;
			        
        		}else {
            		dto.setUD_NICK("닉중복");
            	}
            	

            } catch (SQLException e) {
                e.printStackTrace();
            }
            return dto;
        }
    
    
    //기본이미지로 돌리기
    public MemberDTO getMemberDTO_UPDATE_NOMAL(int idx, String N, String Id, String P, String St, String zip, String Email) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "UPDATE users SET USERNAME = ?, USER_ID = ?, PHONENUM = ?, USER_STREET = ?, USER_ZIP = ?,USER_PHOTO = NULL WHERE USER_NUM = ?";
        String query2 = "SELECT * FROM users WHERE USER_NUM = ?";
        String query_nick_check = "SELECT EMAIL FROM users WHERE USER_ID = ? ";
        
        try {
        	psmt = con.prepareStatement(query_nick_check);
        	psmt.setString(1, Id);
        	rs = psmt.executeQuery();
        	
        	if (rs.next()) {
        		dto.setEMAIL(rs.getString("EMAIL"));
        	}
        	
        	if(dto.getEMAIL() == null || dto.getEMAIL().equals(Email)) {
        		 try {
        	            psmt = con.prepareStatement(query);

        	            psmt.setString(1, N);
        	            psmt.setString(2, Id);
        	            psmt.setString(3, P);
        	            psmt.setString(4, St);
        	            psmt.setString(5, zip);
        	            psmt.setInt(6, idx);
        	            psmt.executeUpdate();         
        	            
        	            dto.setUD("UD");
        	          		       
        	            psmt = con.prepareStatement(query2);
        	            psmt.setInt(1, idx);
        	            rs = psmt.executeQuery();

        	            if (rs.next()) {
        	                dto.setUSER_NUM(rs.getInt("USER_NUM"));
        	                dto.setUSER_ID(rs.getString("USER_ID"));
        	                dto.setEMAIL(rs.getString("EMAIL"));
        	                dto.setPHONENUM(rs.getString("PHONENUM"));
        	                dto.setUSERNAME(rs.getString("USERNAME"));
        	                dto.setUSER_STREET(rs.getString("USER_STREET"));
        	                dto.setUSER_ZIP(rs.getString("USER_ZIP"));
        	                dto.setUSER_PHOTO(rs.getBytes("USER_PHOTO")); // 사진 데이터를 DTO에 설정
        	                dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
        	            }
        	            

        	        } catch (Exception e) {
        	            e.printStackTrace();
        	        } finally {
        	            // 리소스 해제
        	            try {
        	                if (rs != null) rs.close();
        	                if (psmt != null) psmt.close();
        	                if (con != null) con.close();
        	            } catch (SQLException e) {
        	                e.printStackTrace();
        	            }
        	        }
        	        return dto;
        	}else {
        		dto.setUD_NICK("닉중복");
        	}
        	

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }

    
    //사진 건드리지 않기
    public MemberDTO getMemberDTO_UPDATE_NOPHOTO(int idx, String N, String Id, String P, String St, String zip,String Email) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = "UPDATE users SET USERNAME = ?, USER_ID = ?, PHONENUM = ?, USER_STREET = ?, USER_ZIP = ? WHERE USER_NUM = ?";
        String query2 = "SELECT * FROM users WHERE USER_NUM = ?";
        String query_nick_check = "SELECT EMAIL FROM users WHERE USER_ID = ? ";
        
        try {
        	psmt = con.prepareStatement(query_nick_check);
        	psmt.setString(1, Id);
        	rs = psmt.executeQuery();
        	
        	if (rs.next()) {
        		dto.setEMAIL(rs.getString("EMAIL"));
        	}
        	
        	if(dto.getEMAIL() == null || dto.getEMAIL().equals(Email)) {

			        try {
			
			            psmt = con.prepareStatement(query);
			
			            psmt.setString(1, N);
			            psmt.setString(2, Id);
			            psmt.setString(3, P);
			            psmt.setString(4, St);
			            psmt.setString(5, zip);
			            psmt.setInt(6, idx);
			            psmt.executeUpdate();         
			            
			            dto.setUD("UD");
			          		       
			            psmt = con.prepareStatement(query2);
			            psmt.setInt(1, idx);
			            rs = psmt.executeQuery();
			
			            if (rs.next()) {
			                dto.setUSER_NUM(rs.getInt("USER_NUM"));
			                dto.setUSER_ID(rs.getString("USER_ID"));
			                dto.setEMAIL(rs.getString("EMAIL"));
			                dto.setPHONENUM(rs.getString("PHONENUM"));
			                dto.setUSERNAME(rs.getString("USERNAME"));
			                dto.setUSER_STREET(rs.getString("USER_STREET"));
			                dto.setUSER_ZIP(rs.getString("USER_ZIP"));
			                dto.setUSER_PHOTO(rs.getBytes("USER_PHOTO")); // 사진 데이터를 DTO에 설정
			                dto.setUSER_PASSWORD(rs.getString("USER_PASSWORD"));
			            }
			            
			
			        } catch (Exception e) {
			            e.printStackTrace();
			        } finally {
			            // 리소스 해제
			            try {
			                if (rs != null) rs.close();
			                if (psmt != null) psmt.close();
			                if (con != null) con.close();
			            } catch (SQLException e) {
			                e.printStackTrace();
			            }
			        }
			        return dto;
			    }else {
	        		dto.setUD_NICK("닉중복");
	        	}
	        	

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return dto;
	    }


}