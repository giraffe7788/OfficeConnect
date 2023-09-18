<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.CarBookVO"%>
<%@page import="vo.CarVO"%>
<%@page import="vo.MeetingBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CarBookVO carBookVO = (CarBookVO)request.getAttribute("carBookVO");
	String currentEmpNo = (String)request.getAttribute("empNo");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	MeetingBookVO mtrVO = (MeetingBookVO) request.getAttribute("mtrVO");
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

<title>오피스커넥트</title>

    <!-- 아이콘 설정 -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
				<div class="container-fluid"">

					<!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">김영남님 환영합니다!</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

						<!-- 결재부분 -->
                        <div class="col-xl-9 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" style="font-size:1.3em">결재</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						<!-- 예약부분 -->
						<div class="col-xl-3 col-lg-7">
							<div style = "height : 17.7vh; margin-bottom:5.5%">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1" style="font-size : 1.3em">
                                                현재 예약중인 회의실</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                               		<!-- 내 회의실 예약 내용 들어갈 부분 -->
                               		<!-- 예약 없으면 "현재 예약된 회의실이 없습니다" 출력 있으면 회의실 번호 | 시간 | 인원 출력, 클릭시 이동 -->
                               		<%if(mtrVO == null) { %>
                                    <div id="noRsvMtr" style="margin-top : 10%">회의실 예약실 내역이 없습니다</div>
                                    <%} else { %>
                               		<table class="rsvMtr table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 3%">
                                    <thead>
                                        <tr role="row" id="data-list">
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 20%;">회의실</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 40%;">시간</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 20%;">인원</th> 
										</tr>
                                    </thead>
                                    
                                    
                                    <tbody class="rsvMtr">
                                        <tr>
                                            <td id="thMtr">회의실<%=mtrVO.getMtrNo()%></td>
                                            <td id="mtTime"><%=mtrVO.getMtrbookRent()%>:00 - <%=mtrVO.getMtrbookRtn()%>:00</td>
                                            <td id="mtPer"><%=mtrVO.getMtrbookPer() %></td>
                                        </tr>
                                    </tbody>
                                   
                                </table>
                                 <%} %>
                                </div>                              
                            </div>
                        </div>

                        <div style = "height : 17.7vh">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1" style="font-size : 1.3em">현재 예약중인 차량
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                </div>
                                                <div class="col">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                        <i class="fas fa-car fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                    <!-- 내 차량배차 예약 내용 들어갈 부분 -->
                               		<!-- 예약 없으면 "현재 예약된 차량이 없습니다" 출력 있으면 차량번호 | 시간 | 인원 출력, 클릭시 이동 -->
                               		<%if(carBookVO == null){ %>
                               		<div id="noRsvCar" style="margin-top : 10%;">현재 예약중인 차량이 없습니다</div>
                               		<%}else{ %>
                               		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 3%">
                                    <thead>
                                        <tr role="row">
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 35%;">차량번호</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="작성일: activate to sort column ascending"
												style="width: 65%;">예약날짜</th>
											</tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%=carBookVO.getCarNo() %></td>
                                            <td><%=sdf.format(carBookVO.getCarBookRent()) %> ~ <%=sdf.format(carBookVO.getCarBookReturn()) %></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <%} %>
									
                                </div>
                            </div>
                        </div>
						</div>
					</div>
					
                    <!-- Content Row -->
                    <div class="row">

						<!-- 받은메일 -->
                        <div class="col-lg-6 mb-4">

                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">받은메일</h6>
                                </div>
                                <!-- 받은메일 최근 5개 출력할거임 -->
                                <div class="card-body">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 3%">
                                    <thead>
                                        <tr role="row">
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 15%;">제목</th>
<!-- 													내용 길어지면 ...으로 뒤에 내용 짤리게 어케함? -->
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 55%;">내용</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 12%;">보낸사람</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 18%;">보낸날짜</th>
													</tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>안녕하세요 저는 김영남입니다</td>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여 여쭤봐도 되는지 검토해주실 수 있는지에 대하여 의견을 구하고자하는것에 대해 어떻게 생각하시는지 질문을 해봐도 되겠습니까</td>
                                            <td>김영남</td>
                                            <td>2023-09-11</td>
                                        </tr>
                                        <tr>
                                            <td>안녕하세요</td>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                            <td>2023-09-11</td>
                                        </tr>
                                        <tr>
                                            <td>안녕하세요</td>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                            <td>2023-09-11</td>
                                        </tr>
                                        <tr>
                                            <td>안녕하세요</td>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                            <td>2023-09-11</td>
                                        </tr>
                                        <tr>
                                            <td>안녕하세요</td>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                            <td>2023-09-11</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>

                        </div>
                        
                        <!-- 공지사항 -->
                        <div class="col-lg-3 mb-4">

                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
                                </div>
                                <!-- 공지사항 최근 5개 출력할거임 -->
                                <div class="card-body">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 6%">
                                    <thead>
                                        <tr role="row">
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 80%;">제목</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 20%;">작성자</th>
													</tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여 여쭤봐도 되는지 검토해주실 수 있는지에 대하여 의견을 구하고자하는것에 대해 어떻게 생각하시는지 질문을 해봐도 되겠습니까</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>안건이있는데 그 안건을 처리해주실 수 있는지에 대하여</td>
                                            <td>김영남</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>

                        </div>
                        
                        <!-- 자유게시판 -->
                        <div class="col-lg-3 mb-4">

                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">자유게시판</h6>
                                </div>
                                <!-- 자유게시판 최근 5개 글 출력할거임 -->
                                <div class="card-body">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="margin-top : 6%">
                                    <thead>
                                        <tr role="row">
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 80%;">제목</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="작성일: activate to sort column ascending"
															style="width: 20%;">작성자</th>
													</tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>우리집 고양이 사진 볼사람</td>
                                            <td>김영남</td>
                                        </tr>
                                        <tr>
                                            <td>아니 오늘 아침에 차 왤케막힘?</td>
                                            <td>김태영</td>
                                        </tr>
                                        <tr>
                                            <td>아 집가고싶다</td>
                                            <td>윤하</td>
                                        </tr>
                                        <tr>
                                            <td>아시는분들은 아시겠지만</td>
                                            <td>송찬중</td>
                                        </tr>
                                        <tr>
                                            <td>누나 근데 나는 이런느낌의 노래가 좋다, 그잖아 이렇게 신나는 노래에서 에너지를얻는다 해야되나?</td>
                                            <td>조영재</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </div>

                        </div>
                    </div>

				</div>
				<!-- 메인 Content 끝 -->

			</div>
			<!-- Content Wrapper 끝 -->

		</div>
		<!-- 페이지 Wrapper 끝 -->
		
	<!-- 공통속성 설정 include -->
    <%@ include file="./common.jsp" %>
</body>
</html>