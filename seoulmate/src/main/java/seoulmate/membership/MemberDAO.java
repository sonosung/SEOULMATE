package seoulmate.membership;

import java.sql.DriverManager;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        try {
            Class.forName(drv);
            con = DriverManager.getConnection(url, id, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                dto.setUSER_PHOTO(rs.getString("USER_PHOTO"));
                dto.setUSER_POST(rs.getString("USER_POST"));
                dto.setUSER_COMMENT(rs.getString("USER_COMMENT"));
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
    public MemberDTO getMemberDTO_Cancel(String USER_PASSWORD , String EMAIL) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        String query = " DELETE FROM USERS WHERE USER_PASSWORD = ? AND EMAIL= ? ";
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
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}