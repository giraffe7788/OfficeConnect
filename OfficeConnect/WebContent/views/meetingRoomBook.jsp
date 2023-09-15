<%@page import="javax.swing.text.html.CSS"%>
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

<title>나의 회의실 예약</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<%
	List<MeetingBookVO> mtrList = (List<MeetingBookVO>) request.getAttribute("mtrList");
	String currentEmpNo = (String) request.getAttribute("empNo");
%>

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
						회의실 예약</h1>
					<hr style="width: 70%;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4"
						style="width: 70%; margin: auto; margin-top: 50px">
						<div class="card-body">
							<div class="row"
								style="display: flex; justify-content: space-around; height: 420px; align-items: center;">

								<div class="col-lg-9" style="height: 70%">

									<div class="table-responsive"
										style="position: relative; display: flex;">
										<div class="table-wrapper" style="width: 100%;">
											<div id="emptyData"
												style="display: none; text-align: center; margin-top: 15%; font-size: 2em">
												현재 예약중인 회의실이 없습니다</div>
											<table class="table table-bordered" id="dataTable"
												width="100%" cellspacing="0">
												<tr>
													<th colspan="2" style="text-align: center;">회의</th>
												</tr>
												<tr>
													<th style="text-align: center; width: 20%;">회의실</th>
													<td id="thMtr"></td>
												</tr>
												<tr>
													<th style="text-align: center;">회의시간</th>
													<td id="mtTime"></td>
												</tr>
												<tr>
													<th style="text-align: center;">회의인원</th>
													<td id="mtPer"></td>
												</tr>
												<tr>
													<th style="text-align: center;">회의내용</th>
													<td id="mtCont" style="height: 140px">asdfhasldga</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

							<button type="button" class="btn btn-primary btn-toList"
								style="display: inline-block; width: 100px; margin-bottom: 18px; margin-left: 65%;">목록</button>	
							<button type="button" class="btn btn-primary btn-close"
								style="display: inline-block; width: 100px; margin-bottom: 18px; margin-left: 5%;">취소</button>	
								<a href="list.do"><button type="button" class="btn btn-primary btn-close"
								id="goList" style="display: inline-block; width: 10%; margin-bottom: 5%; margin-left: 66%;">목록으로</button></a>
								
								<button type="button" class="btn btn-primary btn-close" id="buttonCancle"
								style="display: inline-block; width: 10%; margin-bottom: 5%; margin-left: 1%;">취소</button>
						</div>

					</div>

					<!-- 페이지 Content 끝 -->

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>
		<!-- 페이지 Wrapper 끝 -->

	</div>
	<!-- 메인 Content 끝 -->

	</div>
	<!-- Content Wrapper 끝 -->

	</div>
	<!-- 페이지 Wrapper 끝 -->

	<!-- 취소 모달창  -->
	<div id="closeModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">회의실 취소</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<span>예약을 취소하시겠습니까?</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn cancel btn-default">취소</button>
					<button type="button" class="btn confirm btn-default">확인</button>
				</div>
			</div>

		</div>
	</div>

	<script>
	$(document).ready(function() {
		
		<%String msg = (String) request.getAttribute("msg");
		if (msg != null && msg == "ok") {
		%>
			alert("예약이 취소되었습니다");
		<%
		} else if (msg != null && msg == "fail") {
		%>
			alert("예약 취소 중 오류가 발생했습니다");
		<%
		}
		%>

		// 나의 회의실 예약 화면 들어오면 로그인 정보 따라서 예약한 회의실 정보
		let isEmpty = true;

		// 로그인한 사원 확인
		<%
		for(MeetingBookVO mvo : mtrList){
		%>
		    if(<%=mvo.getEmpNo()%> == <%=currentEmpNo%>){
		    	isEmpty = false;
		       // 예약한 회의실 번호 출력
		    	$('#thMtr').empty();			
				let cont1 = "";
				cont1 += <%=mvo.getMtrNo()%>;		
				$('#thMtr').text(cont1);
				
				// 예약한 회의실 시간 출력
		    	$('#mtTime').empty();			
				let cont2 = "";
				cont2 += <%=mvo.getMtrbookRent()%>;
				cont2 += ":00 ~ ";
				cont2 += <%=mvo.getMtrbookRtn()%>;
				cont2 += ":00";
				$('#mtTime').text(cont2);
				
				// 예약한 회의실 인원 출력
		    	$('#mtPer').empty();			
				let cont3 = "";
				cont3 += <%=mvo.getMtrbookPer()%>;		
				$('#mtPer').text(cont3);
				
				// 예약한 회의실 내용 출력
		    	$('#mtCont').empty();
		    	let cont4 = "<%=mvo.getMtrbookCont().trim()%>";
		    	$('#mtCont').text(cont4);
		    }
		<%
		}
		%>
		if (isEmpty) {
			$('#dataTable').css('display', 'none');
			$('#emptyData').css('display', 'block');
			$('#buttonCancle').css('display', 'none');
			$('#goList').css('margin-bottom', '0%');
			$('#goList').css('margin-left', '45%');
		}

		});
	

		// 예약 취소 모달창
		$('.btn-close').on('click', function() {
			$('#closeModal').modal({
				backdrop : 'static'
			});
		});

		// 예약 취소 모달창 닫기
		$('#closeModal .cancel').on('click', function() {
			$('#closeModal').modal('hide');
		});

		// 예약 취소 확정하기
		$('#closeModal .confirm').on('click', function() {
			// DB 회의실 예약 정보 삭제
	        $.ajax({
	            url: 'delete.do',
	            type: 'GET',
	            data: { 'empNo': <%=currentEmpNo%> },
	            success: function(res) {
	                if (res.isSuccess === 'ok') {
	                    alert('예약 취소 되었습니다.');
	                    $('#closeModal').modal('hide');
	                    location.reload();
	                    isEmpty = true;
	                } else {
	                    alert('예약 취소에 실패했습니다.');
	                }
	            },
	            error: function(xhr, status, msg){
	                console.log("상태값: " + status + " Http 에러 메시지: " + msg);
	            }
	        });
		});
		
		// 목록으로 이동하기
		$('.btn-toList').on('click', function(){
			"/meeting/list.do"
		});
	</script>
	<%@ include file="./common.jsp"%>

	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>