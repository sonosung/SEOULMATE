<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시글 작성 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
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
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#page-top">Seoul Mate</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu <i class="fas fa-bars"></i>
            </button>
        </div>
    </nav>

    <!-- Masthead-->
    <header class="masthead bg-black text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">게시글 작성</h1>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
            </div>
            <!-- Masthead Subheading-->
            <p class="masthead-subheading font-weight-light mb-0">Board Write Page</p>
        </div>
    </header>

    <div class="masthead bg-white text-black">
        <form name="writeFrm" method="post" enctype="multipart/form-data" action="feswrite.do" onsubmit="return validateForm(this);">
            <table>
                <tr class="masthead bg-secondary text-white">
                    <td colspan="3" align="center">
                        <h2></h2>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">카테고리</td>
                    <td colspan="2">
                        <select name="fescate" class="btn btn-secondary">
                            <option value="">카테고리</option>
                            <option value="together">친구와함께</option>
                            <option value="tradition">전통</option>
                            <option value="trip">나들이</option>
                            <option value="food">먹거리</option>
                            <option value="show">공연</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">행사명</td>
                    <td colspan="2"><input type="text" name="fesname" style="width: 90%;" /><br></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">메인 이미지</td>
                    <td colspan="2"><input type="file" name="mainimage" class="btn btn-secondary" /></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">행사 내용</td>
                    <td colspan="2"><textarea name="content" style="width: 90%; height: 500px;"></textarea></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">이미지 1</td>
                    <td colspan="2"><input type="file" name="secimage" class="btn btn-secondary" /></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">이미지 2</td>
                    <td colspan="2"><input type="file" name="thiimage" class="btn btn-secondary" /></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">행사 주소</td>
                    <td colspan="2"><input type="text" name="feslocation" style="width: 42%;" /></td>
                </tr>
                <tr>
                    <td align="center" class="bg-secondary text-white">행사 기간</td>
                    <td colspan="2">
                        <input type="date" name="fesstart" style="width: 20%;" class="btn btn-secondary" /> - 
                        <input type="date" name="fesend" style="width: 20%;" class="btn btn-secondary" />
                    </td>
                </tr>
                <tr class="masthead bg-secondary">
                    <td colspan="3" align="right">
                        <button type="submit" class="btn btn-secondary">작성 완료</button>
                        <button type="reset" class="btn btn-secondary">RESET</button>
                        <button type="button" class="btn btn-secondary" onclick="location.href='feslist.do';">목록 바로가기</button>
                    </td>
                </tr>
                <input type="hidden" name="boardType" value="0"> <!-- festival 타입을 0으로 설정 -->
            </table>
        </form>
    </div>

    <footer class="footer text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h4 class="text-uppercase mb-4">Location</h4>
                    <p class="lead mb-0">2215 John Daniel Drive <br /> Clark, MO 65243</p>
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

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
    <!-- SB Forms JS-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
