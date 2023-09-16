<%@page import="vo.CarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	List<CarVO> carList = (List<CarVO>)request.getAttribute("carList");
%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>보유 차량 현황/예약</title>

<!-- 아이콘 설정 -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">

<style>
#BookTable {
	width : 100%;
	border: 1px solid #858796;
}

.td {
	border: 1px solid #858796;
	padding: 5px;
}
.head {
	width : 40%;
	text-align: center;
}

.body {
	padding-left: 20px;
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

					<!-- 페이지 내 헤더 -->
					<div class="d-sm-flex align-items-center mb-4">
						<h3 class="h3 mb-0 text-gray-800"
							style="margin-left: 300px; margin-right: 650px;">차량배차</h3>

						<button type="button" class="btn btn-primary" id="room1"
							style="display: block;"
							onclick="window.location.href = 'carBook.jsp';">나의 예약</button>
					</div>

					<!--  -->
					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">
							
									<img alt="법인차량  g70" src="<%=carList.get(0).getcarImagePath() + carList.get(0).getcarImageName() %>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량1<br> 
										차량명 : <%=carList.get(0).getCarName() %><br>
										차량 번호 : <%=carList.get(0).getCarNo() %> <br>
									</div>

									<div>
										<button type="button" class="btn btn-primary" id="car1"
											style="width: 120px; margin-bottom: 10px;">예약</button>
										<br>
										<button type="button" class="btn btn-primary" id="carBook1"
											style="width: 120px;">예약조회</button>
									</div>
								</div>

							</div>

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 ev6" src="<%=carList.get(1).getcarImagePath() + carList.get(1).getcarImageName() %>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량2<br> 
										차량명 : <%=carList.get(1).getCarName() %><br> 
										차량 번호 : <%=carList.get(1).getCarNo()%> <br>
									</div>
									<div>
										<button type="button" class="btn btn-primary" id="car2"
											style="width: 120px; margin-bottom: 10px;">예약</button>
										<br>
										<button type="button" class="btn btn-primary" id="carBook2"
											style="width: 120px;">예약조회</button>
									</div>
								</div>

							</div>

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 카니발" src="<%=carList.get(2).getcarImagePath() + carList.get(2).getcarImageName() %>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량3<br> 
										차량명 : <%=carList.get(2).getCarName()%><br>
										차량 번호 : <%=carList.get(2).getCarNo() %><br>
									</div>
									<div>
										<button type="button" class="btn btn-primary" id="car3"
											style="width: 120px; margin-bottom: 10px;">예약</button>
										<br>
										<button type="button" class="btn btn-primary" id="carBook3"
											style="width: 120px;">예약조회</button>
									</div>

								</div>

							</div>

							<!-- 예약 모달 -->

							<div id="carModal" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">차량예약</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">
											<!-- form에 url 써줘 야함. -->
											<form action="url" name="jsp?로 가는 거임?" method="post">
												<label>예약자 : <br> <input type="text" name="#"></label><br>
												<label>예약날짜 : <br> <input type="date" name="#">
												</label><br> <label>반납날짜 : <br> <input type="date"
													name="#"></label><br> <label>예약사유 : <br>
													<textarea rows="4" cols="55" name="#"></textarea>
												</label>

											</form>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">예약완료</button>
										</div>
									</div>

								</div>
							</div>
							
							
							<!-- 예약조회 모달 -->

							<div id="carBookModal" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">차량예약</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body" style="height: 220px;">
											<!-- form에 url 써줘 야함. -->

											<form action="url" name="jsp?로 가는 거임?" method="post">
												<div class="table-responsive">
													<div class="table-wrapper">
														<h5 style="text-align: center; margin-bottom: 20px;">법인공용차량</h5>
														<table id="BookTable">
																<tr>
																	<td class="td head">이  름</td>
																	<td class="td body">김태영</td>
																</tr>
																<tr>
																	<td class="td head">빌린시간</td>
																	<td class="td body"></td>
																</tr>
																<tr>
																	<td class="td head">반납시간</td>
																	<td class="td body"></td>
																</tr>
														</table>

													</div>

												</div>
											</form>

										</div>
									</div>

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
	<script>
		//예약 모달
		$('#car1').on('click', function() {
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});

		$('#car2').on('click', function() {
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});

		$('#car3').on('click', function() {
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});

		//------------------------------------------------------------------------------------------------------------------------------------------------

		//예약조회 모달
		$('#carBook1').on('click', function() {
			$('#carBookModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carBookModal').modal('hide');
		});

		$('#carBook2').on('click', function() {
			$('#carBookModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carBookModal').modal('hide');
		});

		$('#carBook3').on('click', function() {
			$('#carBookModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carBookModal').modal('hide');
		});
	</script>

	<%@ include file="./common.jsp"%>
</body>

</html>