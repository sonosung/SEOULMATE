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
/* MemberDTO user = (MemberDTO) session.getAttribute("user"); */
// request에서 dto 객체를 가져옵니다.
seoulmate.membership.MemberDTO dto = (seoulmate.membership.MemberDTO) request.getAttribute("dto");
/* MemberDTO user = (MemberDTO) session.getAttribute("user"); */
		  if (user != null) {		  
%>

</head>

<body style="background-color:#D4F1F4;">

<%-- <form name="user" method="post" enctype="multipart/form-data" action="../membership/profileEdit.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="email" value="<%= user.getEMAIL() %>"> --%>
<!-- 헤더와 콘텐트 페이지 분리용 디바이더 -->
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
								<img src="../resources/assets/img/blankProfile.png" alt="Admin"
									class="rounded-circle" width="200" height="200">
								<div class="mt-3">
									<br>
								<h4><% out.println(user.getUSER_ID()); %></h4>
									 <% out.println(user.getUSERNAME() + "님 환영합니다!"); %>
									<!-- <p class="text-secondary mb-1">Full Stack Developer</p> -->
									<p class="text-muted font-size-sm"><%-- <%= dto.getName() %> --%></p>
									<!-- <button class="btn btn-info">Follow</button> -->
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
							<%-- <hr>
							 <div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">찜한 축제</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<tr>
										<!-- 수국 정원 꽃축제 -->
										<td>${ dto.content }</td>
									</tr>
								</div>
							</div> --%>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<a class="btn btn-primary " target="__blank" href="../membership/profileEdit.do">회원정보수정</a>
									<a class="btn btn-primary " target="__blank" href="./contact.jsp">문의하기</a>
									<a class="btn btn-primary " target="__blank" href="../admin/Cancel.jsp">회원탈퇴</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<div class="divider-custom"></div>
			<!---------------------------------------- 회원 정보 칸 끝 ---------------------------------------->



			 <!-- <div class="card">
				<div class="main-body">
					<h5 class="d-flex align-items-center mb-3">내글 보기</h5>
					<p>게시글 수</p>
					<div class="progress mb-3" style="height: 5px">
						<div class="progress-bar bg-primary" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<p>댓글 수</p>
					<div class="progress mb-3" style="height: 5px">
						<div class="progress-bar bg-info" role="progressbar"
							style="width: 72%" aria-valuenow="72" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<p>추천수</p>
					<div class="progress mb-3" style="height: 5px">
						<div class="progress-bar bg-success" role="progressbar"
							style="width: 89%" aria-valuenow="89" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<p>조회수</p>
					<div class="progress mb-3" style="height: 5px">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 55%" aria-valuenow="55" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<p>패널티 현황</p>
					<div class="progress" style="height: 5px">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width: 66%" aria-valuenow="66" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div> -->
<div class="divider-custom"></div> 

			<!---------------------------------------- 나의 링크 ---------------------------------------->
<%-- 
			<div class="card mt-3">
				<ul class="list-group list-group-flush">
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-globe mr-2 icon-inline">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="2" y1="12" x2="22" y2="12"></line>
								<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
							Website
						</h6> <span class="text-secondary">https://bootdey.com</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-github mr-2 icon-inline">
								<path
									d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
							Github
						</h6> <span class="text-secondary">bootdey</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-twitter mr-2 icon-inline text-info">
								<path
									d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>
							Twitter
						</h6> <span class="text-secondary">@bootdey</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-instagram mr-2 icon-inline text-danger">
								<rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
								<path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
								<line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
							Instagram
						</h6> <span class="text-secondary">bootdey</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-facebook mr-2 icon-inline text-primary">
								<path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
							Facebook
						</h6> <span class="text-secondary">bootdey</span>
					</li>
				</ul>
			</div>

			<!---------------------------------------- 나의 링크 끝 ---------------------------------------->

			<!---------------------------------------- 뭐에다가 쓸까 ---------------------------------------->

			<div class="card mt-3">
				<div class="row gutters-sm">
					<div class="col-sm-5 mb-3">
						<div class="card h-100">
							<div class="card">
								<div class="main-body">
									<div class="card-body">
										<h6 class="d-flex align-items-center mb-3">
											<i class="material-icons text-info mr-2">이걸</i>어디에 쓰면 좋을까?
										</h6>
										<small>Web Design</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 80%" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<small>Website Markup</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 72%" aria-valuenow="72" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<small>One Page</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 89%" aria-valuenow="89" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<small>Mobile Template</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 55%" aria-valuenow="55" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
										<small>Backend API</small>
										<div class="progress mb-3" style="height: 5px">
											<div class="progress-bar bg-primary" role="progressbar"
												style="width: 66%" aria-valuenow="66" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div> --%>

							<!-- <div class="col-sm-5 mb-3">
					<div class="card h-100">
						<div class="card-body">
							<h6 class="d-flex align-items-center mb-3">
								<i class="material-icons text-info mr-2">이걸</i>어디에 쓰면 좋을까?
							</h6>
							<small>Web Design</small>
							<div class="progress mb-3" style="height: 5px">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 80%" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<small>Website Markup</small>
							<div class="progress mb-3" style="height: 5px">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 72%" aria-valuenow="72" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<small>One Page</small>
							<div class="progress mb-3" style="height: 5px">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 89%" aria-valuenow="89" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<small>Mobile Template</small>
							<div class="progress mb-3" style="height: 5px">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 55%" aria-valuenow="55" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
							<small>Backend API</small>
							<div class="progress mb-3" style="height: 5px">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 66%" aria-valuenow="66" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div> -->


						
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
	</form>
</body>
</html>