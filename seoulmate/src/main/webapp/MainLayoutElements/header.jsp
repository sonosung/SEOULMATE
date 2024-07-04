<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page import="seoulmate.membership.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--------------------------------------------------------- Navigation --------------------------------------------------------->
	 <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="../MainContent/index.jsp#page-top">SEOULMATE</a>
			
			<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" 
				data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" 
				aria-controls="navbarResponsive"
				aria-expanded="false" 
				aria-label="Toggle navigation">
				Menu 
				<i class="fas fa-bars">
				</i>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
			<form id="user" action ="../index.jsp">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="../MainContent/index.jsp#portfolio">추천행사</a>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="../MainContent/index.jsp#festival">게시판</a>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="../MainContent/index.jsp#calendar">행사달력</a>
					</li>
<%
   MemberDTO user = (MemberDTO) session.getAttribute("user");
   if (user != null) {
	   out.println("안녕하세요, " + user.getUSER_NUM() +"번 " + user.getUSER_ID()  +  "님!");
%>
      <li class="nav-item mx-0 mx-lg-1">
         <a class="nav-link py-3 px-0 px-lg-3 rounded" href="../admin/logout.jsp" id="Logout">Logout</a>
      </li>
      					<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="../membership/userinfo.do" type="submit"
					onclick="document.getElementById('user').sumbit();">MyPage</a>
					</li>
<%
   } else {
%>
					<li class="nav-item mx-0 mx-lg-1">
					<a class="nav-link py-3 px-0 px-lg-3 rounded" href="../userPage/contact.jsp">Contact</a>
					</li>
				      <li class="nav-item mx-0 mx-lg-1">
				         <a class="nav-link py-3 px-0 px-lg-3 rounded" href="../admin/login.jsp" id="Login">Login</a>
				      </li>
				      <li class="nav-item mx-0 mx-lg-1">
				         <a class="nav-link py-3 px-0 px-lg-3 rounded" href="../admin/register.jsp" id="SignIn">SignIn</a>
				      </li>
<%
   }
%>
				</ul>
				</form>
			</div>
		</div>
	 </nav>
<!--------------------------------------------------------- End Navigation --------------------------------------------------------->

<script>

function toggleBtn1() {
	  
	  // 토글 할 버튼 선택 (btn1)
	  const Login = document.getElementById('Login');
	  
	  // btn1 숨기기 (display: none)
	  if(dao.getMemberDTO(USER_EMAIL, USER_PASSWORD) !== null) {
		  Login.style.display = 'none';
	  }
	  // btn` 보이기 (display: block)
	  else {
		  Login.style.display = 'block';
	  }
	  
	}
</script>