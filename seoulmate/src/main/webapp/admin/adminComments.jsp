<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page
	import="java.util.*, seoulmate.boardcomment.CommentDAO, seoulmate.boardcomment.CommentDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>댓글 목록 페이지</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version) -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>

<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.delete-btn {
	background-color: #f44336;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3cV5yv/NqmaV1wvmY4e7p2O/OfD02Q+"
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		// 삭제 버튼 클릭 이벤트 처리
		$(document).on('click', '.delete-btn', function() {
			var commentId = $(this).data('id');
			if (confirm("정말 이 댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : 'admindelete.do',
					type : 'POST',
					data : {
						id : commentId
					// Ensure 'id' matches the parameter name expected by the server
					},
					success : function(response) {
						if (response.trim() === "success") {
							alert("댓글이 삭제되었습니다.");
							location.reload(); // 페이지 새로고침
						} else {
							alert("댓글 삭제에 실패했습니다.");
						}
					},
					error : function(xhr, status, error) {
						console.error('AJAX 요청 실패: ', status, error);
						alert("댓글 삭제 중 오류가 발생했습니다.");
					}
				});
			}
		});
	});
</script>








</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- 페이지 전체를 감싸는 래퍼 -->

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
			<!-- 콘텐츠 래퍼 -->

			<!-- Main Content -->
			<div id="content">
				<!-- 메인 콘텐츠 영역 -->

				<!-- Topbar -->
                <jsp:include page="topBar.jsp"></jsp:include>
                <!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<h1>댓글 목록</h1>
					<table>
						<thead>
							<tr>
								<th>댓글 ID</th>
								<th>게시글 ID</th>
								<th>작성자</th>
								<th>내용</th>
								<th>작성일</th>
								<th>작성자 유저번호</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<%-- DAO를 이용하여 댓글 목록 가져오기 --%>
							<%
							CommentDAO dao = new CommentDAO();
							List<CommentDTO> comments = dao.getAllComments();

							for (CommentDTO comment : comments) {
							%>
							<tr>
								<td><%=comment.getCommentId()%></td>
								<td><a href="../fesview.do?idx=<%=comment.getIdx()%>"><%=comment.getIdx()%></a></td>


								<td><%=comment.getWriter()%></td>
								<td><%=comment.getContent()%></td>
								<td><%=comment.getCreatedAt()%></td>
								<td><%=comment.getWriternum()%></td>
								<td>
									<form
										action="${pageContext.request.contextPath}/admindelete.do"
										method="post">
										<input type="hidden" name="id"
											value="<%=comment.getCommentId()%>">
										<button type="submit" class="delete-btn">삭제</button>
									</form>

								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<!-- 푸터 -->
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2020</span>
							<!-- 저작권 정보 -->
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
			class="fas fa-angle-up"></i> <!-- 스크롤 상단 이동 버튼 -->
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<!-- 로그아웃 모달 -->
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<!-- 모달 제목 -->
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
							<!-- 닫기 버튼 -->
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<!-- 모달 본문 -->
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<!-- 취소 버튼 -->
						<a class="btn btn-primary" href="login.jsp">Logout</a>
						<!-- 로그아웃 버튼 -->
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<!-- jQuery -->
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- 부트스트랩 번들 -->

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- jQuery 이징 플러그인 -->

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin-2.min.js"></script>
		<!-- 커스텀 스크립트 -->
</body>

</html>
