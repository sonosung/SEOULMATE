<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, seoulmate.board.BoardDAO, seoulmate.board.BoardDTO"%>
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
    .masthead {
        padding-top: 6rem;
        padding-bottom: 6rem;
    }

    @media ( min-width : 768px) {
        .masthead {
            padding-top: 8rem;
            padding-bottom: 2rem;
        }
    }

    .portfolio {
        margin-top: 4rem;
    }

    .portfolio .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
        margin: 10 -30px;
    }

    .portfolio-item {
        margin-bottom: 30px;
        flex: 0 1 calc(33.33% - 30px);
        box-sizing: border-box;
        padding: 0 15px;
        margin-left: 0.8cm;
    }

    @media ( max-width : 768px) {
        .portfolio-item {
            flex: 0 1 100%;
        }
    }

    .search-bar {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        flex-wrap: wrap;
        margin-top: -2rem;
        margin-bottom: -7rem;
    }

    .search-bar select, .search-bar input {
        flex: 1;
        min-width: 200px;
        text-align: center;
        position: relative;
    }

    .search-bar select::after, .search-bar input::after {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
    }

    .search-bar select option, .search-bar input::placeholder {
        text-align: center;
    }

    .search-bar button {
        height: 38px;
        min-width: 100px;
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
</style>
</head>
<body id="page-top">
    <jsp:include page="./MainLayoutElements/boardheader.jsp"></jsp:include>
    <jsp:include page="./MainLayoutElements/boardseoulmate.jsp"></jsp:include>

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
                    <input type="search" id="search-text" class="form-control me-2" placeholder="검색어를 입력해주세요.">
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
                    BoardDAO dao = new BoardDAO();
                    List<BoardDTO> festivals = dao.getFestivalList();
                    for (BoardDTO festival : festivals) {
                %>
                <div class="col-md-6 col-lg-4 mb-5 portfolio-item"
                    data-bs-toggle="modal" data-bs-target="#portfolioModal<%=festival.getIdx()%>"
                    data-start-date="<%=festival.getFesstart()%>" data-end-date="<%=festival.getFesend()%>"
                    data-month="<%=festival.getFesstart().substring(5, 7)%>"
                    data-category="<%=festival.getFescate()%>">
                    <a href="fesview.do?idx=<%=festival.getIdx()%>">
                        <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                            <div class="portfolio-item-caption-content text-center text-white">
                                <i class="fas fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img class="img-fluid" src="data:image/png;base64,<%=festival.getBase64MainImage()%>" alt="..." />
                        <h5 class="text-center" style="color: black; text-decoration: none;"><%=festival.getFesname()%></h5>
                        <p class="text-center" style="color: black; text-decoration: none;">
                            기간 <%=festival.getFesstart()%>~<%=festival.getFesend()%>
                        </p>
                        <p class="text-center" style="color: black; text-decoration: none;"><%=festival.getFeslocation()%></p>
                        <p class="text-center festival-status"></p>
                    </a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </section>

    <div class="button-container" id="festival">
        <a class="btn btn-primary small-button" href="./MainContent/index.jsp">
            <i class="fas fa-download me-2"></i>메인페이지
        </a>
        <a class="btn btn-primary small-button" href="userlist.do">
            <i class="fas fa-download me-2"></i>유저 공유 게시판
        </a>
        <c:set var="loggedInUser" value="${sessionScope.user}" />
        <td width="150" align="right">
            <c:if test="${loggedInUser != null and loggedInUser.USER_NUM < 5}">
                <a class="btn btn-primary small-button" href="fes_write.jsp">
                    <i class="fas fa-download me-2"></i>관리자 글쓰기
                </a>
            </c:if>
        </td>
    </div>

    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <!-- Footer Location-->
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">who made it?</h4>
                    <br>
                    <p class="lead mb-0">
                        문승호, 김별, 이진규, 안상환 <br />
                        <br />
                        Started from 2024.06.12 <br> to 2024.07.11
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
                        SEUOLMATE는<br>JSP & OracleDB 기반 팀 프로젝트입니다.<br>
                        <br>
                        MIT licensed Bootstrap theme<br>created by <a href="http://startbootstrap.com">Start Bootstrap</a>.
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <div class="copyright py-4 text-center text-white">
        <div class="container">
            <small>Copyright &copy; Your Website 2023</small>
        </div>
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
                    const today = new Date();
                    const aStartDate = new Date(a.getAttribute('data-start-date'));
                    const bStartDate = new Date(b.getAttribute('data-start-date'));
                    const aEndDate = new Date(a.getAttribute('data-end-date'));
                    const bEndDate = new Date(b.getAttribute('data-end-date'));
                    
                    const aStatus = (today >= aStartDate && today <= aEndDate) ? '개최중' : (today < aStartDate) ? '개최예정' : '종료';
                    const bStatus = (today >= bStartDate && today <= bEndDate) ? '개최중' : (today < bStartDate) ? '개최예정' : '종료';
                    
                    if (aStatus === bStatus) {
                        if (aStatus === '개최중') {
                            return aStartDate - bStartDate;
                        } else if (aStatus === '개최예정') {
                            return aStartDate - bStartDate;
                        } else {
                            return bEndDate - aEndDate;
                        }
                    }
                    return (aStatus === '개최중') ? -1 : (aStatus === '개최예정' && bStatus === '종료') ? -1 : 1;
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

            function initialSort() {
                const today = new Date();
                portfolioItems.sort((a, b) => {
                    const aStartDate = new Date(a.getAttribute('data-start-date'));
                    const bStartDate = new Date(b.getAttribute('data-start-date'));
                    const aEndDate = new Date(a.getAttribute('data-end-date'));
                    const bEndDate = new Date(b.getAttribute('data-end-date'));
                    
                    const aStatus = (today >= aStartDate && today <= aEndDate) ? '개최중' : (today < aStartDate) ? '개최예정' : '종료';
                    const bStatus = (today >= bStartDate && today <= bEndDate) ? '개최중' : (today < bStartDate) ? '개최예정' : '종료';
                    
                    if (aStatus === bStatus) {
                        if (aStatus === '개최중') {
                            return aStartDate - bStartDate;
                        } else if (aStatus === '개최예정') {
                            return aStartDate - bStartDate;
                        } else {
                            return bEndDate - aEndDate;
                        }
                    }
                    return (aStatus === '개최중') ? -1 : (aStatus === '개최예정' && bStatus === '종료') ? -1 : 1;
                });

                generateHTML(portfolioItems);
            }

            searchButton.addEventListener('click', filterItems);
            resetButton.addEventListener('click', resetFilters);
            portfolioItems.forEach(updateFestivalStatus);
            initialSort(); // Sort the items initially when the page loads
        });
    </script>
</body>
</html>
