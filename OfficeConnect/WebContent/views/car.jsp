<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="util.SessionEmpInfo"%>
<%@page import="vo.EmpVO"%>
<%@page import="vo.CarBookVO"%>
<%@page import="car.controller.CarBook"%>
<%@page import="vo.CarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<CarVO> carList = (List<CarVO>) request.getAttribute("carList");
	List<CarBookVO> carBookList = (List<CarBookVO>) request.getAttribute("carbookList");
	
	SessionEmpInfo sessionEmpInfo = SessionEmpInfo.getInstance();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
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
<!-- j쿼리 설정-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
#BookTable {
	width: 100%;
	border: 1px solid #858796;
}

.td {
	border: 1px solid #858796;
	padding: 5px;
}

.head {
	width: 40%;
	text-align: center;
}

.body {
	padding-left: 20px;
}

.carbook {
	border: 1px solid #858796;
}

.carbookth {
	padding: 10px;
}

.carbooktd {
	padding: 4x;
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

						<button type="button" class="btn btn-primary" id="carBook1"
							style="margin-right: 10px; margin-left: -50px;">예약 조회</button>

						<a href = "mybook.do"><button type="button" class="btn btn-primary" id="MycarBook"
							style="display: block;">나의 예약</button></a>
					</div>

					<!--  -->
					<div class="row" style="justify-content: center">

						<div class="col-lg-8">

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량  g70"
										src="<%=carList.get(0).getcarImagePath() + carList.get(0).getcarImageName()%>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량<br> 차량명 :
										<%=carList.get(0).getCarName()%><br> 차량 번호 :
										<%=carList.get(0).getCarNo()%>
										<br>
									</div>

									<div>
										<button type="button" class="btn btn-primary" id="car1"
											style="width: 120px; margin-bottom: 10px;">예약</button>
										<br>
									</div>
								</div>

							</div>

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 ev6"
										src="<%=carList.get(1).getcarImagePath() + carList.get(1).getcarImageName()%>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량<br> 차량명 :
										<%=carList.get(1).getCarName()%><br> 차량 번호 :
										<%=carList.get(1).getCarNo()%>
										<br>
									</div>
									<div>
										<button type="button" class="btn btn-primary" id="car2"
											style="width: 120px; margin-bottom: 10px;">예약</button>
									</div>
								</div>

							</div>

							<div class="card mb-4">
								<div class="card-body"
									style="display: flex; align-items: center; justify-content: space-around;">

									<img alt="법인차량 카니발"
										src="<%=carList.get(2).getcarImagePath() + carList.get(2).getcarImageName()%>"
										style="width: 240px; height: 150px;">
									<div>
										법인공용차량<br> 차량명 :
										<%=carList.get(2).getCarName()%><br> 차량 번호 :
										<%=carList.get(2).getCarNo()%><br>
									</div>
									<div>
										<button type="button" class="btn btn-primary" id="car3"
											style="width: 120px; margin-bottom: 10px;">예약</button>
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
											<form>
												<label>예약날짜:<br> <input type="date" name="carBookRent"> </label><br> 
												<label>반납날짜 : <br> <input type="date" name="carBookReturn"></label><br> 
												<label>예약사유:<br> <textarea rows="4" cols="55" name="carBookCont"></textarea></label>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" id="submitBtn" class="btn btn-primary">예약완료</button>
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
										<div class="modal-body">
											<form>
												<div class="table-responsive">
												<%if(!carBookList.isEmpty() && !carList.isEmpty()) { %>
													<div class="table-wrapper">
														<h5 style="text-align: center; margin-bottom: 20px;">법인공용차량</h5>
													
														<table id="BookTable" style="border: 1px solid #858796;">
															<thead style="text-align: center; border: 1px solid #858796; padding: 2px;">
																<tr>
																	<th class="carbookth carbook">사원 이름</th>
																	<th class="carbookth carbook">차량 번호</th>
																	<th class="carbookth carbook">예약 날짜</th>
																	<th class="carbookth carbook">반납 날짜</th>
																	<th class="carbookth carbook">예약 사유</th>
																</tr>
															</thead>
															<tbody style="text-align: center; border: 1px solid #858796;">
															<% for(CarBookVO carBookVO : carBookList){ %>
																<tr>
																<td class="carbooktd carbook"><%=sessionEmpInfo.getEmpVO(carBookVO.getEmpNo()).getEmpName() %></td>
																<td class="carbooktd carbook"><%=carBookVO.getCarNo()%></td>
																<td class="carbooktd carbook"><%=simpleDateFormat.format(carBookVO.getCarBookRent())%></td>
																<td class="carbooktd carbook"><%=simpleDateFormat.format(carBookVO.getCarBookReturn())%></td>
																<td class="carbooktd carbook"><%=carBookVO.getCarBookCont()%></td>
																</tr>
															<%} %>
															</tbody>

														</table>

													</div>
													<%} else{ %>
														<div> 차량 예약 내역이 없습니다.</div>
													<% } %>

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
	<!-- C
	ontent Wrapper 끝 -->

	</div>
	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->
	<script>
	
		// 마지막으로 선택한 차량 번호
			let currentCarNo = "";
	
		//예약 모달
		$('#car1').on('click', function() {
			
			currentCarNo = "10무 0119";
			
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});

		$('#car2').on('click', function() {
			
			currentCarNo = "150두 5547";
			
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});

		$('#car3').on('click', function() {
			
			currentCarNo = "124부 1395";
			
			$('#carModal').modal({
				backdrop : 'static'
			});
		});

		$('.modal-footer button').on('click', function() {
			$('#carModal').modal('hide');
		});
		
		//-----------------------------------------------------------------------------------------------------------------------------------------------------
		
		//모달 창 '예약' 버튼 클릭 했을 때
		$('#submitBtn').on('click', function(){
			
   			let carBookRent = $('[name=carBookRent]').val();
   		    let carBookReturn = $('[name=carBookReturn]').val();
			let carBookCont = $('[name=carBookCont]').val();
			
			//Date 객체가 현재 날짜와 시간을 받아주는데 폼창에서 입력 받은 날짜는 한국 표준시 am9시로 받아줘서 
			//오늘 날짜부터 예약할 수 하기 위해 현재 날짜,시간을 받고 1일을 빼줌.
			let currentDate = new Date();
			const oneDayInMilliseconds = 24 * 60 * 60 * 1000;
			let oneDayBefore = new Date(currentDate.getTime() - oneDayInMilliseconds);
			
			let rentDate = new Date(carBookRent);
			let returnDate = new Date(carBookReturn);

			if (rentDate < oneDayBefore || returnDate < oneDayBefore) {
			    alert('오늘 날짜부터 예약 가능합니다.');
			    return; // 예약을 중단하고 함수를 종료합니다.
			}
			
		    $.ajax({
		        url: "book.do",
				type : "post",
				data : {
					'currentCarNo' : currentCarNo,
					'carBookRent' : carBookRent,
					'carBookReturn' : carBookReturn,
					'carBookCont' : carBookCont
				},
				success : function(res) {
					// 예약 성공 여부
					if (res.isSuccess == "ok") {
						alert("차량 예약이 완료되었습니다.");
					} else {
						alert("차량 예약이 실패하였습니다.");
					}
					location.href = "list.do";

				},
				error : function(xhr, status, msg) {
					alert("에러 입니당");
				}
			});

		});

		//------------------------------------------------------------------------------------------------------------------------------------------------

		//예약조회 모달 띄워주고 닫는 것.
		$('#carBook1').on('click', function() {

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