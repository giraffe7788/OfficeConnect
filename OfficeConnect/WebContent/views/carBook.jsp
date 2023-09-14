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

<title>나의 차량 예약</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
					<h1 class="h3 mb-2 text-gray-800" style="text-align: center;">나의
						차량 예약</h1>
					<hr style="width: 70%;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4"
						style="width: 70%; margin: auto; margin-top: 50px">
						<div class="card-body">

							<div class="row"
								style="display: flex; justify-content: space-around; height: 450px; align-items: center;">
								<div class="col-lg-3"
									style="text-align: center; display: flex; flex-direction: column;">

									<img alt="차량이미지" src="../images/car1.png"
										style="width: 200px; height: 150px; margin: auto;"> <br>

									<div style="text-align: center;">법인공용차량1</div>
									<br>
									<div style="text-align: center;">차량명 : 제네시스gv70</div>
								</div>

								<div class="col-lg-8" style="height: 80%">

									<div class="table-responsive"
										style="position: relative; display: flex; height: 100%;">
										<div class="table-wrapper" style="width: 100%; height: 80%;">
											<table class="table table-bordered" id="dataTable"
												width="100%" cellspacing="0">
												<tr>
													<td>차량번호</td>
													<td>번호 불러오깅</td>
												</tr>
												<tr>
													<td>예약시간</td>
													<td>시간뭘로 할 지 정하기</td>
												</tr>
												<tr>
													<td>탑승인원</td>
													<td>6</td>
												</tr>
												<tr>
													<th style="text-align: center;">예약사유</th>
													<!--<td><textarea rows="6" style="width: 100%; height: 100%; box-sizing: border-box;">sdlfagdhdㅇㄴㄻㄴㅇㄹ </textarea></td> -->
													<td style="height: 160px">asdfhasldga</td>
												</tr>
											</table>
										</div>

									</div>
								</div>
							</div>

							<button type="button" class="btn btn-primary"
								style="display: block; width: 100px; margin-bottom: 18px; margin-left: 845px; margin-top: -68px">취소</button>

						</div>

					</div>

					<!-- 페이지 Content 끝 -->

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>
		<!-- 페이지 Wrapper 끝 -->

		<!-- 공통속성 설정 include -->
			
		<%@ include file="./common.jsp"%>

		<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>