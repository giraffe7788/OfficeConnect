<%@page import="vo.MeetingRoomVO"%>
<%@page import="vo.MeetingBookVO"%>
<%@page import="java.util.List"%>
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

<title>회의실예약</title>

<!-- 아이콘 설정 -->
<link href="./vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="./css/sb-admin-2.min.css" rel="stylesheet">
<script src="./vendor/jquery/jquery.min.js"></script>
<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>

<body id="page-top">

	<%
		List<MeetingBookVO> mtrList = (List<MeetingBookVO>) request.getAttribute("mtrList");
	List<MeetingRoomVO> roomList = (List<MeetingRoomVO>) request.getAttribute("roomList");
	String currentEmpNo = (String) request.getAttribute("empNo");
	%>

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
											width="100%" cellspacing="0">
											<thead>
												<tr>
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
												<%
													int index = 0;
													boolean isRoom1 = false;
													boolean isRoom2 = false;
													boolean isRoom3 = false;
													boolean isRoom4 = false;
													boolean isRoom5 = false;
												
													if (mtrList.size() != 0) {
													for (MeetingBookVO mbvo : mtrList) {
														index ++;
												%>
												<tr>
													<%
														if (mbvo.getMtrbookRent() == 9 && mbvo.getMtrNo() == 1) {
															isRoom1 = true;
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1){
															 isRoom1 = true;
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 10 && mbvo.getMtrbookRtn() >= 10  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 11 && mbvo.getMtrbookRtn() >= 11  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 12 && mbvo.getMtrbookRtn() >= 12  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 13 && mbvo.getMtrbookRtn() >= 13  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 14 && mbvo.getMtrbookRtn() >= 14  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 15 && mbvo.getMtrbookRtn() >= 15  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 16 && mbvo.getMtrbookRtn() >= 16  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 17 && mbvo.getMtrbookRtn() >= 17  && mbvo.getMtrNo() == 1) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 1) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
													// 한번도 1번 회의실이 찍힌적이 없으면서 + 이게 찍어야하는 리스트의 마지막일때 == 3번회의실이 예약된적이 엇을때
													if(isRoom1 == false && index == mtrList.size()) {
													%>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<%
													}
													%>
												</tr>
												<tr>
													<%
														if (mbvo.getMtrbookRent() == 9 && mbvo.getMtrNo() == 2) {
															isRoom2 = true;
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2){
															 isRoom2 = true;
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 10 && mbvo.getMtrbookRtn() >= 10  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 11 && mbvo.getMtrbookRtn() >= 11  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 12 && mbvo.getMtrbookRtn() >= 12  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 13 && mbvo.getMtrbookRtn() >= 13  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 14 && mbvo.getMtrbookRtn() >= 14  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 15 && mbvo.getMtrbookRtn() >= 15  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 16 && mbvo.getMtrbookRtn() >= 16  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 17 && mbvo.getMtrbookRtn() >= 17  && mbvo.getMtrNo() == 2) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 2) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
													// 한번도 3번 회의실이 찍힌적이 없으면서 + 이게 찍어야하는 리스트의 마지막일때 == 3번회의실이 예약된적이 엇을때
													if(isRoom2 == false && index == mtrList.size()) {
													%>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<%
													}
													%>
												</tr>
												<tr>
													<%
														if (mbvo.getMtrbookRent() == 9 && mbvo.getMtrNo() == 3) {
															isRoom3 = true;
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3){
															 isRoom3 = true;
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 10 && mbvo.getMtrbookRtn() >= 10  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 11 && mbvo.getMtrbookRtn() >= 11  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 12 && mbvo.getMtrbookRtn() >= 12  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 13 && mbvo.getMtrbookRtn() >= 13  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 14 && mbvo.getMtrbookRtn() >= 14  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 15 && mbvo.getMtrbookRtn() >= 15  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 16 && mbvo.getMtrbookRtn() >= 16  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 17 && mbvo.getMtrbookRtn() >= 17  && mbvo.getMtrNo() == 3) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 3) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
													// 한번도 3번 회의실이 찍힌적이 없으면서 + 이게 찍어야하는 리스트의 마지막일때 == 3번회의실이 예약된적이 엇을때
													if(isRoom3 == false && index == mtrList.size()) {
													%>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<%
													}
													%>
												</tr>
												<tr>
													<%
														if (mbvo.getMtrbookRent() == 9 && mbvo.getMtrNo() == 4) {
															isRoom1 = true;
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4){
															 isRoom1 = true;
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 10 && mbvo.getMtrbookRtn() >= 10  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 11 && mbvo.getMtrbookRtn() >= 11  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 12 && mbvo.getMtrbookRtn() >= 12  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 13 && mbvo.getMtrbookRtn() >= 13  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 14 && mbvo.getMtrbookRtn() >= 14  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 15 && mbvo.getMtrbookRtn() >= 15  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 16 && mbvo.getMtrbookRtn() >= 16  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 17 && mbvo.getMtrbookRtn() >= 17  && mbvo.getMtrNo() == 4) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 4) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
													// 한번도 4번 회의실이 찍힌적이 없으면서 + 이게 찍어야하는 리스트의 마지막일때 == 3번회의실이 예약된적이 엇을때
													if(isRoom4 == false && index == mtrList.size()) {
													%>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<%
													}
													%>
												</tr>
												<tr>
													<%
														if (mbvo.getMtrbookRent() == 9 && mbvo.getMtrNo() == 5) {
															isRoom1 = true;
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5){
															 isRoom1 = true;
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 10 && mbvo.getMtrbookRtn() >= 10  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 11 && mbvo.getMtrbookRtn() >= 11  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 12 && mbvo.getMtrbookRtn() >= 12  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 13 && mbvo.getMtrbookRtn() >= 13  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 14 && mbvo.getMtrbookRtn() >= 14  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 15 && mbvo.getMtrbookRtn() >= 15  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 16 && mbvo.getMtrbookRtn() >= 16  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
														if (mbvo.getMtrbookRent() <= 17 && mbvo.getMtrbookRtn() >= 17  && mbvo.getMtrNo() == 5) {
													%>
													<td style="background-color: red">&nbsp;</td>
													<%
														 } else if (mbvo.getMtrNo() == 5) {
													%>
													<td></td>
													<%
														 }
													%>
													<%
													// 한번도 5번 회의실이 찍힌적이 없으면서 + 이게 찍어야하는 리스트의 마지막일때 == 3번회의실이 예약된적이 엇을때
													if(isRoom5 == false && index == mtrList.size()) {
													%>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<%
													}
													%>
												</tr>
												<%
													}
												} else {
												%>
												<tr>
													<td>회의실1이거안돼ㅔ야함</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>회의실2</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>회의실3</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>회의실4</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>회의실5</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<%
													}
												%>
												
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
// 			let v_disp = document.querySelector('#dataTable');
			$(function() {
// 				var table = document.getElementById('dataTable');
// 				var rowList = table.rows;
				
// 				for(let i = 0; i <rowList.len)
// 				v_tbl += "<table border=1>";
// 				v_tbl += "<tr>";
// 				for(let i=9; i<18; i++){
// 					v_tbl += "<th>" + i + "</th>";
// 				}			
// 				v_tbl += "</tr>";
// 				for(let j=0; j<5; j++){
// 					v_tbl += "<tr>";
// 						for(let k=0; k<9; k++){
// 							v_tbl += "<td></td>";
// 						}
// 					v_tbl += "</tr>";
// 				}
// 				v_tbl += "</table>";
// 				v_disp.innerHTML = v_tbl;
			});

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
	</script>
	<%@ include file="./views/common.jsp"%>

	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>