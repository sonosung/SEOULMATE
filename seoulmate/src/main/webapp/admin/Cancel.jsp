<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seoulmate.membership.MemberDTO" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Forgot Password</title>

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

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Would you like to cancel your membership?</h1>
                                        <p class="mb-4"> Enter your password and we will delete your account. </p>
                                    </div>
                                    <form class="Cancel" action="Cancel.do" method="post">
                                        <div class="form-group">
                                     	   <%
                                            if (user != null) {
            								    out.println(user.getUSER_ID()+"님 회원 탈퇴시 글,댓글 전부 삭제됩니다.");
         								   }
                                            %>  
                                            <input type="hidden" name="EMAIL" value="<%= user != null ? user.getEMAIL() : "" %>">
                                            <input type="text" class="form-control form-control-user"
                                                id="Passtext" aria-describedby="PassHelp" name="USER_PASSWORD" required
                                                placeholder="Enter PassWord Address...">
                                                 <div style="margin-bottom: 10px;"></div>
                                                <div id="PassHelp"> Please enter your PassWord address.</div>
                                        </div>
                                         <button type="submit" class="btn btn-primary btn-user btn-block" onclick="/admin/Cancel.do" > Cancel MemberShip</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="../index.jsp">회원탈퇴 취소</a>
                                    </div>
                                </div>
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

</body>

</html>