<%@page import="vo.MailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MailVO> receiveMailList = (List<MailVO>) request.getAttribute("receiveMailList");
	String empNo = (String)request.getSession().getAttribute("empNo");
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

<title>받은 메일함</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- 드롭다운 자바스크립트  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-body">
							<!-- 메일 사이드바 시작 -->
							<div class="row" style="height: 100%">

								<div class="col-lg-2" style="border-right: 1px solid #ccc;">

									<div style="font-size: 1.8rem; text-align: center;">
										메 일 <img alt="메일" src="../images/mail.png"
											style="width: 35px; height: 40px;">
									</div>
									<hr>

									<div style="text-align: center;">
										<button type="submit" class="btn btn-outline-primary"
											onClick="window.location.href='../mail/insert.do'"
											style="display: inline-block;">메일쓰기</button>

										<button type="submit" class="btn btn-outline-info" onClick="window.location.href='mailWriteMine.jsp'"
											style="display: inline-block;">내게쓰기</button>
									</div>

									<hr>

									<div style="text-align: center;">

										<button type="submit" class="btn btn-outline-warning"
											onClick="#" style="display: inline-block;">
											안읽음 <span class="badge badge-danger badge-counter">1</span>
										</button>

										<button type="submit" class="btn btn-outline-danger"
											onClick="#" style="display: inline-block;">
											중요메일<span class="badge badge-danger badge-counter">3</span>
										</button>

									</div>

									<hr>

									<nav id="sidebar" style="padding: inherit;">
										<ul class="list-unstyled">
											<li style="margin-bottom: 3px;"><a href="../mail/receiveList.do?isSend=2"
												style="text-decoration: none; color: inherit; background-color: transparent;">받은
													메일함</a></li>

											<li style="margin-bottom: 3px;"><a href="../mail/sendList.do?isSend=1"
												style="text-decoration: none; color: inherit; background-color: transparent;">보낸
													메일함</a></li>

											<li style="margin-bottom: 3px;"><a href="../views/mailBoxMine.jsp"
												style="text-decoration: none; color: inherit; background-color: transparent;">내게
													쓴 메일함</a></li>

<!-- 											<li style="margin-bottom: 3px;"><a href="#" -->
<!-- 												style="text-decoration: none; color: inherit; background-color: transparent;">임시 -->
<!-- 													보관함</a></li> -->

											<li style="margin-bottom: 3px;"><a href="#"
												style="text-decoration: none; color: inherit; background-color: transparent;">휴지통</a></li>
										</ul>
									</nav>

									<hr>

									<div class="dropdown">
										<button class="btn btn-outline-Light dropdown-toggle"
											type="button" id="groupDropdown" data-bs-toggle="dropdown"
											aria-expanded="false" style="width: 100%">즐겨찾는 그룹</button>

										<ul class="dropdown-menu" aria-labelledby="groupDropdown"
											style="width: 100%">
											<li style="width: 100%"><a class="dropdown-item"
												href="#">영업 1팀</a></li>

											<li style="width: 100%"><a class="dropdown-item"
												href="#">마케팅팀</a></li>
											<!-- 다른 그룹 항목 추가 -->
										</ul>
									</div>


								</div>

								<!-- 메일 사이드바 종료  -->
								
								<!-- 메일 본문 -->

								<div class="col-lg-10">
									<h4> 받은 메일함</h4>

									<hr>

									<form>
										
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr role="row">
                                        	<th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="작성일: activate to sort column ascending"
                                             style="width: 20px;"></th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="작성일: activate to sort column ascending"
                                             style="width: 15%;">제목</th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTable"
                                             rowspan="1" colspan="1"
                                             aria-label="작성일: activate to sort column ascending"
                                             style="width: 55%;">본문</th>
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
                                        <%
										for (MailVO mail : receiveMailList) {
										%>
										<tr>
										    <td><input type="checkbox" class="mailCheckbox"></td>
										    <td> ㅈㅈ </td>
										    <td><%= mail.getMailCont() %></td>
										    <td><%= mail.getMailSender() %></td>
										    <td><%= mail.getMailSendDate() %></td>
										</tr>
										<%
										}
										%>
                                    </tbody>
                                </table>

										<div style="text-align: right; margin-top: -51px;">

											<button type="submit" class="btn btn-primary"
												style="display: inline-block;">삭제</button>
										</div>
									</form>

								</div>
								<!-- 메일 본문 종료 -->

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

	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->

	<%@ include file="./common.jsp"%>
    <!-- 페이지 검색/조회 플러그인 -->
    <script src="../vendor/datatables/jquery.dataTables.js"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="../js/demo/datatables-demo.js"></script>
	<!-- 페이지 검색/조회 플러그인 -->
	<script>
</script>
</body>

</html>