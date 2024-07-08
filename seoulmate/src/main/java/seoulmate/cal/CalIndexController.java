package seoulmate.cal;

import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MainContent/calIndex.do")
public class CalIndexController  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

		 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		            throws ServletException, IOException {
			 
		        java.time.LocalDate currentDate = java.time.LocalDate.now();
		        
		        // 해당 달의 1일과 말일 계산
		        java.time.LocalDate firstDayOfMonth = currentDate.withDayOfMonth(1);
		        java.time.LocalDate lastDayOfMonth = currentDate.withDayOfMonth(currentDate.lengthOfMonth());
		        
		        // 포맷 설정
		        java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        String formattedFirstDay = firstDayOfMonth.format(formatter);
		        String formattedLastDay = lastDayOfMonth.format(formatter);

//		     String jdbcDriver = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
//		     String dbUrl = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB URL
//		     String dbId = "C##KEAM"; // DB 사용자 아이디
//		     String dbPw = "1234"; // DB 사용자 비밀번호
		     
		     
				CalDAO dao = new CalDAO(/* jdbcDriver, dbUrl, dbId, dbPw */);
		     String[][] calData = dao.getCalDTO(formattedFirstDay,formattedLastDay);
		     
//		     if (calData != null) {
//		    	    request.setAttribute("calData", calData);
//		    	    request.getRequestDispatcher("calIndex.jsp").forward(request, response);
//		     } 이 코드 쓰면 페이지가 calIndex로 새로고침 돼서 index에서 열면 바로 calIndex 만 나옴
		     
//		     for(int i = 0; i < calData.length; i++) {
//		    	 System.out.println(calData[i][0]);
//		    	 System.out.println(calData[i][1]);
//		    	 System.out.println(calData[i][2]);
//		    	 System.out.println(calData[i][3]);
//		     } 제대로 된 값을 가져왔는지 콘솔창에서 확인
		     
		        Gson gson = new Gson();
		        String jsonData = gson.toJson(calData);

		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        System.out.println(jsonData);
		        PrintWriter out = response.getWriter();
		        out.print(jsonData);
		        out.flush();

		 }
		 

}