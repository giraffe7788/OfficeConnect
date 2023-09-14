<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Search -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
<!-- 		<h2 style="text-align: center;">Office Connection</h2> -->
		<img src="../img/icon.PNG">
	</form>

	<!-- Nav Item - Alerts -->

	<!-- Dropdown - Alerts -->

	<!-- Nav Item - Messages -->

	<!-- Nav Item - User Information -->
	<button type="button" onclick="alert('로그아웃')" style="border: none; background-color: transparent; color: #858796;">
		<span>Log Out</span>
	</button>
	
	<div class="topbar-divider d-none d-sm-block"></div>
	
	<button type="button" onclick="alert('마이 페이지')" style="border: none; background-color: transparent; color: #858796;">
	<span style="margin-right: 20px;">My Page</span>
	</button>
	
	<!--Dropdown - User Information -->
		<div
			class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
			aria-labelledby="userDropdown">
			<a class="dropdown-item" href="#"> <i
				class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
			</a> <a class="dropdown-item" href="#"> <i
				class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
			</a> <a class="dropdown-item" href="#"> <i
				class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
			</a>
			<div class="dropdown-divider"></div>
			<a class="dropdown-item" href="#" data-toggle="modal"
				data-target="#logoutModal"> <i
				class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
				Logout
			</a>
		</div></li>

	</ul>

	<script src="https://kit.fontawesome.com/721f3d622d.js"
		crossorigin="anonymous"></script>
</nav>

<%@ include file="./common.jsp"%>