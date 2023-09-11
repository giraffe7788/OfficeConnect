<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>기안서작성</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<style>
table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

td {
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
	overflow: hidden; /* 셀 내부 넘치는 내용 숨김 */
	text-overflow: ellipsis; /* 셀 내용이 넘칠 때 "..."으로 표시 */
	max-width: 100px; /* 셀 내용의 최대 너비 설정 (원하는 너비로 조정) */
}
</style>

</head>

<body id="page-top">

	<!-- 페이지 Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 include -->
		<%@ include file="./aside.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 Content -->
			<div id="content">

				<!-- 헤더 include -->
				<%@ include file="./header.jsp"%>

				<!-- 페이지 Content 시작 -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기안서작성</h1>
					</div>

					<!-- Content Row -->
					<div class="row" style="justify-content : center">

						<div class="col-lg-7 mb-4">

							<!-- 결재 양식 들어와야되는데 일단 실험용으로 다른거 넣어봄 -->
							<div class="card shadow mb-4" id="empInfo"">
								<div class="card-body">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr role="row">
												<th class="sorting sorting_asc" tabindex="0"
													aria-controls="dataTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="번호: activate to sort column descending"
													style="width: 100px;">사번</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="제목: activate to sort column ascending"
													style="width: 100px;">이름</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성자: activate to sort column ascending"
													style="width: 100px;">부서</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 100px;">직급</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 100px;">상태</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="작성일: activate to sort column ascending"
													style="width: 100px;">전화번호</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
											<tr>
												<td>201925017</td>
												<td>김영남</td>
												<td>경영지원팀</td>
												<td>대리</td>
												<td>업무중</td>
												<td>010-1234-1234</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 결재양식선택 / 결재자지정 -->

						<div class="col-lg-3 mb-4" style="margin-top : 3%">

							<nav class="navbar navbar-expand navbar-light bg-info mb-4"
								style="border-radius: 0.35rem">
								<a class="navbar-brand" href="#" style="font-size: 1em"><div
										class="text-white shadow" id="department">양식선택</div></a>
								<ul class="navbar-nav ml-auto">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> </a>
										<div
											class="dropdown-menu dropdown-menu-right animated--grow-in"
											aria-labelledby="navbarDropdown" id="dropdown-department"
											style="text-align: center">
											<a class="dropdown-item" href="#">개발부</a> <a
												class="dropdown-item" href="#">디자인부</a> <a
												class="dropdown-item" href="#">인사부</a> <a
												class="dropdown-item" href="#">총무부</a> <a
												class="dropdown-item" href="#">기획부</a> <a
												class="dropdown-item" href="#">사업부</a>
										</div></li>
								</ul>
							</nav>

							<div style="margin-top : 15%; display:inline-block; width:100%">
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="department">결재자1 지정(필수)</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-department"
												style="text-align: center">
												<a class="dropdown-item" href="#">여기는 j쿼리로 내 부서 상사가 오도록
													지정</a>
											</div></li>
									</ul>
								</nav>
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="department">결재자2 지정</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-department"
												style="text-align: center">
												<a class="dropdown-item" href="#">여기는 j쿼리로 내 부서 상사가 오도록
													지정</a>
											</div></li>
									</ul>
								</nav>
								<nav class="navbar navbar-expand navbar-light bg-success mb-4"
									style="border-radius: 0.35rem">
									<a class="navbar-brand" href="#" style="font-size: 1em"><div
											class="text-white shadow" id="department">결재자3 지정</div></a>
									<ul class="navbar-nav ml-auto">
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> </a>
											<div
												class="dropdown-menu dropdown-menu-right animated--grow-in"
												aria-labelledby="navbarDropdown" id="dropdown-department"
												style="text-align: center">
												<a class="dropdown-item" href="#">여기는 j쿼리로 내 부서 상사가 오도록
													지정</a>
											</div></li>
									</ul>
								</nav>
							</div>
							
							<a href="#기안작성"
										class="btn btn-primary btn-icon-split" style="width:35%; margin-left : 34%; margin-top : 15%">
										<span class="text" style="color: #fff">기안작성</span>
										</a>
						</div>

					</div>

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>
		<!-- 페이지 Wrapper 끝 -->

		<!-- 공통속성 설정 include -->
		<%@ include file="./common.jsp"%>
		<script src="../vendor/jquery/jquery.min.js"></script>
		<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script>
			$('#exampleModal').on('show.bs.modal', function(event) {
				// 드롭다운 값에 따라 부서별 회원들이 쫙 나와야함
				var button = $(event.relatedTarget)
				var recipient = button.data('whatever')

				var modal = $(this)
				modal.find('.modal-title').text('정보수정')
				modal.find('.modal-body input').val(recipient)
			})

			$('#dropdown-department a').click(function() {
				var selectedText = $(this).text(); // 선택된 항목의 텍스트 가져오기

				// 업무상태 수정 해야함
				$('#department').text(selectedText); // navbar-brand의 텍스트 변경
			});
		</script>
</body>
</html>