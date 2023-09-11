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

<title>차량 예약</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

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

					<!-- 페이지 내 헤더 -->
					<div class="d-sm-flex align-items-center mb-4">
						<h3 class="h3 mb-0 text-gray-800"
							style="margin-left: 300px; margin-right: 650px;">차량배차</h3>

						<button type="button" class="btn btn-primary" id="room1"
							style="display: block;">나의 예약</button>
					</div>
					
					<!--  -->
					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량  g70" src="../images/car1.png"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량1<br> 차량명&nbsp;:&nbsp;제네시스gv70<br> 차량
										번호&nbsp;:&nbsp;10무&nbsp;0119 <br>
									</div>
									<button type="button" class="btn btn-primary"
										style="width: 120px">예약</button>
								</div>

							</div>

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 ev6" src="../images/car2.png"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량2<br> 차량명&nbsp;:&nbsp;기아 ev6<br> 차량
										번호&nbsp;:&nbsp;124부&nbsp;1395 <br>
									</div>
									<button type="button" class="btn btn-primary"
										style="width: 120px">예약</button>
								</div>

							</div>



							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 카니발" src="../images/car3.png"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량3<br> 차량명&nbsp;:&nbsp;기아 카니발<br>
										차량&nbsp;번호&nbsp;:&nbsp;150두&nbsp;5547 <br>
									</div>
									<button type="button" class="btn btn-primary"
										style="width: 120px">예약</button>

								</div>


							</div>
						</div>

					</div>
				</div>

			</div>

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
</body>

</html>