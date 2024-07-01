<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인페이지</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./resources/assets/img/user/seungho.jpg" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

<link href="../resources/css/styles.css" rel="stylesheet" />

</head>

<body id="page-top">

	<!--------------------------------------------------------- 헤더 --------------------------------------------------------->
	
	<jsp:include page="../MainLayoutElements/header.jsp"></jsp:include>

	<!------------------------------------------------------ 로고 페이지 -------------------------------------------------------->
	
	<jsp:include page="../MainLayoutElements/seoulmate.jsp"></jsp:include>

	<!------------------------------------------------------ 대표행사 영역 ------------------------------------------------------->

	<section class="page-section portfolio" id="portfolio" style="background-color:#EEF7FF;">
		<div class="container">
		
	<!------------------------------------------------------- 행사 섹션 --------------------------------------------------------->
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">
		추천 행사정보</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"> </div>
					<div class="divider-custom-icon">
						<i class="fas fa-star"></i>
					</div>
				<div class="divider-custom-line"></div>
			</div>

			<div class="container y mandatory-scroll-snapping" dir="ltr">
				<div class="row justify-content-center">

	<!---------------------------------------------------- 메인 중앙 첫번째 이미지 ---------------------------------------------------->

					<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
							<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<div class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src="../resources/assets/img/portfolio/cabin.png" alt="..." />
						</div>
					</div>

	<!--------------------------------------------------- 메인 중앙 두번째 이미지 ------------------------------------------------------>

					<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
							<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<div class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src="../resources/assets/img/portfolio/cake.png" alt="..." />
						</div>
					</div>

	<!---------------------------------------------------- 메인 중앙 세번째 이미지 ----------------------------------------------------->

					<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
							<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
								<div class="portfolio-item-caption-content text-center text-white">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div>
							<img class="img-fluid" src="../resources/assets/img/portfolio/circus.png" alt="..." />
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<!------------------------------------------------------ 게시판 섹션 ------------------------------------------------->

	<section class="page-section text-white mb-0" id="festival" style="background-color:#05445E;">
		<div class="container">
			<h2 class="page-section-heading text-center text-uppercase text-white">행사 게시판</h2>
				<!-- Icon Divider-->
				<div class="divider-custom divider-light">
					<div class="divider-custom-line"></div>
						<div class="divider-custom-icon">
							<i class="fas fa-star"></i>
						</div>
					<div class="divider-custom-line"></div>
				</div>
				
			<div class="row">
				<!-- <a class="btn btn-xl btn-outline-light" href="../boards/festivalList.jsp"> -->
				<a class="btn btn-xl btn-outline-light" href="../feslist.do">
					<i class="fas fa-download me-2"></i> 관리자 생성 행사 게시판</a>
				
				<hr>
				
				<!-- <a class="btn btn-xl btn-outline-light" href="../boards/list.jsp"> -->
				<a class="btn btn-xl btn-outline-light" href="../userlist.do">
					<i class="fas fa-download me-2"></i> 회원 공유 행사 게시판</a>
			</div>
		</div>
	</section>

	<!------------------------------------------------------ 달력 ------------------------------------------------->
	
	<jsp:include page="calIndex.jsp"></jsp:include>

	<!---------------------------------------------------- Footer ------------------------------------------------>
	
	<jsp:include page="../MainLayoutElements/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>