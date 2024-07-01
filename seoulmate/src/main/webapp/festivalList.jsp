<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.InputStream, java.util.Base64" %> <!-- 필요한 클래스 임포트 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SEOULMATE</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="./resources/css/styles.css" rel="stylesheet" />
    <style>

        /* 내장 스타일 정의 */
        .masthead { padding-top: 6rem; padding-bottom: 6rem; }
        @media (min-width: 768px) {
            .masthead { padding-top: 8rem; padding-bottom: 2rem; }
        }
        .portfolio { margin-top: 4rem; }
        .portfolio .row { display: flex; flex-wrap: wrap; justify-content: flex-start; margin: 10 -30px; }
        .portfolio-item { margin-bottom: 30px; flex: 0 1 calc(33.33% - 30px); box-sizing: border-box; padding: 0 15px; margin-left: 0.8cm; }
        @media (max-width: 768px) { .portfolio-item { flex: 0 1 100%; } }
        .search-bar { display: flex; align-items: center; justify-content: center; gap: 10px; flex-wrap: wrap; margin-top: -2rem; margin-bottom: -7rem; }
        .search-bar select, .search-bar input { flex: 1; min-width: 200px; }
        .search-bar button { height: 38px; min-width: 100px; }
        
         .button-container {
        text-align: center; /* 버튼들을 가운데 정렬 */
        margin-top: 20px; /* 상단 여백 추가 */
        margin-bottom: 60px; /* 하단 여백 추가 */
    }
    .small-button {
        width: 250px; /* 버튼의 너비 설정 */
        padding: 10px 15px; /* 상하, 좌우 패딩 */
        border-radius: 15px; /* 둥근 모서리 */
        margin-right: 10px; /* 오른쪽 여백 추가 */
    }
    .small-button:last-child {
        margin-right: 0; /* 마지막 버튼 오른쪽 여백 제거 */
    }

    /* 링크 스타일 변경 */
    a {
        text-decoration: none;
        color: black;
    }

    /* 링크 호버 스타일 */
    a:hover {
        text-decoration: none;
        color: black;
    }

    /* 텍스트 스타일 */
    .portfolio-item h5, .portfolio-item p {
        color: black;
        text-decoration: none;
    }
    
    </style>
