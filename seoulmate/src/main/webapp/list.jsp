<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%-- 유저정보게시판 리스트 입니다 --%>
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
    .search-bar {
        margin-top: 20px;
        margin-bottom: 15px;
    }
    .filter-select {
        margin-top: 20px;
        margin-bottom: 17px;
    }
    .filter-select select {
        width: 50%; /* 선택 상자의 전체 너비 지정 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    .filter-select option {
        text-align: center; /* 옵션 텍스트 가운데 정렬 */
    }
    .filter-search-bar {
        width: 30%; /* 검색창의 전체 너비 지정 */
        margin-left: -4.5cm; /* 필터와 검색창 사이의 간격 조정 */
    }
    .search-bar .form-control {
        width: 100px; /* 검색 입력 필드의 가로 길이 조정 */
    }
    .title-link {
        color: inherit; /* 기본 색상 유지 */
        text-decoration: none; /* 밑줄 제거 */
        display: flex;
        align-items: center; /* 수직 정렬 */
    }
    .title-link img {
        margin-right: 10px; /* 이미지 오른쪽 여백 조정 */
        max-width: 60px; /* 이미지 최대 너비 제한 */
        max-height: 40px; /* 이미지 최대 높이 제한 추가 */
    }
    .search-bar-container {
        display: flex;
        align-items: center;
    }
    .input-group .btn {
        margin-left: 5px; /* 검색 버튼과 입력 필드 사이의 간격 조정 */
    }
    /* 글씨 크기를 17px로 조정 */
    .table {
        font-size: 17px;
    }
    /* 이미지와 텍스트 수직 정렬 맞추기 */
    .title-link img {
        vertical-align: middle;
    }
    .title-link span {
        display: inline-block;
        vertical-align: middle;
    }
    .button-container { text-align: center; margin-top: 20px; margin-bottom: 60px; }
        .small-button { width: 250px; padding: 10px 15px; border-radius: 15px; margin-right: 10px; }
        .small-button:last-child { margin-right: 0; }
        a { text-decoration: none; color: black; }
        a:hover { text-decoration: none; color: black; }
        .portfolio-item h5, .portfolio-item p { color: black; text-decoration: none; }
    </style>
</head>
<body id="page-top">
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="./MainContent/index.jsp">SEOULMATE</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">유저공유게시판</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#festival">게시판</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="./admin/login.jsp" id="Login">Login</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="./admin/register.jsp" id="SignIn">SignIn</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- <header class="masthead bg-black text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <h1 class="masthead-heading text-uppercase mb-0">SEOULMATE</h1>
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                </div>
                <div class="divider-custom-line"></div>
            </div>
            <p class="masthead-subheading font-weight-light mb-0">UserBoard - View</p>
        </div>
    </header> -->
    
    <jsp:include page="./MainLayoutElements/boardseoulmate.jsp"></jsp:include>

    <section class="page-section" id="portfolio">
        <div class="container">
            <h1 class="text-center text-uppercase text-secondary mb-0 section-space">[유저] 축제 공유 게시글 리스트</h1>
            <div class="row justify-content-center search-bar-container">
                <div class="col-md-3 filter-select">
                    <form method="get" action="userlist.do">
                        <select class="form-select" name="searchField">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="name">작성자</option>
                        </select>
                </div>
                <div class="col-md-6 filter-search-bar">
                        <div class="input-group">
                            <input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요" aria-describedby="button-addon2">
                            <button class="btn btn-primary" type="submit" id="button-addon2">검색하기</button>
                        </div>
                    </form>
                </div>
            </div>
            <table class="table table-bordered table-striped mt-4">
                <thead>
                    <tr>
                        <th class="text-center" width="5%">번호</th>
                        <th class="text-center" width="10%">카테고리</th>
                        <th class="text-center" width="*">제목</th>
                        <th class="text-center" width="10%">작성자</th>
                        <th class="text-center" width="10%">조회수</th>
                        <th class="text-center" width="10%">추천수</th>
                        <th class="text-center" width="10%">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty boardLists}">
                            <tr>
                                <td colspan="7" align="center">등록된 게시물이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${boardLists}" var="row" varStatus="loop">
                                <tr>
                                    <td class="text-center">${row.idx}</td>
                                    <td class="text-center">${row.fescate}</td>
                                    <td align="left">
                                        <a href="view.do?idx=${row.idx}" class="title-link">
                                            <c:if test="${not empty row.base64MainImage}">
                                                <img src="data:image/jpeg;base64,${row.base64MainImage}" alt="메인 이미지" />
                                            </c:if>
                                            ${row.title}
                                        </a>
                                    </td>
                                    <td class="text-center">${row.name}</td>
                                    <td class="text-center">${row.visitcount}</td>
                                    <td class="text-center">${row.likecount}</td>
                                    <td class="text-center">${row.postdate}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <div class="d-flex justify-content-between mt-4">
                <div>
                    <c:forEach begin="1" end="${map.totalPages}" varStatus="i">
                        <a href="userlist.do?pageNum=${i.index}">${i.index}</a>
                    </c:forEach>
                </div>
                <table class="table table-bordered" border="1" width="100%">
                    <tr align="center">
                        <td>${map.pagingImg}</td>
                        <td width="100" align="right">
                            <button type="button" class="btn btn-secondary" onclick="location.href='write.jsp';">글쓰기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    
    <div class="button-container" id="festival">
    <a class="btn btn-primary small-button" href="./MainContent/index.jsp">
        <i class="fas fa-download me-2"></i>메인페이지
    </a>
    <a class="btn btn-primary small-button" href="feslist.do">
        <i class="fas fa-download me-2"></i>축제 정보 게시판
    </a>
</div>

    <footer class="footer text-center">
	<div class="container">
		<div class="row">
			<!-- Footer Location-->
			<div class="col-lg-4 mb-5 mb-lg-0">
				<h4 class="text-uppercase mb-4">who made it?</h4>
				<br>
				<p class="lead mb-0">
					문승호, 김별, 이진규, 안상환 
					<br /> 
					<br /> 
					Started from 2024.06.12
					<br>
					to 2024.07.11
				</p>
			</div>
			<!-- Footer Social Icons-->
			<div class="col-lg-4 mb-5 mb-lg-0">
				<h4 class="text-uppercase mb-4">visit our github</h4>
					<br> 
				<a class="btn btn-outline-light btn-social mx-1" href="https://github.com/byeol1286">
					<i class="fab fa-fw fa-facebook-f"></i>
				</a>
				
				<a class="btn btn-outline-light btn-social mx-1" href="https://github.com/GOTERCODE">
					<i class="fab fa-fw fa-twitter"></i>
				</a> 
				
				<a class="btn btn-outline-light btn-social mx-1" href="https://github.com/poong1125">
					<i class="fab fa-fw fa-linkedin-in"></i>
				</a> 
				
				<a class="btn btn-outline-light btn-social mx-1" href="https://github.com/sonosung">
					<i class="fab fa-fw fa-dribbble"></i>
				</a>
			</div>
			<!-- Footer About Text--->
			<div class="col-lg-4">
				<h4 class="text-uppercase mb-4">About Us</h4>
				<p class="lead mb-0">
					SEUOLMATE는<br>JSP & OracleDB 기반 팀 프로젝트입니다.<br> <br>
					MIT licensed Bootstrap theme<br>created by <a
						href="http://startbootstrap.com">Start Bootstrap</a> .
				</p>
			</div>
		</div>
	</div>
</footer>
    <div class="copyright py-4 text-center text-white">
        <div class="container">
            <small>&copy; Your Website 2023</small>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./resources/js/scripts.js"></script>
</body>
</html>