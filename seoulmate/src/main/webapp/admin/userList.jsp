<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.*"%>
<%@ page import="seoulmate.admin.AuthBoardDAO" %>
<%@ page import="seoulmate.membership.MemberDTO" %>

<%
//DAO를 생성해 DB에 연결
AuthBoardDAO dao = new AuthBoardDAO();    

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);

/* 페이지 처리 start */
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

int start = (pageNum -1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);

List<MemberDTO> boardLists = dao.selectUserListPage(param);
dao.close();
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<style type="text/css">    
    html, body {
    height: 100%
}

#wrapper {
    height: auto;
	min-height: 100%;
}

footer {
	/* position : relative;
  	transform : translateY(-100%); */
  	position : fixed;
	bottom : 0;
}
</style>

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
                <div class="container-fluid" align="center">


					<h2>회원 목록 보기(List)</h2>

					<!-- 검색 폼 -->
					<form method="get">
						<table border="1" width="90%">
							<tr>
								<td align="center">
								<select name="searchField">
										<option value="USER_NUM">필드선택</option>
										<option value="USER_ID">닉네임</option>
										<option value="USERNAME">이름</option>
										<option value="EMAIL">이메일</option>
										<option value="PHONENUM">전화번호</option>
										<option value="USER_STREET">주소</option>
								</select> 
								<input type="text" name="searchWord" /> 
								<input type="submit" value="검색하기" />
								</td>
							</tr>
						</table>
					</form>

					<!-- 목록 테이블 -->
					<table border="1" width="90%">
						<tr align="center">
							<th width="5%">번호</th>
							<th width="10%">닉네임</th>
							<th width="10%">이름</th>
							<th width="20%">이메일</th>
							<th width="10%">전화번호</th>
							<th width="25%">주소</th>
							<th width="5%">우편번호</th>
							<th width="10%">비밀번호</th>
							<th width="5%">삭제</th>
						</tr>
						<c:choose>
							<c:when test="${ empty boardLists }">
								<!-- 게시물이 없을 때 -->
								<tr>
									<td colspan="6" align="center">등록된 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<!-- 게시물이 있을 때 -->
								<c:forEach items="${ boardLists }" var="row" varStatus="loop">
									<tr align="center">
										<td>
											<!-- 번호 --> ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
										</td>
										<td>
											<!-- 아이디 --> ${ row.USER_ID }
										</td>
										<td>
											<!-- 이름 --> ${ row.USERNAME }
										</td>
										<td>
											<!-- 이메일 --> ${ row.EMAIL }
										</td>
										<td>
											<!-- 전화번호 --> ${ row.PHONENUM }
										</td>
										<td>
											<!-- 주소 --> ${ row.USER_STREET }
										</td>
										<td>${ row.USER_ZIP }</td>
										<td>
											<!-- 비밀번호 --> ${ row.USER_PASSWORD }
										</td>
										<td>
											<form
												action="${pageContext.request.contextPath}/admin/out.do"
												method="post">
												<input type="hidden" name="user_num" value="${row.USER_NUM}">
												<button type="submit" class="delete-btn">삭제</button>
											</form>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>

					<!-- 하단 메뉴(바로가기, 글쓰기) -->
					<table border="1" width="90%">
						<tr align="center">
							<td>${ map.pagingImg }</td>
							<%-- <td width="100">
								<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
							</td> --%>
						</tr>
					</table>
					<!-- Footer -->
					<footer class="bg-white">
						<div class="container my-auto">
							<div class="copyright text-center my-auto">
								<span>Copyright &copy; SEOULMATE 2024</span>
							</div>
						</div>
					</footer>
					<!-- End of Footer -->
					<!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



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
 