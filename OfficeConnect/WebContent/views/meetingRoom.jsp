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
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
										style="display: block;" value="1">회의실1</button>
									<br>

									<button type="button" class="btn btn-primary" id="room2"
										style="display: block;" value="2">회의실2</button>
									<br>

									<button type="button" class="btn btn-primary" id="room3"
										style="display: block;" value="3">회의실3</button>
									<br>

									<button type="button" class="btn btn-primary" id="room4"
										style="display: block;" value="4">회의실4</button>
									<br>

									<button type="button" class="btn btn-primary" id="room5"
										style="display: block;" value="5">회의실5</button>
									<br>
									<button type="button" class="btn btn-success" id="myRoom"
										onClick="window.location.href='mybook.do'"
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
													<div class="mtrNO">
														<label class="control-label">회의실</label>
													</div>

													<form class="reservation">
														<div class="form-group">
															<label class="control-label">회의 내용</label>
															<textarea name="mtrbookCont" rows="5" cols="50"></textarea>
														</div>

														<div class="form-group">
															<label class="control-label">예약 시간</label> <select
																name="mtrbookRent">
																<option value="9">9
																<option value="10">10
																<option value="11">11
																<option value="12">12
																<option value="13">13
																<option value="14">14
																<option value="15">15
																<option value="16">16
																<option value="17">17
															</select> <span>: 00 ~ </span> <select name="mtrbookRtn">
																<option class="time" value="10">10
																<option class="time" value="11">11
																<option class="time" value="12">12
																<option class="time" value="13">13
																<option class="time" value="14">14
																<option class="time" value="15">15
																<option class="time" value="16">16
																<option class="time" value="17">17
																<option class="time" value="18">18
															</select> <span>: 00</span>
														</div>

														<div class="form-group">
															<label class="control-label">회의 인원</label> <select
																id="mtrbookPer">
															</select>
														</div>

													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn_book_out">예약</button>
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
	// 예약 현황
	$(document).ready(function () {
		
        // 회의실 예약 정보를 포함한 VO 리스트
        var mtrList = <%=new Gson().toJson(mtrList)%>;

        // 각 예약 정보를 순회하면서 테이블의 배경색을 변경
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
          			if (parseInt(tdText.split('-')[1]) >= parseInt(startTime) && parseInt(tdText.split('-')[1]) < parseInt(endTime)) {
          				console.log("배경색 변경");
          				$(this).css("background-color", "#cff7dc"); // 배경색을 원하는 색상으로 변경	
          			}
               });
        });
    });

// 회의실 버튼 속성 한번에 주기
		$('.btn-primary').on('click', function(){
			// 해당 회의실 번호 적용
			console.log($(this).val());
			mtrNo = $(this).val();
			console.log("mtrNo = " + mtrNo);
			let mtrNoT = "<span>";
			mtrNoT += mtrNo;
			mtrNoT += "</span>";
			$('.mtrNO').append(mtrNoT);
				
			// 배경색 설정
			$('#myModal').modal({
				backdrop : 'static'
			});
			
			// select 엘리먼트에 대한 참조를 가져옵니다.
			var selectElement = document.getElementById("mtrbookPer");
			while (selectElement.options.length > 0) {
			    selectElement.remove(0);
			}
			
			let index = 0;
			if(mtrNo == 1){
				index = <%=roomList.get(0).getMtrPer()%>;
			} else if(mtrNo == 2){
				index = <%=roomList.get(1).getMtrPer()%>;
			} else if(mtrNo == 3){
				index = <%=roomList.get(2).getMtrPer()%>;
			} else if(mtrNo == 4){
				index = <%=roomList.get(3).getMtrPer()%>;
			} else if(mtrNo == 5){
				index = <%=roomList.get(4).getMtrPer()%>;
			}
			console.log("index =" + index);
			
			// 해당 회의실 제한 인원 적용	
			for(let j = 1; j <= index; j++){
					
					// 새로운 option 엘리먼트를 생성합니다.
					var option = document.createElement("option");

					// option 엘리먼트의 속성을 설정합니다.
					option.value = j;
					option.text = j;

					// select 엘리먼트에 새 option 엘리먼트를 추가합니다.
					selectElement.appendChild(option);
				}
		});
	
		// 모달창-'X' 버튼 클릭했을 때
		$('button .close').on('click', function() {
			$('#myModal').modal('hide');
			
			// 회의실 번호 초기화
			$('.mtrNO span').empty();
		});
		
		// 모달창-'예약' 버튼 클릭했을 때
		$('.btn_book_out').on('click', function(){
			$('#myModal').modal('hide');
			
			let mtrbookRent = $('[name="mtrbookRent"]').val();
			let mtrbookRtn = $('[name="mtrbookRtn"]').val();
			let mtrbookPer = $('[id="mtrbookPer"]').val();
			let mtrbookCont = "";
			if($('[name="mtrbookCont"]').val() == ''){
				mtrbookCont = '내용이 없습니다.';
			} else {
				mtrbookCont = $('[name="mtrbookCont"]').val();
			}
			
			// 9시 이상 예약 가능하게
			if(parseInt(mtrbookRtn, 10) < parseInt(mtrbookRent, 10)){
				alert("시작 이전 시간은 예약 불가능합니다.");
				return;
			}
			
			// 예약된 시간엔 예약 안되게
			<%for(MeetingBookVO mvo : mtrList){%>
			// 같은 회의실이면 시작끝 시간 겹쳐도 안되고 시작 시간 겹쳐도 안되고 끝시간 겹쳐도 안되고 그 사이 시간도 겹치면 안됨
				if( '<%=mvo.getMtrNo() %>' == 'mtrNo' ){
					if( <%=mvo.getMtrbookRent() %> == mtrbookRent && <%=mvo.getMtrbookRtn() %> == mtrbookRtn){
						alert("이미 예약된 시간입니다.");
						return;
					}else if(<%=mvo.getMtrbookRent()%> < mtrbookRent && <%=mvo.getMtrbookRtn() %> > mtrbookRtn ){
						alert("이미 예약된 시간입니다.");
						return;
					}else if(<%=mvo.getMtrbookRent() %> == mtrbookRent){
						alert("이미 예약된 시작시간입니다.");
						return;
					}else if(<%=mvo.getMtrbookRtn() %> == mtrbookRtn){
						alert("이미 예약된 종료시간입니다.");
						return;
					}
				}
			<%
			}
			%>
			
			// 회원당 예약  한번만
			<%for(MeetingBookVO mvo : mtrList){
				if('<%=mvo.getEmpNo()%>' == '<%=currentEmpNo%>'){
					alert("회의실은 인당 1번만 예약 가능합니다");
					return;
				}
			<%}%>
			
			$.ajax({
				url: "insert.do",
				type: "post",
				data: { 'mtrNo': mtrNo,
					    'mtrbookPer' : mtrbookPer,
					    'mtrbookRent' : mtrbookRent, 
					    'mtrbookRtn' : mtrbookRtn, 
					    'mtrbookCont' : mtrbookCont },
					    
				success: function(res){	
					// 시간표 반영
					if(res.isSuccess == "ok"){
						alert("회의실 예약이 완료되었습니다");
					} else {
						alert("회의실 예약이 실패하였습니다")
					}
					location.href = "list.do";
				},
				error: function(xhr, status, msg){
					console.log("상태값: " + status + " Http 에러 메시지: " + msg);
				}
			});	
		});
</script>
	<%@ include file="./common.jsp"%>
	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>