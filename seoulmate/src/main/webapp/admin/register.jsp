<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
   MemberDTO user = (MemberDTO) session.getAttribute("user");
   if (user != null) {
       response.sendRedirect("../MainContent/index.jsp");
   } else {
   }
%>

<head>
	<style>
    #EmailMessage {
        margin-top: 10px;
    }
	button {
		width : 100px;
		height : 35px;
		border : 0px;
		color:white;
		background:#282A35;
		margin : 5px;
	}
	</style>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form id="registrationForm" class="user" action="register.do" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="USERNAME" id="exampleInputName" 
                                            placeholder="성명 / Full Name" required>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                  	  <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="EMAIL" onkeyup="checkEmail();"
                                        placeholder="이메일 / Email" required>
<!--       이메일 인증 보류                                <button type="button" class="btn btn-primary btn-user-An-search btn-block" id="" onclick="">이메일 인증</button> -->
                                    </div>
                               </div>
<!--       이메일 인증 보류                            <div class="form-group row">
                                    <div class="col-sm-4 mb-3 mb-sm-0">
                                  	  <input type="text" class="form-control form-control-user" id="InputEmailverification" name="EMAILverification"
                                        placeholder="인증번호 / Code" required>
                                    </div>
                                    <div class="col-sm-8">
      								  <div id="EmailMessage"></div>
 								    </div>
 								    </div> -->
                                <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="exampleID" name="USER_ID" 
                                        placeholder="닉네임 / User Name" required>
								</div>
								<div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="exampleInputPhone" name="PHONENUM" 
                                        placeholder="전화번호 / Phone" required>
								</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" name="USER_PASSWORD" placeholder="비밀번호 / Password" required onkeyup="checkPasswordMatch();">
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword2" name="pass2" placeholder="비밀번호 확인 / Confirm Password " required onkeyup="checkPasswordMatch();">
                                    </div>                               
                                </div>
                                 <div class="col-sm-12">
      								  <div id="passwordMatchMessage"></div>
      								  <hr>
 								 </div>
                                <div class="form-group row">			
								<div class="col-sm-2-An mb-3 mb-sm-0">
									<input type="text" class="form-control form-control-user postcodify_postcode5" name="USER_ZIP" 
										placeholder="Zip" readonly value=03048>
								</div>
								<div class="col-sm-8 mb-3 mb-sm-0">
									<input type="text"  class="form-control form-control-user postcodify_address" name="USER_STREET" 
										placeholder="도로명 주소 / Street" readonly value="서울특별시 종로구 청와대로 1">
								</div>
								<button type="button" class="btn btn-primary btn-user-An-search btn-block" id="postcodify_search_button" onclick="enableAddressFields()">검색</button>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user-An-Register-Account btn-block" onclick="validateAndSubmit(event)">Register Account</button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="login.jsp">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
    	<!-- 주소 API 스크립트 -->
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
	<script>
		function checkEmail(){
			var InputEmail = document.getElementById("exampleInputEmail").value;
			var messagEmail = document.getElementById("EmailMessage");
			
			messagEmail.innerHTML = "이메일 인증해주세요.";
			messagEmail.style.color = "red";
		}
	</script>
	
	<script>
        function checkPasswordMatch() {
            var password = document.getElementById("exampleInputPassword").value;
            var repeatPassword = document.getElementById("exampleRepeatPassword2").value;
            var message = document.getElementById("passwordMatchMessage");
            
            if(password.length >= 6){
                if (password === repeatPassword) {
                    message.innerHTML = "비밀번호가 일치합니다.";
                    message.style.color = "green";
                } else {
                    message.innerHTML = "비밀번호가 일치하지 않습니다.";
                    message.style.color = "red";
                }
            	
            } else {
            	 message.innerHTML = "비밀번호는 6글자 이상이어야합니다.";
                 message.style.color = "red";
            }
        }
        
        function validateAndSubmit(event) {
            event.preventDefault(); // 폼의 기본 제출 동작 방지

            var password = document.getElementById("exampleInputPassword").value;
            var repeatPassword = document.getElementById("exampleRepeatPassword2").value;
            var uname = document.getElementById("exampleInputName").value.trim();
			var inputEmail = document.getElementById("exampleInputEmail").value.trim();
            var message = document.getElementById("passwordMatchMessage");
            var inputPHONE = document.getElementById("exampleInputPhone").value.trim();
            
            var nameRegex = /^([a-zA-Z가-힣]+( [a-zA-Z가-힣]+)*)$/;
            var nameKor = /^[가-힣]+$/;
            var nameEng = /^[a-zA-Z]+(?: [a-zA-Z]+)*$/;
            var Email = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            var USER_PHONE = /^[0-9]*$/;

			
            if (nameRegex.test(uname)) {
            	if(nameKor.test(uname)){
            		if(Email.test(inputEmail)){
            			if(USER_PHONE.test(inputPHONE) && inputPHONE.length == 11){
                			if (password === repeatPassword && password.length >= 6) {
                                document.getElementById("registrationForm").submit();
                            } else {
                                message.innerHTML = "비밀번호가 일치하지 않거나 6글자 이상이 아닙니다.";
                                message.style.color = "red";
                            }
            			}else{
            				message.innerHTML = "핸드폰 번호가 부적합합니다.";
                            message.style.color = "red";
            			}
            		}else{
            			message.innerHTML = "이메일이 부적합합니다.";
                        message.style.color = "red";
            		}
            	}else if(nameEng.test(uname)){
            		if(Email.test(inputEmail)){
            			if(USER_PHONE.test(inputPHONE) && inputPHONE.length == 11){
                			if (password === repeatPassword && password.length >= 6) {
                                document.getElementById("registrationForm").submit();
                            } else {
                                message.innerHTML = "비밀번호가 일치하지 않거나 6글자 이상이 아닙니다.";
                                message.style.color = "red";
                            }
            			}else{
            				message.innerHTML = "핸드폰 번호가 부적합합니다.";
                            message.style.color = "red";
            			}
            		}else{
            			message.innerHTML = "이메일이 부적합합니다.";
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
    
    <script>
    function enableAddressFields() {
    	 var zipInput = document.querySelector('input[name="USER_ZIP"]');
         var streetInput = document.querySelector('input[name="USER_STREET"]');

         // 검색 버튼 클릭 시 입력 필드 활성화
         zipInput.removeAttribute('readonly');
         streetInput.removeAttribute('readonly');

         // 주소 입력 후 다시 비활성화
         zipInput.removeAttribute('disabled');
         streetInput.removeAttribute('disabled');
         
         setTimeout(function () {
             zipInput.setAttribute('readonly', 'true');
             streetInput.setAttribute('readonly', 'true');
         }, 500); // 0.5초 후에 읽기 전용으로 설정 (선택한 주소를 입력한 후 충분한 시간으로 설정)
    }
</script>

</body>
</html>