</head>
<body id="page-top">
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#page-top">SEOULMATE</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">행사정보</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="masthead bg-primary text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <img class="masthead-avatar mb-5" src="./resources/assets/img/mainicon.png" alt="..." />
            <h1 class="masthead-heading text-uppercase mb-0">SEOULMATE</h1>
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <p class="masthead-subheading font-weight-light mb-0">너와 나의 SEOULMATE!</p>
        </div>
    </header>
    <section class="page-section search-bar" id="search">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 search-bar">
                    <select id="day" class="form-control">
                        <option value="">기간</option>
                        <option value="A">개최중</option>
                        <option value="B">개최예정</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <select id="category" class="form-control">
                        <option value="">카테고리</option>
                        <option value="together">친구와함께</option>
                        <option value="tradition">전통</option>
                        <option value="trip">나들이</option>
                        <option value="food">먹거리</option>
                        <option value="show">공연</option>
                    </select>
                    <input type="search" id="search-text" class="form-control me-2" placeholder="검색">
                    <button id="search-btn" class="btn btn-primary">검색</button>
                    <button id="reset-btn" class="btn btn-secondary">리셋</button>
                </div>
            </div>
        </div>
    </section>
    <section class="page-section portfolio" id="portfolio">
        <div class="container">
          <div class="row">
    <% 
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String url = "jdbc:oracle:thin:@14.42.124.21:1521:xe"; // DB 연결 URL
            String user = "C##KEAM"; // DB 사용자 이름
            String password = "1234"; // DB 비밀번호
            Class.forName("oracle.jdbc.driver.OracleDriver"); // Oracle 드라이버 로드
            conn = DriverManager.getConnection(url, user, password); // DB 연결
            String sql = "SELECT IDX, TITLE, FESCATE, FESNAME, FESLOCATION, FESSTART, FESEND, MAINIMAGE FROM BOARD WHERE MAINIMAGE IS NOT NULL";
            pstmt = conn.prepareStatement(sql); // SQL 쿼리 준비
            rs = pstmt.executeQuery(); // SQL 쿼리 실행
            while (rs.next()) { // 결과셋에서 데이터 읽기
                int idx = rs.getInt("IDX");
                String title = rs.getString("TITLE");
                String fescate = rs.getString("FESCATE");
                String fesname = rs.getString("FESNAME");
                String feslocation = rs.getString("FESLOCATION");
                String fesstart = rs.getString("FESSTART");
                String fesend = rs.getString("FESEND");
                Blob mainimage = rs.getBlob("MAINIMAGE");
                InputStream imgStream = mainimage.getBinaryStream();
                byte[] imgBytes = imgStream.readAllBytes();
                String imgBase64 = java.util.Base64.getEncoder().encodeToString(imgBytes);
    %>
    <div class="col-md-6 col-lg-4 mb-5 portfolio-item" data-bs-toggle="modal" data-bs-target="#portfolioModal<%=idx%>" data-start-date="<%=fesstart%>" data-end-date="<%=fesend%>" data-month="<%=fesstart.substring(5, 7)%>" data-category="<%=fescate%>">
        <a href="fesview.do?idx=<%=idx%>">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid" src="data:image/png;base64,<%=imgBase64%>" alt="..." />
            <h5 class="text-center" style="color: black; text-decoration: none;"><%=fesname%></h5>
            <p class="text-center" style="color: black; text-decoration: none;">기간 <%=fesstart%>~<%=fesend%></p>
            <p class="text-center" style="color: black; text-decoration: none;"><%=feslocation%></p>
            <p class="text-center festival-status"></p>
        </a>
    </div>
    <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</div>
        </div>
    </section>

    <div class="button-container">
    <a class="btn btn-primary small-button" href="list.do">
        <i class="fas fa-download me-2"></i>메인페이지
    </a>
    <a class="btn btn-primary small-button" href="list.do">
        <i class="fas fa-download me-2"></i>유저 공유 게시판
    </a>
    <a class="btn btn-primary small-button" href="fes_write.jsp">
        <i class="fas fa-download me-2"></i>관리자 글쓰기
    </a>
</div>

    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Location</h4>
                    <p class="lead mb-0">2215 John Daniel Drive<br>Clark, MO 65243</p>
                </div>
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Around the Web</h4>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                    <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                </div>
                <div class="col-lg-4">
                    <h4 class="text-uppercase mb-4">About Freelancer</h4>
                    <p class="lead mb-0">Freelance is a free to use, MIT licensed Bootstrap theme created by <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
                </div>
            </div>
        </div>
    </footer>
    <div class="copyright py-4 text-center text-white">
        <div class="container"><small>Copyright &copy; Your Website 2023</small></div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const selectDay = document.getElementById('day');
            const selectCategory = document.getElementById('category');
            const searchText = document.getElementById('search-text');
            const searchButton = document.getElementById('search-btn');
            const resetButton = document.getElementById('reset-btn');
            const portfolioContainer = document.querySelector('.portfolio .row');
            const portfolioItems = Array.from(document.querySelectorAll('.portfolio-item'));

            function generateHTML(items) {
                portfolioContainer.innerHTML = '';
                items.forEach(item => {
                    portfolioContainer.appendChild(item);
                });
            }

            function updateFestivalStatus(item) {
                const today = new Date();
                const itemStartDate = new Date(item.getAttribute('data-start-date'));
                const itemEndDate = new Date(item.getAttribute('data-end-date'));
                const statusElement = item.querySelector('.festival-status');

                if (today >= itemStartDate && today <= itemEndDate) {
                    statusElement.textContent = '개최중';
                    statusElement.style.color = 'green';
                    statusElement.style.fontSize = '20px';
                } else if (today < itemStartDate) {
                    statusElement.textContent = '개최예정';
                    statusElement.style.color = 'blue';
                    statusElement.style.fontSize = '20px';
                } else {
                    statusElement.textContent = '종료';
                    statusElement.style.color = 'red';
                    statusElement.style.fontSize = '20px';
                }
            }

            function filterItems() {
                const selectedMonth = selectDay.value;
                const selectedCategory = selectCategory.value;
                const searchTextValue = searchText.value.toLowerCase();
                const today = new Date();
                let visibleItems = [];

                portfolioItems.forEach(item => {
                    const itemMonth = item.getAttribute('data-month');
                    const itemCategory = item.getAttribute('data-category');
                    const itemName = item.querySelector('h5').textContent.toLowerCase();
                    const itemStartDate = new Date(item.getAttribute('data-start-date'));
                    const itemEndDate = new Date(item.getAttribute('data-end-date'));

                    let display = (searchTextValue === "" || itemName.includes(searchTextValue)) &&
                                  (selectedMonth === "" || itemMonth === selectedMonth || 
                                   (selectedMonth === "A" && itemStartDate <= today && itemEndDate >= today) ||
                                   (selectedMonth === "B" && itemStartDate > today)) &&
                                  (selectedCategory === "" || itemCategory === selectedCategory);

                    if (display) {
                        visibleItems.push(item);
                        updateFestivalStatus(item);
                    }
                });

                visibleItems.sort((a, b) => {
                    const aTarget = a.getAttribute('data-bs-target');
                    const bTarget = b.getAttribute('data-bs-target');
                    return aTarget.localeCompare(bTarget);
                });

                generateHTML(visibleItems);
            }

            function resetFilters() {
                selectDay.value = "";
                selectCategory.value = "";
                searchText.value = "";
                portfolioItems.forEach(updateFestivalStatus);
                generateHTML(portfolioItems);
            }

            searchButton.addEventListener('click', filterItems);
            resetButton.addEventListener('click', resetFilters);
            portfolioItems.forEach(updateFestivalStatus);
            generateHTML(portfolioItems);
        });
    </script>
</body>
</html>
