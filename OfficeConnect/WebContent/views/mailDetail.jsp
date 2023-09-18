<%@page import="vo.MailVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MailVO mailVO = (MailVO) request.getAttribute("mailVO");
	
	String empNo = (String) session.getAttribute("empNo");
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

<title>메일 상세</title>

<!-- 아이콘 설정 -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- css 설정 -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/mail.css">
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
											<li style="margin-bottom: 3px;"><a href="../mail/receiveList.do?isSend=1"
												style="text-decoration: none; color: inherit; background-color: transparent;">받은
													메일함</a></li>

											<li style="margin-bottom: 3px;"><a href="../mail/sendList.do?isSend=2"
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
									<h4>받은 메일함</h4>
									<hr>
									<br>
									<form action="../mail/detail.do" method="post" enctype="multipart/form-data">
										<hr>
									    <h5 onclick="showMailContent('<%=mailVO.getMailNo()%>')"><font color="black"><b><%= mailVO.getMailTitle() %></b></font> </h5>
									    <br>
									    
									    <div><font color="black"><b>보낸 사람 :</b></font> <span class="rounded-border"><%=mailVO.getMailSenderName() %> <%=mailVO.getMailSenderPosit() %> [<%=mailVO.getMailSenderEmail() %>]</span></div>
										<div><font color="black"><b>받는 사람 :</b></font> <span class="rounded-border"><%=mailVO.getMailReceiverName() %> <%=mailVO.getMailReceiverPosit() %> [<%=mailVO.getMailReceiver() %>]</span></div>
										<div style="margin-top: 5px;">
										    <font color="black"><b>날짜 :</b> <%=mailVO.getMailSenddateFormat() %></font>
										</div>										
										<hr> 
										<br>
										<h5><font color="black"><b>본문 내용</b></font></h5>
										<textarea class="form-control" id="message" name="mailCont" rows="20" required><%=mailVO.getMailCont() %></textarea>
										
										<hr>
										<br>
									    <div> <li>이전 메일 : </li></div>
									    <div style="margin-top: 5px;"></div>	
									    <div> <li>다음 메일 : </li></div>
										</div>
										</div>
										<div style="position: absolute; top: 75px; right: 10px;">
											<a href="../mail/receiveList.do?isSend=1" class="btn btn-primary" id="btn btn-primary2" style="display: inline-block; margin-right: 10px;">목록</a>
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
	
</body>
</html>