<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html lang="en">

<%
   MemberDTO user = (MemberDTO) session.getAttribute("user");
   if (user != null) {
   } else {
	   response.sendRedirect("../admin/login.jsp");
   }
%>

<head>
<meta charset="utf-8">

<title>마이페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../resources/assets/img/user/seungho.jpg" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
body {
	margin-top: 20px;
	color: #1a202c;
	text-align: left;
	background-color: /* #e2e8f0; */ #2c3e50;
}

.main-body {
	padding: 15px;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-bottom: 1rem !important;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}
</style>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<link href="../resources/css/styles.css" rel="stylesheet" />
<%
seoulmate.membership.MemberDTO dto = (seoulmate.membership.MemberDTO) request.getAttribute("dto");
		  if (user != null) {		  
%>

</head>

<body style="background-color:#D4F1F4;">

<div class="divider-custom"></div>
<div class="divider-custom"></div>
<div class="divider-custom"></div>
<div class="divider-custom"></div>
<div class="divider-custom"></div>
<div class="divider-custom"></div>

	<!---------------------------------------- 전체 컨테이너 ---------------------------------------->

	<div class="container">
		<div class="main-body">
			
	<!---------------------------------------- 헤드 네비게이터 ---------------------------------------->
				
	<jsp:include page="../MainLayoutElements/header.jsp"></jsp:include>
	
	<!---------------------------------------- 전체 컨테이너 ---------------------------------------->
		<div style="height: 375px; width: 1260px;"> 
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card" style="height:350px;">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
							<% if (user.getBase64UserPhoto() == null || user.getBase64UserPhoto().isEmpty()) { %>
 									   <img src="../resources/assets/img/blankProfile.png" class="rounded-circle" width="200" height="200">
																										<% } else { %>
										<img src="data:image/jpeg;base64, <%= user.getBase64UserPhoto() %>"  class="rounded-circle" width="200" height="200">
																	<% } %>
														<div class="mt-3">	
														    <!-- 추가적인 내용 -->
														</div>

								<div class="mt-3">
									<br>
								<h4><% out.println(user.getUSER_ID()); %></h4>
									 <% out.println(user.getUSERNAME() + "님 환영합니다!"); %>
									<p class="text-muted font-size-sm"><%-- <%= dto.getName() %> --%></p>
								</div>
							</div>
						</div>
					</div>
				</div>
		
				<!---------------------------------------- 회원 정보 칸 시작 ---------------------------------------->
				
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body" style="height: 345px;">
						<br>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">이름</h6>
								</div>
								<div class="col-sm-9 text-secondary">
								<% out.println(user.getUSERNAME()); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">이메일</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<% out.println(user.getEMAIL()); %>
								</div>
							</div>
							<hr>
							
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">
									핸드폰
									</h6>
								</div>
								<div class="col-sm-9 text-secondary">
								<% out.println(user.getPHONENUM()); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">주소</h6>
								</div>
								<div class="col-sm-9 text-secondary">
								<% out.println("(" + user.getUSER_ZIP() + ")  " + user.getUSER_STREET()); %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<a class="btn btn-primary "  href="profileEdit.jsp">회원정보수정</a>
									<a class="btn btn-primary "  href="contact.jsp">문의하기</a>
									<a class="btn btn-primary "  href="../admin/Cancel.jsp">회원탈퇴</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<div class="divider-custom"></div>

<div class="divider-custom"></div> 


						
					</div>
				</div>

		<!---------------------------------------- 뭐에다가 쓸까 ---------------------------------------->

<%
 }
%>
	<!-- Footer -->
	<jsp:include page="../MainLayoutElements/footer.jsp"></jsp:include>

	<!-- <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">	
	</script>
	<!-- </form> -->
</body>
</html>