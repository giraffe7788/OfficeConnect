<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.CarBookVO"%>
<%@page import="vo.CarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	CarVO carVO = (CarVO)request.getAttribute("carVO");
	CarBookVO carBookVO = (CarBookVO)request.getAttribute("carBookVO");
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd");
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
					<h1 class="h3 mb-2 text-gray-800" style="text-align: center;">나의차량 예약</h1>
					<hr style="width: 70%;">

					<!-- DataTales Example -->
					<div class="card shadow mb-4"
						style="width: 70%; margin: auto; margin-top: 50px">
						<div class="card-body">

							<div class="row"
								style="display: flex; justify-content: space-around; height: 450px; align-items: center;">
								<%if(carBookVO != null && carVO != null){ %>
								<div class="col-lg-3"
									style="text-align: center; display: flex; flex-direction: column;">

									<img alt="차량이미지" src="<%=carVO.getcarImagePath()+carVO.getcarImageName() %>"
										style="width: 200px; height: 150px; margin: auto;"> <br>

									<div style="text-align: center;">법인공용차량</div>
									<br>
									<div style="text-align: center;">차량명 : <%=carVO.getCarName() %></div>
								</div>

								<div class="col-lg-8" style="height: 80%">

									<div class="table-responsive"
										style="position: relative; display: flex; height: 100%;">
										<div class="table-wrapper" style="width: 100%; height: 80%;">
											<table class="table table-bordered" id="dataTable"
												width="100%" cellspacing="0">
												<tr>
													<td>차량번호</td>
													<td><%=carVO.getCarNo() %></td>
												</tr>
												<tr>
													<td>예약날짜</td>
													<td><%=simpleDateFormat.format(carBookVO.getCarBookRent())%> ~ <%= simpleDateFormat.format(carBookVO.getCarBookReturn()) %></td>
												</tr>
												<tr>
													<td>예약사유</td>
													<td style="height: 160px"><%=carBookVO.getCarBookCont() %></td>
												</tr>
											</table>
										</div>

									</div>
								</div>
								<%} else {%>
									<div style = "font-size: 2em; margin: auto; ">예약 내역이 없습니다.</div>
								<%} %>
							</div>
							
							<a href="list.do"><button type="button" class="btn btn-primary btn-close"
                        	id="goList" style="display: flex; margin: auto;">목록으로</button></a>
							
							
							<div>
							<%if(carVO != null && carBookVO != null){ %>
								<button type="button" class="btn btn-primary btn-close"
								style="display: block; width: 100px; margin-bottom: 18px; position:relative; z-index:999; margin-left: 845px; margin-top: -100px; cursor:pointer;">취소</button>
								<%} %>
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
		
		<!-- 취소 모달창  -->
		<div id="closeModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">차량 예약 취소</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<span>차량 예약을 취소하시겠습니까?</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn cancel btn-default">취소</button>
						<button type="button" class="btn confirm btn-default">확인</button>
					</div>
				</div>
	
			</div>
		</div>		
		
		<script>
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
		
		//예약 취소 확정
		$('#closeModal .confirm').on('click', function(){
			//DB 차량 예약 정보 삭제
			$.ajax({
				url: 'delete.do',
				type: 'post',
				data: {'empNo': <%=currentEmpNo%>},
				success: function(res){
					if(res.isSuccess === 'ok'){
						alert('예약이 취소 되었습니다.');
						$('#closeModal').modal('hide');
						
						window.location.href = 'list.do';
						
					} else {
						alert('예약 취소에 실패했습니다.');
					}
				},
				error: function(xhr, status, msg){
					alert("에러임다,,")
				}
				
			});
			
		});
		
		
		
		
		
		</script>
		
		<!-- 공통속성 설정 include -->
		<%@ include file="./common.jsp"%>

		<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>