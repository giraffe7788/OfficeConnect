<%@page import="vo.MailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 현재 접속중인 사람의 사번 = 메일 보낸사람 정보
	String empNo = (String)session.getAttribute("empNo");
	MailVO mailVO = (MailVO)request.getAttribute("mailVO");	
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

<title>메일 쓰기</title>

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
					<div class="card shadow mb-4"">
						<div class="card-body">

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
									</div>

									<hr>

									<nav id="sidebar" style="padding: inherit;">
										<!-- 사이드바 내용 -->
										<ul class="list-unstyled">
											<li style="margin-bottom: 3px;"><a href="../mail/receiveList.do?isSend=1"
												style="text-decoration: none; color: inherit; background-color: transparent;">받은
													메일함</a></li>

											<li style="margin-bottom: 3px;"><a href="../mail/sendList.do?isSend=2"
												style="text-decoration: none; color: inherit; background-color: transparent;">보낸
													메일함</a></li>

										</ul>
									</nav>

									<hr>

								</div>



								<div class="col-lg-10">
									<h4>메일 쓰기</h4>

									<hr>

									<form action="../mail/insert.do" method="post" enctype="multipart/form-data">
										<!-- 접속중인 사번 숨겨놓고, 다음페이지 넘어갈때 보여주기 위함 -->
										<td><input type="hidden" name="empNo" value="<%= empNo %>"></td>
										<td><input type="hidden" name="mailSender" value="<%= empNo %>"></td>
										
										<div class="mb-3" style="width: 60%; display: flex; align-items: center;">
											<label for="recipient" class="form-label" style="flex: 1;">받는사람:</label> 
											<input type="email" class="form-control" id="recipient" name="mailReceiver" style="flex: 3; margin-right: 10px;">
										</div>

										<div class="mb-3">
											<label for="subject" class="form-label">제목:</label> 
											<input type="text" class="form-control" id="subject" name="mailTitle" required>
										</div>
										
										<div class="mb-3">
											<label for="message" class="form-label">본문:</label>
											<textarea class="form-control" id="message" name="mailCont" rows="12" required></textarea>
										</div>
										<div style="text-align: right;">
											<button type="submit" class="btn btn-primary"
												style="display: inline-block;">전송</button>
										</div>
									</form>

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

	<!-- 페이지 Wrapper 끝 -->

	<!-- 공통속성 설정 include -->

	<%@ include file="./common.jsp"%>

	<!-- 페이지 검색/조회 플러그인 -->
</body>

</html>