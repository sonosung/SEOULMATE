<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="seoulmate.boardcomment.CommentDTO"%>
<%@ page import="seoulmate.boardcomment.CommentListController"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시글 열람 페이지</title>
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



<style>
.carousel-inner img {
	width: 600px; /* 고정 너비 */
	height: 600px; /* 고정 높이 */
	object-fit: cover; /* 이미지를 자르지 않고 고정된 크기에 맞춤 */
	margin: auto; /* 이미지를 중앙에 배치 */
}
</style>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#likeButton").click(function() {
			var idx = "${dto.idx}"; // 클릭한 버튼에 대한 DTO 객체의 idx 값 사용

			$.ajax({
				type : "POST", // POST 메소드 사용
				url : "like.do",
				data : {
					idx : idx
				},
				success : function(response) {
					// 서버에서 'success'를 반환하면 실행됩니다.
					if (response.trim() === 'success') {
						alert('추천되었습니다.');
						location.reload(); // 페이지 새로고침 혹은 적절한 방식으로 UI 업데이트
					} else {
						alert('추천 요청 실패');
					}
				},
				error : function(xhr, status, error) {
					alert('서버 요청 실패');
					console.error(xhr);
				}
			});
		});
	});

	$(document).ready(function() {
		loadComments();
	});

	$("#commentForm").submit(function(event) {
		event.preventDefault();
		var formData = $(this).serialize();

		$.ajax({
			type : "POST",
			url : "commentwrite.do",
			data : formData,
			success : function(response) {
				if (response.trim() === 'success') {
					alert('댓글이 성공적으로 작성되었습니다.');
					$("#commentForm")[0].reset();
					loadComments();
				} else {
					alert('댓글 작성 실패.');
				}
			},
			error : function(xhr, status, error) {
				alert('댓글 작성 중 오류가 발생했습니다.');
				console.error(xhr);
			}
		});
	});

	function renderComments(commentList) {
		var commentContainer = $("#commentList");
		commentContainer.empty(); // 기존의 댓글 목록을 모두 제거

		if (commentList.length > 0) {
			// 댓글이 있는 경우 HTML을 생성하여 추가
			var html = "";
			for (var i = 0; i < commentList.length; i++) {
				var comment = commentList[i];
				html += '<div class="card mb-2">';
				html += '<div class="card-body">';
				html += '<h5 class="card-title">' + comment.writer + '</h5>';
				html += '<p class="card-text">' + comment.content + '</p>';
				html += '<p class="card-text">';
				html += '<small class="text-muted">' + comment.createdat
						+ '</small>';
				html += '</p>';
				html += '</div>';
				html += '</div>';
			}
			commentContainer.html(html); // 댓글 목록을 HTML에 추가
		} else {
			commentContainer.html('<p>No comments found.</p>'); // 댓글이 없는 경우 메시지 표시
		}
	}

	// 서버에서 댓글 목록을 가져오는 함수
	function loadComments() {
		var idx = "${dto.idx}"; // 게시글의 idx 값을 가져옴 (서버에서 JSP로 데이터 전달 방식에 따라 다를 수 있음)

		$.ajax({
			url : 'commentlist.do',
			type : 'GET',
			dataType : 'json', // 서버에서 전송하는 데이터 형식이 JSON임을 명시
			data : {
				idx : idx
			},
			success : function(response) {
				renderComments(response); // 받아온 데이터를 처리하는 함수 호출
			},
			error : function(xhr, status, error) {
				console.error('AJAX 요청 실패: ', status, error);
			}
		});
	}
</script>







<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdf17bc322ecfe3f9b4123bfebc8ae80"></script>

