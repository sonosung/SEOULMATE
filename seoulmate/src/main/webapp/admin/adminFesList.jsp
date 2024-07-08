<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, seoulmate.board.BoardDAO, seoulmate.board.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 목록 페이지</title>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version) -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="./resources/css/styles.css" rel="stylesheet" />
<style>
.table {
	font-size: 17px;
}

.title-link {
	color: inherit;
	text-decoration: none;
	display: flex;
	align-items: center;
}

.title-link img {
	margin-right: 10px;
	max-width: 60px;
	max-height: 40px;
}

.title-link span {
	display: inline-block;
	vertical-align: middle;
}

.button-container {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 60px;
}

.small-button {
	width: 250px;
	padding: 10px 15px;
	border-radius: 15px;
	margin-right: 10px;
}

.small-button:last-child {
	margin-right: 0;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.portfolio-item h5, .portfolio-item p {
	color: black;
	text-decoration: none;
}

.card-large {
    width: 90%; /* 카드의 너비를 90%로 설정 */
    height: auto; /* 높이를 자동으로 설정 */
}

.card-body-large {
    min-height: 300px; /* 카드 본문의 최소 높이를 300px로 설정 */
}
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper"> <!-- 페이지 전체를 감싸는 래퍼 -->

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"> <!-- 사이드바 시작 -->
        
            <jsp:include page="sidebar.jsp"></jsp:include> <!-- 사이드바를 외부 파일로 포함 -->
            
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column"> <!-- 콘텐츠 래퍼 -->

            <!-- Main Content -->
            <div id="content"> <!-- 메인 콘텐츠 영역 -->

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"> <!-- 상단 네비게이션 바 -->

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3"> <!-- 사이드바 토글 버튼 (모바일용) -->
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto"> <!-- 상단 네비게이션 바의 오른쪽 영역 -->

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1"> <!-- 알림 드롭다운 -->
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i> <!-- 알림 아이콘 -->
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span> <!-- 알림 배지 -->
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 알림 항목 -->
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 알림 항목 -->
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 알림 항목 -->
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a> <!-- 모든 알림 보기 -->
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1"> <!-- 메시지 드롭다운 -->
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i> <!-- 메시지 아이콘 -->
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span> <!-- 메시지 배지 -->
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 메시지 항목 -->
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 메시지 항목 -->
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 메시지 항목 -->
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#"> <!-- 메시지 항목 -->
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a> <!-- 모든 메시지 보기 -->
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div> <!-- 상단 네비게이션 바의 구분선 -->

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow"> <!-- 사용자 정보 드롭다운 -->
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span> <!-- 사용자 이름 -->
                                <img class="img-profile rounded-circle" src="img/undraw_profile.svg"> <!-- 사용자 프로필 이미지 -->
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile <!-- 프로필 -->
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings <!-- 설정 -->
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log <!-- 활동 로그 -->
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout <!-- 로그아웃 -->
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">축제정보게시판 현황</h1>

                    <div class="row">

                        <div class="col-lg-12">

                            <!-- Circle Buttons -->
                            <div class="card shadow mb-4 card-large"> <!-- 카드 크기를 키우기 위해 card-large 클래스 추가 -->
                                <div class="card-header py-3">
                                    <h5 class="m-0 font-weight-bold text-primary">축제정보게시판</h5> <!-- 카드 제목 -->
                                </div>
                                <div class="card-body card-body-large"> <!-- 카드 본문의 크기를 키우기 위해 card-body-large 클래스 추가 -->
                                <table class="table table-bordered table-hover mt-4">
                                <%
            // DAO를 호출하여 게시글 목록을 가져오는 부분
            BoardDAO dao = new BoardDAO();
            Map<String, Object> paramMap = new HashMap<>();
            paramMap.put("start", 1);
            paramMap.put("end", 10);
            List<BoardDTO> boardLists = dao.selectListPage(paramMap);
            request.setAttribute("boardLists", boardLists);
        %>
				<thead class="thead-light">
					<tr>
						<th class="text-center" width="10%">번호</th>
						<th class="text-center" width="*">제목</th>
						<th class="text-center" width="10%">조회수</th>
						<th class="text-center" width="10%">추천수</th>
						<th class="text-center" width="15%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardLists}">
							<tr>
								<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardLists}" var="row" varStatus="loop">
								<tr>
									<td class="text-center">${fn:length(boardLists) - loop.index}</td>
									<td><a href="../fesview.do?idx=${row.idx}" class="title-link">${row.fesname}</a></td>
									<td class="text-center">${row.visitcount}</td>
									<td class="text-center">${row.likecount}</td>
									<td class="text-center">${row.postdate}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
                                </div>
                            </div>
			                </div>
			                </div>
			                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white"> <!-- 푸터 -->
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span> <!-- 저작권 정보 -->
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i> <!-- 스크롤 상단 이동 버튼 -->
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> <!-- 로그아웃 모달 -->
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5> <!-- 모달 제목 -->
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span> <!-- 닫기 버튼 -->
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div> <!-- 모달 본문 -->
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button> <!-- 취소 버튼 -->
                    <a class="btn btn-primary" href="login.jsp">Logout</a> <!-- 로그아웃 버튼 -->
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script> <!-- jQuery -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> <!-- 부트스트랩 번들 -->

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script> <!-- jQuery 이징 플러그인 -->

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script> <!-- 커스텀 스크립트 -->

</body>

</html>
