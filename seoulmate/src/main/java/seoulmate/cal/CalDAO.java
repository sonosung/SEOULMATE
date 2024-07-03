package seoulmate.cal;

import java.sql.DriverManager;
import java.sql.SQLException;

import common.JDBConnect;

public class CalDAO extends JDBConnect {

    public CalDAO(String drv, String url, String id, String pw) {
        try {
            Class.forName(drv);
            con = DriverManager.getConnection(url, id, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String[][] getCalDTO(String a , String b) {
        String[][] siuuu = null;
        String queryCount = " SELECT count(*) "
        		+ " FROM board "
        		+ " WHERE (TO_DATE(FESSTART, 'YYYY-MM-DD') >= TO_DATE( ? , 'YYYY-MM-DD') AND TO_DATE(FESSTART, 'YYYY-MM-DD') <= TO_DATE( ? , 'YYYY-MM-DD')) "
        		+ " OR (TO_DATE(FESEND, 'YYYY-MM-DD') >= TO_DATE( ? , 'YYYY-MM-DD') AND TO_DATE(FESEND, 'YYYY-MM-DD') <= TO_DATE( ? , 'YYYY-MM-DD')) ";
        
        String queryData = " SELECT * "
        		+ " FROM board "
        		+ " WHERE (TO_DATE(FESSTART, 'YYYY-MM-DD') >= TO_DATE( ? , 'YYYY-MM-DD') AND TO_DATE(FESSTART, 'YYYY-MM-DD') <= TO_DATE( ? , 'YYYY-MM-DD')) "
        		+ " OR (TO_DATE(FESEND, 'YYYY-MM-DD') >= TO_DATE( ? , 'YYYY-MM-DD') AND TO_DATE(FESEND, 'YYYY-MM-DD') <= TO_DATE( ? , 'YYYY-MM-DD')) ";
        
        
        try {
            // 첫 번째 쿼리 실행하여 count(*) 가져오기
            psmt = con.prepareStatement(queryCount);
            psmt.setString(1, a);
            psmt.setString(2, b);
            psmt.setString(3, a);
            psmt.setString(4, b);
            rs = psmt.executeQuery();

            int rowCount = 0;
            if (rs.next()) {
                rowCount = rs.getInt(1);
            }

            // 두 번째 쿼리 실행하여 데이터 가져오기
            psmt = con.prepareStatement(queryData);
            psmt.setString(1, a);
            psmt.setString(2, b);
            psmt.setString(3, a);
            psmt.setString(4, b);
            rs = psmt.executeQuery();

            siuuu = new String[rowCount][4];
            int i = 0;
            while (rs.next()) {
                siuuu[i][0] = rs.getString("fesname");
                siuuu[i][1] = rs.getString("Fesstart");
                siuuu[i][2] = rs.getString("Fesend");
                siuuu[i][3] = Integer.toString(rs.getInt("Idx"));
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 리소스 정리
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return siuuu;
    }

}
