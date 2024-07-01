<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="seoulmate.board.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시글 수정 페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/styles.css" rel="stylesheet" />
<!-- Custom CSS for table borders -->
<style>
table {
	border-collapse: collapse;
	width: 90%;
	margin: auto;
}

td, th {
	border: 1px solid #ddd;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: center;
	background-color: #4caf50;
	color: white;
}
</style>
</head>

<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Seoul Mate</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
		</div>
	</nav>

	<!-- Masthead-->
	<header class="masthead bg-black text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">게시글 수정</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Board Edit
				Page</p>
		</div>
	</header>

	<!-- Form Section -->
	<div class="container mt-5">
		<form name="editFrm" method="post" enctype="multipart/form-data"
			action="useredit.do" onsubmit="return validateForm(this);">
			<%-- Hidden input for idx --%>
			<input type="hidden" name="idx" value="${dto.idx}">
			<table class="table">
				<tr>
					<td class="bg-secondary text-white" style="width: 20%;">카테고리</td>
					<td style="width: 80%;"><select name="fescate"
						class="form-control">

							<option value="sel">=== 선택 ===</option>
							<option value="나들이" ${dto.fescate eq '나들이' ? 'selected' : ''}>나들이</option>
							<option value="공연" ${dto.fescate eq '공연' ? 'selected' : ''}>공연</option>
							<option value="먹거리" ${dto.fescate eq '먹거리' ? 'selected' : ''}>먹거리</option>
							<option value="친구와 함께"
								${dto.fescate eq '친구와 함께' ? 'selected' : ''}>친구와 함께</option>
							<option value="전통" ${dto.fescate eq '전통' ? 'selected' : ''}>전통</option>
					</select></td>
				</tr>
				<tr>
					<h1>(디버깅용 임시 텍스트)dto.idx - ${ dto.idx }</h1>
					<td class="bg-secondary text-white">제목</td>
					<td><input type="text" name="title" class="form-control"
						value="${dto.title}"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">행사명</td>
					<td><input type="text" name="fesname" class="form-control"
						value="${dto.fesname}"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">메인 이미지</td>
					<td><input type="file" name="mainimage"
						class="form-control-file"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">행사 내용</td>
					<td><textarea name="content" class="form-control" rows="5">${dto.content}</textarea></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">이미지 1</td>
					<td><input type="file" name="secimage"
						class="form-control-file"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">이미지 2</td>
					<td><input type="file" name="thiimage"
						class="form-control-file"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">행사 주소</td>
					<td><input type="text" name="feslocation" class="form-control"
						value="${dto.feslocation}"></td>
				</tr>
				<tr>
					<td class="bg-secondary text-white">행사 기간</td>
					<td><input type="date" name="fesstart" class="form-control"
						value="${dto.fesstart}"> - <input type="date"
						name="fesend" class="form-control" value="${dto.fesend}">
					</td>
				</tr>
				<tr class="bg-secondary text-white">
					<td colspan="2" align="right">

						<button type="submit" class="btn btn-secondary">수정 완료</button>
						<button type="reset" class="btn btn-secondary">RESET</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='list.do';">목록 바로가기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						2215 John Daniel Drive <br>Clark, MO 65243
					</p>
				</div>
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Freelancer</h4>
					<p class="lead mb-0">
						Freelance is a free to use, MIT licensed Bootstrap theme created
						by <a href="http://startbootstrap.com">Start Bootstrap</a>.
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JS - includes Popper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="./resources/js/scripts.js"></script>
</body>

</html>
