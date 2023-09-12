<%@page import="com.google.gson.Gson"%>
<%@page import="vo.MeetingRoomVO"%>
<%@page import="vo.MeetingBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MeetingBookVO> mtrList = (List<MeetingBookVO>) request.getAttribute("mtrList");
List<MeetingRoomVO> roomList = (List<MeetingRoomVO>) request.getAttribute("roomList");
String currentEmpNo = (String) request.getAttribute("empNo");
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

<title>회의실예약</title>

<!-- 아이콘 설정 -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">document.oncontextmenu=function(){return false;}</script>
<style>
td {
	color: transparent;
}

.td-visible {
	color: #000;
}
</style>
</head>

<body id="page-top" onselectstart="return false">

	<!-- 페이지 Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 include -->
		<%@ include file="./views/aside.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- 메인 Content -->
			<div id="content">

				<!-- 헤더 include -->
				<%@ include file="./views/header.jsp"%>

				<!-- 페이지 Content 시작 -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">&nbsp;&nbsp;회의실 예약</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">

							<h4 class="h4 mb-2 text-gray-800">예약현황</h4>
							<hr>

							<div class="row"
								style="display: flex; justify-content: space-around; height: 450px; align-items: center;">
								<div class="col-lg-2"
									style="text-align: center; display: flex; flex-direction: column;">
									<button type="button" class="btn btn-primary" id="room1"
										style="display: block;">회의실1</button>
									<br>

									<button type="button" class="btn btn-primary" id="room2"
										style="display: block;">회의실2</button>
									<br>

									<button type="button" class="btn btn-primary" id="room3"
										style="display: block;">회의실3</button>
									<br>

									<button type="button" class="btn btn-primary" id="room4"
										style="display: block;">회의실4</button>
									<br>

									<button type="button" class="btn btn-primary" id="room5"
										style="display: block;">회의실5</button>
									<br>
									<button type="button" class="btn btn-success" id="myRoom"
										onClick="window.location.href='meetingRoomBook.jsp'"
										style="display: block;">나의 예약</button>
									<br>


									<div id="myModal" class="modal fade" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">회의실 예약</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
													<form action="url" name="jsp?로 가는 거임?" method="post">
														<label>예약자 : <input type="text" name="#"></label><br>
														<!-- 															<label>예약날짜 : <input type="date" name="#"></label><br> -->
														<label>예약시간 : <input type="time" name="#"></label><br>

														<!-- 윤하가 만들 어 놓은 모달 갔다 쓰고 모달 수정사항 수정하기. -->

													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default">Close</button>
												</div>
											</div>

										</div>
									</div>

								</div>

								<div class="col-lg-8">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0" style="text-align: center">
											<thead>
												<tr>
													<th>회의실</th>
													<th>9&nbsp;&nbsp;</th>
													<th>10</th>
													<th>11</th>
													<th>12</th>
													<th>13</th>
													<th>14</th>
													<th>15</th>
													<th>16</th>
													<th>17</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td class="td-visible">회의실1</td>
													<td>회의실1-9</td>
													<td>회의실1-10</td>
													<td>회의실1-11</td>
													<td>회의실1-12</td>
													<td>회의실1-13</td>
													<td>회의실1-14</td>
													<td>회의실1-15</td>
													<td>회의실1-16</td>
													<td>회의실1-17</td>
												</tr>
												<tr>
													<td class="td-visible">회의실2</td>
													<td>회의실2-9</td>
													<td>회의실2-10</td>
													<td>회의실2-11</td>
													<td>회의실2-12</td>
													<td>회의실2-13</td>
													<td>회의실2-14</td>
													<td>회의실2-15</td>
													<td>회의실2-16</td>
													<td>회의실2-17</td>
												</tr>
												<tr>
													<td class="td-visible">회의실3</td>
													<td>회의실3-9</td>
													<td>회의실3-10</td>
													<td>회의실3-11</td>
													<td>회의실3-12</td>
													<td>회의실3-13</td>
													<td>회의실3-14</td>
													<td>회의실3-15</td>
													<td>회의실3-16</td>
													<td>회의실3-17</td>
												</tr>
												<tr>
													<td class="td-visible">회의실4</td>
													<td>회의실4-9</td>
													<td>회의실4-10</td>
													<td>회의실4-11</td>
													<td>회의실4-12</td>
													<td>회의실4-13</td>
													<td>회의실4-14</td>
													<td>회의실4-15</td>
													<td>회의실4-16</td>
													<td>회의실4-17</td>
												</tr>
												<tr>
													<td class="td-visible">회의실5</td>
													<td>회의실5-9</td>
													<td>회의실5-10</td>
													<td>회의실5-11</td>
													<td>회의실5-12</td>
													<td>회의실5-13</td>
													<td>회의실5-14</td>
													<td>회의실5-15</td>
													<td>회의실5-16</td>
													<td>회의실5-17</td>
												</tr>

											</tbody>
										</table>
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
		//jquery방식으로 modal띄우기
		$('#room1').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#myModal').modal('hide');
		});

		$('#room2').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#myModal').modal('hide');
		});

		$('#room3').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#myModal').modal('hide');
		});

		$('#room4').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#myModal').modal('hide');
		});

		$('#room5').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});
		
		$('#myRoom').on('click', function() {
			$('#myModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#myModal').modal('hide');
		});
		
		
		$(document).ready(function () {
	        // 회의실 예약 정보를 포함한 VO 리스트
	        var mtrList = <%=new Gson().toJson(mtrList)%>;

	        // 각 예약 정보를 순회하면서 테이블의 배경색을 변경합니다.
	        $.each(mtrList, function (index, booking) {
	        	
	        	console.log("예약정보 출력");
	        	console.log("index : " + index);
	        	console.log("booking : " + booking);
	        	
	            var roomId = booking.mtrNo; // 회의실 번호
	            var startTime = booking.mtrbookRent; // 시작 시간
	            var endTime = booking.mtrbookRtn; // 종료 시간
	            console.log(roomId + " | " + startTime + " | " + endTime);
	        	 // td:contains를 사용하여 특정 조건을 만족하는 <td> 요소를 선택
           		$("td:contains('회의실" + roomId + "-')").each(function() {
           			var tdText = $(this).text().trim();
           			console.log(tdText);
           			console.log(this);
            	    // 해당 요소의 텍스트가 시작 시간과 종료 시간 사이에 있는 경우 배경색 변경
           			if (tdText.split('-')[1] >= startTime && tdText.split('-')[1] < endTime) {
           				$(this).css("background-color", "#cff7dc"); // 배경색을 원하는 색상으로 변경	
           			}
                });
	        });
	    });
	</script>
	<%@ include file="./views/common.jsp"%>


	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>