<%
// request에서 dto 객체를 가져옵니다.
seoulmate.board.BoardDTO dto = (seoulmate.board.BoardDTO) request.getAttribute("dto");
%>

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
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">Portfolio</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Masthead-->

	<!-- 중앙 이미지 섹션 -->



	<header class="masthead bg-black text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->

			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">SEOULMATE</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Board -
				View</p>
		</div>
	</header>






	<div class="masthead bg-white text-black">



		<div>
			<table class="header-table" border="0" width="100%" height="100px"
				align="center">
				<tr class="masthead bg-secondary text-white">
					<td colspan="2" align="center">
						<h1>${ dto.title }</h1>
					</td>
				</tr>

				<td align="center"><br>
					<h1 class="masthead-heading text-uppercase mb-0">${ dto.fesname }</h1></td>

				<tr>
					<td colspan="2" align="right">
						<h4 style="margin-right: 500px;">작성자 : ${ dto.name}</h4>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<h4 style="margin-right: 500px;">조회수 : ${ dto.visitcount }</h4>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<h4 style="margin-right: 500px;">추천수 : ${ dto.likecount }</h4>
					</td>
				</tr>

			</table>
		</div>
		<br> <br> <br>

		<div id="carouselExampleIndicators" class="carousel slide"
			style="width: 55%; margin: auto;">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="data:image/jpeg;base64,${ dto.base64MainImage }"
						class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="data:image/jpeg;base64,${ dto.base64SecImage }"
						class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="data:image/jpeg;base64,${ dto.base64ThiImage }"
						class="d-block w-100">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<br> <br> <br>

		<table border="0" width="100%" align="center">

			<tr>
				<td>
					<h4>디버깅용 임시 텍스트 dto.idx = ${ dto.idx }</h4>
					<h4 style="margin-left: 500px;">행사명 : ${ dto.fesname }</h4>
					<h4 style="margin-left: 500px;">행사종류 : ${ dto.fescate }</h4>
					<h4 style="margin-left: 500px;">주소 : ${ dto.feslocation }</h4>
					<h4 style="margin-left: 500px;">기간 : ${ dto.fesstart } ~ ${ dto.fesend }</h4>
					------- API 날씨 정보 출력
				</td>
			</tr>

			<tr>
				<td><br>
					<h4 style="margin-left: 500px; margin-right: 500px;">
						내용 :
						<%=dto.getContent().replace("\n", "<br>")%></h4></td>
			</tr>


			<tr class="masthead bg-secondary">



				<td colspan="2" align="right">
					<button type="button" class="btn btn-secondary" id="likeButton">추천</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='fesedit.do?idx=${dto.idx}';">수정하기</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='fesdelete.do?idx=${dto.idx}';">삭제</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='feslist.do';">목록 바로가기</button>
				</td>



			</tr>


		</table>














		<!-- 중앙이미지 세션 끝 -->
		<section class="page-section bg-warning text-black mb-0" id="about">
			<div class="container">
				<!-- About Section Heading-->
				<h2
					class="page-section-heading text-center text-uppercase text-secondary mb-0">KAKAO
					길찾기</h2>
				<!-- Icon Divider-->
				<div class="divider-custom">
					<div class="divider-custom-line"></div>
					<div class="divider-custom-icon">
						<i class="fas fa-star"></i>
					</div>
					<div class="divider-custom-line"></div>

				</div>

				<br>
				<!-- Icon Divider-->
				<div id="map" style="width: 100%; height: 500px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdf17bc322ecfe3f9b4123bfebc8ae80fdf17bc322ecfe3f9b4123bfebc8ae80"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),
						level : 3
					};

					var map = new kakao.maps.Map(container, options);
				</script>
			</div>
		</section>


		<!-- 댓글 리스트 출력 -->



		<!-- 댓글 작성 폼 -->
		<section class="page-section bg-white text-black mb-0"
			id="commentSection">
			<div class="container">
				<h2 class="section-heading text-center text-uppercase">댓글 목록</h2>
				<div id="commentList">
					<!-- 댓글 목록을 동적으로 추가할 공간 -->
					<c:if test="${not empty commentList}">
						<c:forEach var="comment" items="${commentList}">
							<div class="card mb-2">
								<div class="card-body">
									<h5 class="card-title">${comment.writer}</h5>
									<p class="card-text">${comment.content}</p>
									<p class="card-text">
										<small class="text-muted">${comment.createdat}</small>
									</p>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty commentList}">
						<p>No comments found.</p>
					</c:if>
				</div>

				<div class="container">
					<div class="text-center">
						<h2 class="section-heading text-uppercase">댓글 작성</h2>
					</div>
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<form id="commentForm" action="commentwrite.do" method="post">
								<input type="hidden" name="idx" value="${dto.getIdx()}">
								<div class="form-group">
									<textarea class="form-control" id="content" name="content"
										rows="5" placeholder="댓글을 입력하세요..." required></textarea>
								</div>
								<button class="btn btn-primary btn-xl text-uppercase"
									type="submit">댓글 작성</button>
							</form>
						</div>
					</div>
				</div>
		</section>

		<!-- Contact Section-->

		<!-- Footer-->
		<footer class="footer text-center">
			<div class="container">
				<div class="row">
					<!-- Footer Location-->
					<div class="col-lg-4 mb-5 mb-lg-0">
						<h4 class="text-uppercase mb-4">Location</h4>
						<p class="lead mb-0">
							2215 John Daniel Drive <br /> Clark, MO 65243
						</p>
					</div>
					<!-- Footer Social Icons-->
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
					<!-- Footer About Text-->
					<div class="col-lg-4">
						<h4 class="text-uppercase mb-4">About Freelancer</h4>
						<p class="lead mb-0">
							Freelance is a free to use, MIT licensed Bootstrap theme created
							by <a href="http://startbootstrap.com">Start Bootstrap</a> .
						</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- Copyright Section-->
		<div class="copyright py-4 text-center text-white">
			<div class="container">
				<small>Copyright &copy; Your Website 2023</small>
			</div>
		</div>
		<!-- Portfolio Modals-->
		<!-- Portfolio Modal 1-->
		<div class="portfolio-modal modal fade" id="portfolioModal1"
			tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<!-- 첫번째 이미지 팝업 -->
				<div class="modal-content">
					<div class="modal-header border-0">
						<button class="btn-close" type="button" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<!-- Portfolio Modal 5-->

					<!-- Bootstrap core JS-->
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
					<!-- Core theme JS-->
					<script src="./resources/js/scripts.js"></script>
					<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
					<!-- * *                               SB Forms JS                               * *-->
					<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
					<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
					<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
