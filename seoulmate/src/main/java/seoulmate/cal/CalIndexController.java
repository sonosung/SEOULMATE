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


		     
		     
				CalDAO dao = new CalDAO();
				String[][] calData = dao.getCalDTO(formattedFirstDay,formattedLastDay);
		     

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