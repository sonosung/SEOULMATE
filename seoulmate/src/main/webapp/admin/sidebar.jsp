<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <!-- Custom fonts for this template-->
    <link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./css/sb-admin-2.min.css" rel="stylesheet">
<head>
</head>
<body>
<!-- Sidebar - Brand -->
<a class="sidebar-brand d-flex align-items-center justify-content-center" href="./index.jsp">
	<div class="sidebar-brand-icon rotate-n-15">
		<i class="fas fa-laugh-wink"></i>
	</div>
	<div class="sidebar-brand-text mx-3">
		SEOULMATE<sup></sup>
	</div>
</a>

<!-- Divider -->
<hr class="sidebar-divider my-0">

<!-- Nav Item - Dashboard -->
<li class="nav-item active"><a class="nav-link"
	href="./adminIndex.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
		<span>Dashboard</span></a></li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">Interface</div>

<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item"><a class="nav-link collapsed" href="#"
	data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
	aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>행사
			이미지</span>
</a>
	<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
		data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">Custom Components:</h6>
			<a class="collapse-item" href="./buttons.jsp">Buttons</a> <a
				class="collapse-item" href="./cards.jsp">Cards</a>
		</div>
	</div></li>

<!-- Nav Item - Utilities Collapse Menu --->
<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
	aria-expanded="true" aria-controls="collapseUtilities">
	<i class="fas fa-fw fa-wrench"></i> 
	<span>Utilities</span>
</a>
	<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">Custom Utilities:</h6>
			<a class="collapse-item" href="./utilities-color.jsp">Colors</a>
			<a class="collapse-item" href="./utilities-border.jsp">Borders</a>
			<a class="collapse-item" href="./utilities-animation.jsp">Animations</a>
			<a class="collapse-item" href="./utilities-other.jsp">Other</a>
		</div>
	</div></li>

<!-- 회원관리 메뉴 --->
<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUserpage" aria-expanded="true" aria-controls="collapseUserpage">
	<i class="fas fa-fw fa-wrench"></i> <span>회원관리</span>
</a>
	<div id="collapseUserpage" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">Custom Utilities:</h6>
			<a class="collapse-item" href="./admin/emailAuth.jsp">인증메일 보내기</a>
			<a class="collapse-item" href="./admin/utilities-border.jsp">Borders</a>
			<a class="collapse-item" href="./admin/utilities-animation.jsp">Animations</a>
			<a class="collapse-item" href="./admin/utilities-other.jsp">Other</a>
		</div>
	</div></li>

<!-- Divider -->
<hr class="sidebar-divider">

<!-- Heading -->
<div class="sidebar-heading">Addons</div>

<!-- Nav Item - Pages Collapse Menu -->
<li class="nav-item">
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
<i class="fas fa-fw fa-folder"></i>
<span>Pages</span>
</a>
	<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
		<div class="bg-white py-2 collapse-inner rounded">
			<h6 class="collapse-header">Login Screens:</h6>
			<a class="collapse-item" href="./admin/login.jsp">Login</a>
			<a class="collapse-item" href="./admin/register.jsp">Register</a>
			<a class="collapse-item" href="./admin/forgot-password.jsp">Forgot Password</a>
			<div class="collapse-divider"></div>
			<h6 class="collapse-header">Other Pages:</h6>
			<a class="collapse-item" href="./admin/404.jsp">404 Page</a>
			<a class="collapse-item" href="./admin/blank.jsp">Blank Page</a>
		</div>
	</div>
</li>

<!-- Nav Item - Charts -->
<li class="nav-item">
	<a class="nav-link" href="./admin/charts.jsp">
		<i class="fas fa-fw fa-chart-area"></i> 
		<span>Chart</span>
	</a>
</li>

<!-- Nav Item - Tables -->
<li class="nav-item">
	<a class="nav-link" href="./admin/tables.jsp">
		<i class="fas fa-fw fa-table"></i>
		<span>여기에 관리자 글쓰기 페이지 추가</span>
	</a>
</li>

<!-- Divider -->
<hr class="sidebar-divider d-none d-md-block">

<!-- Sidebar Toggler (Sidebar) -->
<div class="text-center d-none d-md-inline">
	<button class="rounded-circle border-0" id="sidebarToggle"></button>
</div>

<!--      Sidebar Message
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="./admin/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>-->
</body>
</html>