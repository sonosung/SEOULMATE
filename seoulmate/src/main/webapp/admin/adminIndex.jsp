<%@ page import="seoulmate.membership.MemberDTO" %>
<%@ page import="seoulmate.membership.MemberDAO" %>
<%@ page import="seoulmate.board.BoardDAO, seoulmate.board.BoardDTO" %>
<%@ page import="seoulmate.board.UserBoardDAO, seoulmate.board.UserBoardDTO" %>
<%@ page import="seoulmate.boardcomment.CommentDAO, seoulmate.boardcomment.CommentDTO" %>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--관리자페이지-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="./resources/assets/img/user/seungho.jpg" />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .chart-area canvas {
            -webkit-box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

        .card-large,
        .twocard-large {
            width: 48%;
            height: auto;
            display: inline-block;
            margin-bottom: 1rem;
            vertical-align: top;
        }

        .card-large + .twocard-large {
            margin-left: 0.5cm;
        }

        .comments {
            height: 400px;
            overflow-y: scroll;
        }
    </style>
</head>

<body id="page-top">
    <% 
        // 현재 세션에서 사용자 정보를 가져옴
        MemberDTO user = (MemberDTO) session.getAttribute("user"); 
        
        // 데이터 접근 객체 생성
        BoardDAO dao = new BoardDAO();
        UserBoardDAO userBoardDao = new UserBoardDAO();
        CommentDAO commentDao = new CommentDAO();
        Gson gson = new Gson();
        
        // 월별 축제 수 데이터를 가져와서 JSON 형식으로 변환
        Map<String, Integer> festivalCount = dao.getFestivalCountByMonth();
        String festivalCountJson = gson.toJson(festivalCount);
        
        // 추천된 축제 목록 데이터를 가져와서 JSON 형식으로 변환
        List<BoardDTO> recommendedFestivals = dao.getCurrentRecommendedFestivals();
        String recommendedFestivalsJson = gson.toJson(recommendedFestivals);
        
        // 방문한 축제 목록 데이터를 가져와서 JSON 형식으로 변환
        List<BoardDTO> visitedFestivals = dao.getCurrentVisitedFestivals();
        String visitedFestivalsJson = gson.toJson(visitedFestivals);

        // 유저 게시글 수 데이터
        Map<String, Integer> userBoardCount = userBoardDao.getUserBoardCountByMonth();
        String userBoardCountJson = gson.toJson(userBoardCount);

/*         // 조회수 상위 3개의 글
        List<UserBoardDTO> topVisitedPosts = userBoardDao.getTopVisitedPosts();
        
        // 추천수 상위 3개의 글
        List<UserBoardDTO> topLikedPosts = userBoardDao.getTopLikedPosts();

        // 실시간 댓글 데이터
        List<CommentDTO> recentComments = commentDao.getAllComments(); */
    %>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <jsp:include page="sidebar.jsp"></jsp:include>
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
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Area Chart 1 -->
                        <div class="card shadow mb-4 card-large">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">축제게시물 현황</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                        aria-labelledby="dropdownMenuLink">                                            
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <!-- 드롭다운 항목 - 월별 행사 수 차트를 표시 -->
                                        <a class="dropdown-item" href="#" onclick="showChart(1)">월별 행사 수</a>
                                        <!-- 드롭다운 항목 - 추천 수 차트를 표시 -->
                                        <a class="dropdown-item" href="#" onclick="showChart(2)">추천 수</a>
                                        <!-- 드롭다운 항목 - 조회 수 차트를 표시 -->
                                        <a class="dropdown-item" href="#" onclick="showChart(3)">조회 수</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- 차트를 그릴 영역 -->
                                <div id="chart-title" class="text-center font-weight-bold mb-2"></div> <!-- 차트 제목 표시할 영역 -->
                                <div class="chart-area" style="height: 400px; width: 100%;">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                                <%-- Chart.js 플러그인 로드 --%>
                                <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
                                <script>
                                    var festivalCountData = <%= festivalCountJson %>;
                                    var recommendedFestivalsData = <%= recommendedFestivalsJson %>;
                                    var visitedFestivalsData = <%= visitedFestivalsJson %>;
                                    var userBoardCountData = <%= userBoardCountJson %>;
                                    var myChart; // 차트 객체를 전역 변수로 선언

                                    function showChart(type) {
                                        let chartData;
                                        let labels = [];
                                        let values = [];
                                        let chartTitle = '';

                                        if (type === 1) {
                                            chartTitle = '월별 행사 수';
                                            chartData = festivalCountData;
                                            for (let month in chartData) {
                                                labels.push(month);
                                                values.push(chartData[month]);
                                            }
                                            // 월을 기준으로 오름차순으로 정렬
                                            labels.sort();
                                            values = labels.map(label => chartData[label]);
                                        } else if (type === 2) {
                                            chartTitle = '추천 수';
                                            chartData = recommendedFestivalsData;
                                            chartData.forEach(item => {
                                                labels.push(item.fesname);
                                                values.push(item.likecount);
                                            });
                                        } else if (type === 3) {
                                            chartTitle = '조회 수';
                                            chartData = visitedFestivalsData;
                                            chartData.forEach(item => {
                                                labels.push(item.fesname);
                                                values.push(item.visitcount);
                                            });
                                        }
                                        if (myChart) {
                                            myChart.destroy(); // 기존 차트를 파괴
                                        }

                                        document.getElementById('chart-title').innerText = chartTitle; // 차트 제목 업데이트

                                        let ctx = document.getElementById("myAreaChart").getContext('2d');
                                        myChart = new Chart(ctx, {
                                            type: 'bar', // 막대 차트 유형
                                            data: {
                                                labels: labels,
                                                datasets: [{
                                                    label: chartTitle,
                                                    data: values,
                                                    backgroundColor: 'rgba(78, 115, 223, 0.5)',
                                                    borderColor: 'rgba(78, 115, 223, 1)',
                                                    borderWidth: 1,
                                                    barThickness: 30, // 막대의 두께를 지정
                                                    maxBarThickness: 35, // 막대의 최대 두께를 지정
                                                    minBarLength: 10 // 막대의 최소 길이를 지정
                                                }]
                                            },
                                            options: {
                                                responsive: true,
                                                maintainAspectRatio: false, // 차트의 종횡비를 유지하지 않음
                                                scales: {
                                                    xAxes: [{
                                                        barPercentage: 0.5, // 막대 폭 조정
                                                        categoryPercentage: 0.5 // 카테고리 폭 조정
                                                    }],
                                                    yAxes: [{
                                                        ticks: {
                                                            beginAtZero: true
                                                        }
                                                    }]
                                                },
                                                legend: {
                                                    display: false
                                                },
                                                tooltips: {
                                                    backgroundColor: "rgb(255,255,255)",
                                                    bodyFontColor: "#858796",
                                                    titleMarginBottom: 10,
                                                    titleFontColor: '#6e707e',
                                                    titleFontSize: 14,
                                                    borderColor: '#dddfeb',
                                                    borderWidth: 1,
                                                    xPadding: 15,
                                                    yPadding: 15,
                                                    displayColors: false,
                                                    caretPadding: 10,
                                                },
                                                plugins: {
                                                    datalabels: {
                                                        color: '#fff',
                                                        anchor: 'end',
                                                        align: 'end',
                                                        formatter: function(value, context) {
                                                            return value;
                                                        }
                                                    }
                                                }
                                            }
                                        });
                                    }

                                    document.addEventListener('DOMContentLoaded', function() {
                                        showChart(1); // 페이지 로드 시 1번 차트를 기본으로 표시
                                    });
                                </script>
                            </div>
                        </div>
                               <!-- 유저게시물 현황 -->
							<div class="card shadow mb-4 twocard-large">
							    <!-- Card Header -->
							    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							        <h6 class="m-0 font-weight-bold text-primary">유저게시물 현황</h6>
							    </div>
							    <div class="card-body">
							        <!-- 차트를 그릴 영역 -->
							        <div id="user-chart-title" class="text-center font-weight-bold mb-2">월별 유저게시물 수</div>
							        <div class="chart-area" style="height: 400px; width: 100%;">
							            <canvas id="userBoardChart"></canvas>
							        </div>
							        <%-- Chart.js 플러그인 로드 --%>
							        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
							        <script>
							            <%-- var userBoardChart; // 유저 게시물 차트 객체 전역 변수로 선언
							
							            function showUserBoardChart() {
							                let chartData = <%= userBoardCountJson %>;
							                let labels = [];
							                let values = [];
							                let chartTitle = '월별 유저게시물 수';
							
							                for (let month in chartData) {
							                    labels.push(month);
							                    values.push(chartData[month]);
							                }
							
							                if (userBoardChart) {
							                    userBoardChart.destroy(); // 기존 차트를 파괴
							                } --%>
							                
							                var userBoardChart; // 유저 게시물 차트 객체 전역 변수로 선언

							                function showUserBoardChart() {
							                    let chartData = <%= userBoardCountJson %>;
							                    let labels = [];
							                    let values = [];
							                    let chartTitle = '월별 유저게시물 수';

							                    for (let month in chartData) {
							                        labels.push(month);
							                        values.push(chartData[month]);
							                    }

							                    // 월을 기준으로 오름차순으로 정렬
							                    labels.sort();
							                    values = labels.map(label => chartData[label]);

							                    if (userBoardChart) {
							                        userBoardChart.destroy(); // 기존 차트를 파괴
							                    }
							
							                document.getElementById('user-chart-title').innerText = chartTitle; // 차트 제목 업데이트
							
							                let ctx = document.getElementById("userBoardChart").getContext('2d');
							                userBoardChart = new Chart(ctx, {
							                    type: 'bar', // 막대 차트 유형
							                    data: {
							                        labels: labels,
							                        datasets: [{
							                            label: chartTitle,
							                            data: values,
							                            backgroundColor: 'rgba(78, 115, 223, 0.5)',
							                            borderColor: 'rgba(78, 115, 223, 1)',
							                            borderWidth: 1,
							                            barThickness: 30, // 막대의 두께를 지정
							                            maxBarThickness: 35, // 막대의 최대 두께를 지정
							                            minBarLength: 10 // 막대의 최소 길이를 지정
							                        }]
							                    },
							                    options: {
							                        responsive: true,
							                        maintainAspectRatio: false, // 차트의 종횡비를 유지하지 않음
							                        scales: {
							                            xAxes: [{
							                                barPercentage: 0.5, // 막대 폭 조정
							                                categoryPercentage: 0.5 // 카테고리 폭 조정
							                            }],
							                            yAxes: [{
							                                ticks: {
							                                    beginAtZero: true
							                                }
							                            }]
							                        },
							                        legend: {
							                            display: false
							                        },
							                        tooltips: {
							                            backgroundColor: "rgb(255,255,255)",
							                            bodyFontColor: "#858796",
							                            titleMarginBottom: 10,
							                            titleFontColor: '#6e707e',
							                            titleFontSize: 14,
							                            borderColor: '#dddfeb',
							                            borderWidth: 1,
							                            xPadding: 15,
							                            yPadding: 15,
							                            displayColors: false,
							                            caretPadding: 10,
							                        },
							                        plugins: {
							                            datalabels: {
							                                color: '#fff',
							                                anchor: 'end',
							                                align: 'end',
							                                formatter: function(value, context) {
							                                    return value;
							                                }
							                            }
							                        }
							                    }
							                });
							            }
							
							            document.addEventListener('DOMContentLoaded', function() {
							                showUserBoardChart(); // 페이지 로드 시 차트를 표시
							            });
                                </script>
                            </div>
                        </div>
                    </div>

                    <%-- <!-- Top Visited Posts -->
                    <div class="row">
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">조회수 top3 유저게시물</h6>
                                </div>
                                <div class="card-body">
                                    <%
                                        for (UserBoardDTO post : topVisitedPosts) {
                                    %>
                                        <div class="post-item">
                                            <h5 class="font-weight-bold"><%= post.getTitle() %></h5>
                                            <p><%= post.getContent() %></p>
                                        </div>
                                        <hr>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>

                        <!-- Top Liked Posts -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">추천수 top3 유저게시물</h6>
                                </div>
                                <div class="card-body">
                                    <%
                                        for (UserBoardDTO post : topLikedPosts) {                                  
                                    %>
                                        <div class="post-item">
                                            <h5 class="font-weight-bold"><%= post.getTitle() %></h5>
                                            <p><%= post.getContent() %></p>
                                        </div>
                                        <hr>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 최근 댓글 표시 -->
                    <div class="row">
                        <div class="col-lg-12 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">유저 댓글 실시간</h6>
                                </div>
                                <div class="card-body comments">
                                    <%
                                        for (CommentDTO comment : recentComments) {
                                    %>
                                        <div class="comment-item">
                                            <h5 class="font-weight-bold"><%= comment.getWriter() %></h5>
                                            <p><%= comment.getContent() %></p>
                                            <small class="text-muted"><%= comment.getCreatedAt() %></small>
                                        </div>
                                        <hr>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>

                </div> --%>
                </div>
                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; TEAM_KEAM 2024</span>
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
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="./logout.jsp">Logout</a>
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

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>
    </div>
</body>

</html>