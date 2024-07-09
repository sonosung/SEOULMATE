<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원인증 메일 보내기</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/img/user/seungho.jpg" " />

<!-- Custom fonts for this template-->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="../resources/css/styles.css" rel="stylesheet" /> -->

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- 사이드바 시작 -->

			<jsp:include page="sidebar.jsp"></jsp:include>
			<!-- 사이드바를 외부 파일로 포함 -->

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->

				<jsp:include page="topBar.jsp"></jsp:include>

				<!-- End of Topbar -->

				<!-- Begin Page Content -->

				<!-- 이메일 작성 화면 -->
				<section class="py-5">
					<form method="post" action="EmailSendProcess.jsp" enctype="miltipart/form-data">
						<div class="container px-5">
							<div class="container-fluid">
								<!-- Contact form-->
								<div class="bg-light rounded-4 py-5 px-4 px-md-5">
									<div class="text-center mb-5">
										<div
											class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
											<i class="bi bi-envelope"></i>
										</div>
										<h1 class="fw-bolder">유저에게 이메일 보내기</h1>

									</div>
									<div class="row gx-5 justify-content-center">
										<div class="col-lg-8 col-xl-6">
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="admin"
													value="seoulmate01@naver.com" readonly /> <label
													for="email">보내는 사람</label>
												<div class="invalid-feedback"
													data-sb-feedback="email:required">An email is
													required.</div>
												<div class="invalid-feedback" data-sb-feedback="email:email">Email
													is not valid.</div>
											</div>

											<!-- Sender Email address input-->
											<div class="form-floating mb-3">
												<input class="form-control" placeholder="name@example.com"
													type="text" name="user" value="" /> <label for="email">받는
													사람</label>
												<div class="invalid-feedback"
													data-sb-feedback="email:required">An email is
													required.</div>
												<div class="invalid-feedback" data-sb-feedback="email:email">Email
													is not valid.</div>
											</div>

											<!-- Title input-->
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="title"
													placeholder="제목을 입력해주세요." size="50" value="" />
												<!-- <label for="title">이메일 제목</label> -->
												<div class="invalid-feedback"
													data-sb-feedback="title:required">A title is
													required.</div>
											</div>

											<!-- Message input-->
											<div class="form-floating mb-3">
												<textarea class="form-control" placeholder="내용을 입력해주세요..."
													name="content" style="height: 10rem"></textarea>

												<!-- <label for="message">이메일 내용</label> -->
												<div class="invalid-feedback"
													data-sb-feedback="message:required">A message is
													required.</div>
											</div>
											<div class="d-none" id="submitErrorMessage">
												<div class="text-center text-danger mb-3">Error
													sending message!</div>
											</div>

											<!-- 파일 첨부 -->
										<!-- 	<div class="form-group">
												<input class="form-control form-control-user" type="file" name="product_image" id="product_image" onchange="setThumbnail(event);">
												<input type="file" name="attachedFile" />
											</div>
											<div id="image_container"></div> -->

											<!-- Button-->
											<div class="d-grid">


												<button class="btn btn-primary btn-lg abled"
													id="submitButton" type="submit">Send</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- /.container-fluid -->
					</form>
				</section>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; TEAMKEAM 2024</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="logout.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function setDetailImage(event){
			for(var image of event.target.files){
				var reader = new FileReader();
				
				reader.onload = function(event){
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "col-lg-6");
					document.querySelector("div#images_container").appendChild(img);
				};
				
				console.log(image);
				reader.readAsDataURL(image);
			}
		}
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Contact Form Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>
</html>