<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 게시판</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<h2>회원 목록 보기(List)</h2>
	
	<!-- 검색 폼 -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
		</tr>
	</table>
	</form>
	
	<!-- 목록 테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
<c:choose>
	<c:when test="${ empty boardLists }"> <!-- 게시물이 없을 때 -->
	<tr>
		<td colspan="6" align="center">
			등록된 게시물이 없습니다.
		</td>
	</tr>		
	</c:when>
	<c:otherwise> <!-- 게시물이 있을 때 -->
		<c:forEach items="${ boardLists }" var="row" varStatus="loop">
		<tr align="center">
			<td> <!-- 번호 -->
				${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
			</td>
			<td align="left"> <!-- 제목(링크) -->
				<a href="../mvcboard/view.do?idx=${ row.idx }">${ row.title }</a>
			</td>
			<td>${ row.name }</td>
			<td>${ row.visitcount }</td>
			<td>${ row.postdate }</td>
			<td> <!-- 첨부 파일 -->
			<c:if test="${ not empty row.ofile }">
				<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
				</c:if>
			</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
	</table>
	
	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
		<td>
			${ map.pagingImg }
		</td>
			<td width="100">
				<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>





 --%>
<%--     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 게시판</title>
<style>a{text-decoration:none;}</style>
</head>
<body> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Border Utilities</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

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
                
                
<h2>회원 목록 보기(List)</h2>
	
	<!-- 검색 폼 -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="USER_ID">아이디</option>
				<option value="USERNAME">이름</option>
				<option value="EMAIL">이메일</option>
				<option value="PHONENUM">전화번호</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
		</tr>
	</table>
	</form>
	
	<!-- 목록 테이블 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="15%">아이디</th>
			<th width="20%">이름</th>
			<th width="25%">이메일</th>
			<th width="15%">전화번호</th>
			<th width="15%">주소</th>
		</tr>
<c:choose>
	<c:when test="${ empty boardLists }"> <!-- 게시물이 없을 때 -->
	<tr>
		<td colspan="6" align="center">
			등록된 회원이 없습니다.
		</td>
	</tr>		
	</c:when>
	<c:otherwise> <!-- 게시물이 있을 때 -->
		<c:forEach items="${ boardLists }" var="row" varStatus="loop">
		<tr align="center">
			<td> <!-- 번호 -->
				${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
			</td>
			<td> <!-- 아이디 -->
				${ row.USER_ID }
			</td>
			<td> <!-- 이름 -->
				${ row.USERNAME }
			</td>
			<td> <!-- 이메일 -->
				${ row.EMAIL }
			</td>
			<td> <!-- 전화번호 -->
				${ row.PHONENUM }
			</td>
			<td> <!-- 주소 -->
				${ row.USER_STREET }, ${ row.USER_ZIP }
			</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
	</table>
	
	<!-- 하단 메뉴(바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
		<td>
			${ map.pagingImg }
		</td>
			<td width="100">
				<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
			</td>
		</tr>
	</table>

 <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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
                    <a class="btn btn-primary" href="login.html">Logout</a>
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

</body>

</html>
 