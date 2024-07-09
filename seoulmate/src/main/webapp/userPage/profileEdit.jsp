<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <link rel="stylesheet" href="../resources/css/styles.css"> -->

<title>회원정보 변경 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/img/user/seungho.jpg" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script src="js/sb-admin-2.min.js"></script>
<style type="text/css">
body {
	margin-top: 20px;
	background: /* #f7f7ff; */ #2c3e50;
	
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
	border: 0 solid transparent;
	border-radius: .25rem;
	/* margin-bottom: 1.5rem; */
	/* box-shadow: 0 2px 6px 0 rgb(218 218 253/ 65%), 0 2px 6px 0
		rgb(206 206 238/ 54%); */
}

.me-2 {
	margin-right: .5rem !important;
}
</style>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<link href="../resources/css/styles.css" rel="stylesheet" />
<%
MemberDTO user = (MemberDTO) session.getAttribute("user");
		  if (user != null) {		  
%>

</head>
<body style="background-color:#D4F1F4;">

<form name="user" method="post" enctype="multipart/form-data" action="profileEdit.do" onsubmit="return validateForm(this);" id="registrationForm">
    <input type="hidden" name="email" value="<% out.println(user.getEMAIL()); %>">
    <!-- 나머지 폼 필드들 -->

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

	<!---------------------------------------- 헤드 네비게이터 끝 ---------------------------------------->


			<!-- <div class="row">
				<div class="col-lg-4"> -->
		<div style="height: 600px; width: 1260px;"> 
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card" style="height: 485px;">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
																<% if (user.getBase64UserPhoto() == null || user.getBase64UserPhoto().isEmpty()) { %>
 									   <img src="../resources/assets/img/blankProfile.png" class="rounded-circle" width="200" height="200">
																										<% } else { %>
										<img src="data:image/jpeg;base64, <%= user.getBase64UserPhoto() %>"  class="rounded-circle" width="200" height="200">
																	<% } %>	
								<div class="mt-3">
									<br>
								<h4><% out.println(user.getUSER_ID()); %></h4>
									 <% out.println(user.getUSERNAME() + "님 환영합니다!"); %>

									<br><br>
										<div style="margin-bottom: 10px;"></div>
										<input type="file" name="ofile" class="btn btn-primary form-control-file" id="photo">
										<div style="margin-bottom: 10px;"></div>
										<div class="custom-control custom-checkbox small">
										         <input type="checkbox" class="custom-control-input" id="photoCheck" name="photo_check" value="Y">
                                                <label class="custom-control-label" for="photoCheck">선택 한 사진을 프로필 사진으로 사용하기</label>
                                        </div>
										<div style="margin-bottom: 10px;"></div>
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" name="save_check" value="Y">
                                                <label class="custom-control-label" for="customCheck">프로필 사진 기본으로 되돌리기</label>
                                            </div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!---------------------------------------- 회원 정보 칸 시작 ---------------------------------------->
	
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body" style="height: 485px;">

						<br>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">이름</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" name="USERNAME" id="exampleInputName"  required
									value="<% out.println(user.getUSERNAME()); %>">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">닉네임</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" name="USER_ID" id="exampleID" required
									value="<% out.println(user.getUSER_ID()); %>">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">핸드폰</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" name="PHONENUM" id="exampleInputPhone" required
									value="<% out.println(user.getPHONENUM()); %>">
									
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">주소</h6>
								</div>
								<div class="col-sm-5 text-secondary">
									<input type="text" class="form-control postcodify_address" name="USER_STREET" 
									value="<% out.println(user.getUSER_STREET()); %>" readonly>
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control postcodify_postcode5" name="USER_ZIP"
									value="<% out.println(user.getUSER_ZIP()); %>" readonly>
								</div>	
								<div class=col-sm-2>
								<button type="button" class="btn btn-primary btn-user-An-search btn-block" id="postcodify_search_button">검색</button>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">현재 비밀번호</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="password" class="form-control" name="USER_PASS" id="examplePass" required>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
							</div>
							<div id="ErMessage">
 								</div>
							<br><br><br><br>
							<div class="row mb-4">
								<div class="col-sm-3"></div>
								<div class="col-sm-5 text-secondary">
								<div class="col-sm-12">
								<input type="submit" class="btn btn-primary px-4" 
										value="Save Changes"
										onclick="validateAndSubmit(event)"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</form>

<% 
}
%>
	<script>
	 function validateAndSubmit(event) {
         event.preventDefault(); // 폼의 기본 제출 동작 방지

        var nname = document.getElementById("exampleInputName").value.trim();
        var message = document.getElementById("ErMessage");
        var inputPHONE = document.getElementById("exampleInputPhone").value.trim();
        
        var nameRegex = /^([a-zA-Z가-힣]+( [a-zA-Z가-힣]+)*)$/;
        var nameKor = /^[가-힣]+$/;
        var nameEng = /^[a-zA-Z]+(?: [a-zA-Z]+)*$/;
        var USER_PHONE = /^[0-9]*$/;
       
            
        if (nameRegex.test(nname)) {
        	if(nameKor.test(nname)){
        		if(USER_PHONE.test(inputPHONE) && inputPHONE.length == 11){
    				document.getElementById("registrationForm").submit();
        		}else{
    				message.innerHTML = "핸드폰 번호가 부적합합니다.";
                    message.style.color = "red";
    			}
        	}else if(nameEng.test(nname)){
        		if(USER_PHONE.test(inputPHONE) && inputPHONE.length == 11){    
        				document.getElementById("registrationForm").submit();
        		}else{
    				message.innerHTML = "핸드폰 번호가 부적합합니다.";
                    message.style.color = "red";
    			}
        	}else{
        		message.innerHTML = "한글과 영문을 혼합하여 사용 할 수 없습니다.";
                message.style.color = "red";
        	}
        }else{
        	message.innerHTML = "이름은 한글이나 영문만 가능합니다.";
            message.style.color = "red";
        }
    }

	</script>

	<jsp:include page="../MainLayoutElements/footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 주소 API 스크립트 -->
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
</body>
</html>